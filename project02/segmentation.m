function segmented = segmentation(image, T_cell, model_name, train)
    if train == false
        MODEL = load(model_name).MODEL;
        display("[!] Loading the pretrained segmentation model.");
    else
        MODEL = training_phase_color(T_cell);
        display("[!] Training the segmentation.");
    end
    save(model_name, 'MODEL');
    ClassMap = recognition_phase_color(image, MODEL);
    ClassMap(ClassMap == 4) = 1;
    ClassMap(ClassMap == 5) = 3;
    ClassMap(ClassMap == 6) = 1;
    ClassMap(ClassMap == 7) = 3;

    window_size = 35; 
    segmented = majority_voting(ClassMap, window_size);
end
function H = laws_kernel(k)
    if k >=1 && k <= 9
        L = 1/6 * [1; 2; 1];
        E = 1/2 * [1; 0; -1];
        S = 1/2 * [1; -2; 1];
        kernels = [L, E, S];
        if k<=3
            H = L * kernels(:,k)';
        elseif k>=4 && k<=6
            H = E * kernels(:,k - 3)';
        else
            H = S * kernels(:,k - 6)';
        end
        
    else
        error("[!] K should be between 1 and 9.");
    end
end

function MODEL = training_phase_color(T_cell)
    N = length(T_cell); % Number of texture classes
    MODEL = zeros(N, 9, 3);

    for i = 1:N
        samples = T_cell{i}; % List of samples for texture type i
        num_samples = length(samples);
        texture_features = zeros(num_samples, 9, 3); % Features for all samples

        % Loop through each sample
        for s = 1:num_samples
            T = samples{s};
            for c = 1:3 
                T_channel = T(:, :, c); 
                for k = 1:9
                    H = laws_kernel(k);
                    A = conv2(T_channel, H, 'same');
                    A = A.^2;
                    texture_features(s, k, c) = sum(A(:)) / numel(T_channel);
                end
            end
        end

       MODEL(i, :, :) = mean(texture_features, 1);
    end
end


function ClassMap = recognition_phase_color(I, MODEL)
    [w, h, ~] = size(I);
    num_textures = size(MODEL, 1);
    ClassMap = zeros(w, h);
    BB = zeros(w, h, 9, 3); % 9 kernels, 3 color channels

    % Step 1: Filter image with each Laws kernel for each channel
    for c = 1:3
        for k = 1:9
            B = conv2(I(:, :, c), laws_kernel(k), 'same');
            BB(:, :, k, c) = conv2(B.^2, (1/(15*15)) * ones(15), 'same');
        end
    end

    % Step 2: Compare each pixel's feature vector with the model
    for i = 1:w
        for j = 1:h
            sum_abs_diff = zeros(1, num_textures);
            for k = 1:num_textures
                pixel_features = squeeze(BB(i, j, :, :)); % Size [9, 3]
                model_features = squeeze(MODEL(k, :, :)); % Size [9, 3]

                % Compute sum of absolute differences
                diff = abs(pixel_features - model_features);
                sum_abs_diff(k) = sum(diff(:)); % Sum over all kernels and channels
            end
            [~, index] = min(sum_abs_diff);
            ClassMap(i, j) = index;
        end
    end
end

function OUT = majority_voting(IN, w_dia)
    OUT = zeros(size(IN));
    for x = 1:w_dia:size(IN, 1)
        for y = 1:w_dia:size(IN, 2)
            start_x = x;
            end_x = min(x + w_dia - 1, size(IN, 1));
            start_y = y;
            end_y = min(y + w_dia - 1, size(IN, 2));
            selected_window = IN(start_x:end_x, start_y:end_y);
            Majority_value = mode(selected_window, 'all');
            OUT(start_x:end_x, start_y:end_y) = Majority_value;
        end
    end
end