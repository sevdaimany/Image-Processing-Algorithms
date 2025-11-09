# Basic Image Processing Algorithms

This repository contains all the MATLAB projects and lab exercises for the **Basic Image Processing Algorithms (BIPA)** course (Fall 2024). The focus of this course is to implement fundamental image processing algorithms from scratch, moving from basic image manipulation to advanced topics like texture segmentation and image restoration.

## Key Topics Covered
* [cite_start]**Image Manipulation:** Reading, writing, geometric transforms, and color space manipulation [cite: 150-311, 2635-2934].
* [cite_start]**Image Enhancement:** Histogram analysis, linear and logarithmic stretching [cite: 1743-2233].
* [cite_start]**Filtering:** 2D convolution [cite: 1743-2233][cite_start], Fourier-domain filtering [cite: 1-149][cite_start], and texture filtering [cite: 312-571].
* [cite_start]**Feature Detection:** Hough Transform for lines and circles [cite: 931-1429, 2493-2520].
* [cite_start]**Image Restoration:** Simulating degradation (blur, noise) and implementing CLS and Wiener filters [cite: 572-930].
* [cite_start]**Image Segmentation:** k-means clustering [cite: 1430-1742][cite_start], Laws' texture energy [cite: 312-571][cite_start], and Markov Random Fields (MRF) [cite: 2234-2492].
* [cite_start]**Quantization:** Random and ordered dithering [cite: 150-311].

## Repository Contents

### `Lab01_MATLAB_Basics`
This lab serves as an introduction to MATLAB for image processing. It covers fundamental operations such as:
* [cite_start]Reading (`imread`), displaying (`imshow`), and saving (`imwrite`) images [cite: 2826-2828, 2838-2839].
* [cite_start]Converting images from RGB to grayscale (`rgb2gray`) [cite: 2836-2837].
* [cite_start]Performing geometric transformations like `flipud`, `fliplr`, and `imrotate` [cite: 2853-2856].
* [cite_start]Manipulating color channels using efficient array indexing [cite: 2862-2864].
* [cite_start]Implementing basic functions for thresholding and padding images [cite: 2871-2880, 2887-2902].

---

### `Lab02_Dithering_and_Color_Spaces`
This lab explores image quantization and color-based segmentation.
* **Dithering:** Implements two techniques to reduce color banding:
    * [cite_start]**Random Dithering:** Adds white noise to an image before thresholding [cite: 158-161, 184-188].
    * [cite_start]**Ordered Dithering:** Uses a recursive method to generate Bayer threshold maps ($D_n$) for high-quality dithering [cite: 170-177, 200-206].
* [cite_start]**Color Spaces:** Uses the HSV color space (`rgb2hsv`) to perform robust, color-based image segmentation to isolate specific objects (a rubber duck and a pinecone) from their backgrounds [cite: 251-265, 290-300].

---

### `Lab03_Convolution_and_Histograms`
This lab focuses on two core concepts: spatial filtering and intensity-based enhancement.
* [cite_start]**2D Convolution:** Implements a 2D convolution function (`myconv`) from scratch, handling zero-padding and arbitrary kernel sizes (both square and non-square) [cite: 1883-1887, 1933-1935, 1981-1986].
* **Histograms:**
    * [cite_start]Creates a function (`calc_hist_vector`) to compute an image's intensity histogram [cite: 2119-2122].
    * [cite_start]Uses histogram statistics to perform **linear histogram stretching** (contrast stretching) [cite: 2060-2064, 2079, 2156-2160].
    * [cite_start]Implements **logarithmic transformation** to enhance the dynamic range of low-contrast images [cite: 2111, 2197-2200].

---

### `Lab04_Hough_Transform`
This lab implements the Hough Transform, a powerful technique for detecting shapes and features in an image.
* [cite_start]**Hough Space:** Creates the Hough Transform for lines (`my_hough`) using the $r = x \cos \theta + y \sin \theta$ parameterization[cite: 949]. [cite_start]This function builds the 2D accumulator array (Hough space) by "voting" from edge-detected pixels [cite: 971-974, 1324-1330].
* [cite_start]**Peak Finding:** Implements **non-maximum suppression** (`non_max_sup`) to find the `k` most prominent peaks in the Hough space, which correspond to the strongest lines in the image [cite: 1185-1186, 1193-1200, 1356-1364].
* [cite_start]**Application:** The final script applies the functions to detect the yard lines on a football field [cite: 1386-1387, 1391-1427].

---

### `Lab05_Fourier_Transform`
This lab explores the frequency domain by implementing the Discrete Fourier Transform (DFT).
* [cite_start]**DFT:** Implements the 2D DFT (`my_fourier`) from its mathematical definition [cite: 15, 85-92].
* [cite_start]**Spectrum Analysis:** Creates a function (`fourier_parts`) to separate the complex DFT output into its **magnitude** and **phase** components [cite: 45-46, 104-108].
* [cite_start]**Frequency Filtering:** Demonstrates a practical application by creating a filter (`mask_fourier`) to remove periodic (sinusoidal) noise from an image[cite: 52, 57]. [cite_start]This is done by manually setting the noise-corresponding frequency spikes in the magnitude spectrum to zero [cite: 118-121].

---

