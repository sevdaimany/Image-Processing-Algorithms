function mrf = gmrf_initLabeling(mrf)

    switch mrf.InitMethod
        case 'RAND'
            mrf = gmrf_initClassMaskRand(mrf);
        case 'MAP'
            mrf = gmrf_initClassMaskMAP(mrf);
    end

end