### `Lab06_Laws_Texture_Filters`
This lab implements a classic method for texture analysis and segmentation using Laws' Texture Energy Measures.
* [cite_start]**Laws' Kernels:** Generates the 2D filter kernels by combining 1D vectors (e.g., Level, Edge, Spot) [cite: 326-328, 331-332, 521-526].
* [cite_start]**Training Phase:** Implements a "training" function that builds a texture model matrix by calculating the average texture "energy" (sum of squared filter responses) for a set of training images [cite: 336-337, 354-358, 531-535].
* [cite_start]**Recognition Phase:** Implements a "recognition" function that classifies each pixel of a new, composite-texture image by finding the closest matching texture model [cite: 408-411, 443-445, 544-551].
* [cite_start]**Smoothing:** Includes a **majority voting** filter to clean up noise and small "islands" in the final segmentation map [cite: 462-472, 488-491, 557-562].

---

### `Lab07_Image_Restoration`
This lab focuses on modeling image degradation and implementing filters to restore the original image.
* [cite_start]**Degradation:** Simulates a realistic degradation model by applying both a **motion blur kernel** and **additive Gaussian noise** to an image [cite: 582-585, 609, 688-714].
* **Restoration Filters:**
    * [cite_start]**Constrained Least Squares (CLS) Filter:** Implements the CLS filter, which is defined in the frequency domain and uses a regularization parameter $\alpha$ [cite: 679-680, 720-732, 745-746].
    * [cite_start]**Wiener Filter:** Implements the Wiener filter, which requires knowledge (or an estimation) of the noise and signal power spectra (NSPR) [cite: 681, 757-766, 773-777, 781-782, 793-819].
* [cite_start]**Artifact Reduction:** Implements an "edgetapering" function (`blur_edge`) to blur image boundaries before filtering, significantly reducing ringing artifacts [cite: 853-861, 865-879].

---

### `Lab08_k-means_Clustering`
This lab implements the k-means clustering algorithm and applies it to image segmentation.
* **Algorithm:** Implements the complete k-means algorithm (`mykmeans`) from scratch, including:
    1.  [cite_start]**Initialization:** Equidistantly selecting initial cluster centroids [cite: 1448, 1548-1552, 1558-1559].
    2.  [cite_start]**Assignment Step:** Assigning each data point to the nearest centroid [cite: 1450, 1581-1585].
    3.  [cite_start]**Update Step:** Recalculating centroids as the mean of their assigned points [cite: 1452, 1603-1612].
* **Application:**
    * First, tests the algorithm on the 2D Fisher's Iris dataset.
    * [cite_start]Second, adapts the algorithm for **color-based image segmentation** by reshaping the 3D RGB image into a 2D `(pixel_count, 3)` matrix, clustering the colors, and then reshaping the result back into an image [cite: 1665-1678, 1724-1734].

---

### `Lab09_MRF_Segmentation`
This lab implements a powerful and robust image segmentation technique using Markov Random Fields (MRF).
* **Energy Function:** The segmentation is framed as an energy minimization problem, combining:
    * [cite_start]A **Posterior Term:** The likelihood of a pixel belonging to a class, modeled as a Gaussian distribution based on sample regions [cite: 2270-2274, 2294-2295, 2317-2322].
    * [cite_start]A **Prior Term:** A neighbor-dependent term that penalizes different labels in a pixel's neighborhood ($\beta$) [cite: 2276-2279, 2294, 2296].
* [cite_start]**Initialization:** Implements both random initialization and a more informed **Maximum a Posteriori (MAP)** initialization [cite: 2281-2287, 2382-2385].
* [cite_start]**Optimization:** Implements the **Modified Metropolis Dynamics (MMD)** algorithm, a simulated annealing-based approach, to iteratively find the minimal-energy (optimal) segmentation [cite: 2327-2333, 2413-2440].

---

### `Project01_Scanner`
This project folder contains work related to a document scanner application. The provided file demonstrates the use of a **Hough Transform for Circles** to detect and localize circular marks (like multiple-choice bubbles) on a document. [cite_start]The accompanying "Hough space" image visualizes the 3D accumulator for circle centers and radii [cite: 2493-2519].

---

### `Project02_Segmentation`
This project implements a multi-stage pipeline to restore and segment distorted drone footage. [cite_start]All major components are implemented from scratch without relying on high-level built-in MATLAB functions [cite: 2527-2529, 2571-2572, 2578].
* [cite_start]**Image Restoration:** Restores the blurred input image using **Richardson-Lucy (R-L) deconvolution**[cite: 2539]. [cite_start]The motion blur kernel for each image is derived from simulated IMU sensor data (theta and len) [cite: 2537, 2583-2584]. [cite_start]The iterative R-L algorithm ($\hat{u}^{(t+1)}=\hat{u}^{(t)}\cdot(\frac{d}{\hat{u}^{(t)}\otimes P}\otimes P^{*})$) is implemented in the **frequency domain** for efficiency [cite: 2591, 2602-2603].
* [cite_start]**Contrast Enhancement:** Applies a from-scratch implementation of the **Wallis filter** to enhance local contrast in the restored image[cite: 2540, 2605].
* [cite_start]**Texture Segmentation:** Uses **Laws' Texture Energy filters** to classify pixels into semantic classes (e.g., grass, trees, cars)[cite: 2541]. [cite_start]Texture samples are manually fabricated from the restored image to train the filter[cite: 2611].
* [cite_start]**Post-Processing:** Refines the final segmentation map using **majority voting** to remove noise[cite: 2543].
* [cite_start]**Object Counting:** Isolates specific classes (e.g., cars) into a binary mask and uses `regionprops` to count and locate each "blob" [cite: 2545, 2555-2556, 2622].