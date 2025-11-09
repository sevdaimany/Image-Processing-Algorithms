# Basic Image Processing Algorithms (BIPA2024)

This repository contains all the MATLAB projects and lab exercises for the **Basic Image Processing Algorithms (BIPA)** course (Fall 2024). The focus of this course is to implement fundamental image processing algorithms from scratch, moving from basic image manipulation to advanced topics like texture segmentation and image restoration.

Each folder in this repository represents a self-contained lab or project, complete with the necessary MATLAB functions and test scripts.

## Key Topics Covered
* **Image Manipulation:** Reading, writing, geometric transforms, and color space manipulation.
* **Image Enhancement:** Histogram analysis, linear and logarithmic stretching.
* **Filtering:** 2D convolution, Fourier-domain filtering, and texture filtering.
* **Feature Detection:** Hough Transform for lines and circles.
* **Image Restoration:** Simulating degradation (blur, noise) and implementing CLS and Wiener filters.
* **Image Segmentation:** k-means clustering, Laws' texture energy, and Markov Random Fields (MRF).
* **Quantization:** Random and ordered dithering.

## Repository Contents

### `Lab01_MATLAB_Basics`
This lab serves as an introduction to MATLAB for image processing. It covers fundamental operations such as:
* Reading (`imread`), displaying (`imshow`), and saving (`imwrite`) images.
* Converting images from RGB to grayscale (`rgb2gray`).
* Performing geometric transformations like `flipud`, `fliplr`, and `imrotate`.
* Manipulating color channels using efficient array indexing.
* Implementing basic functions for thresholding and padding images.

---

### `Lab02_Dithering_and_Color_Spaces`
This lab explores image quantization and color-based segmentation.
* **Dithering:** Implements two techniques to reduce color banding:
    * **Random Dithering:** Adds white noise to an image before thresholding.
    * **Ordered Dithering:** Uses a recursive method to generate Bayer threshold maps ($D_n$) for high-quality dithering.
* **Color Spaces:** Uses the HSV color space (`rgb2hsv`) to perform robust, color-based image segmentation to isolate specific objects (a rubber duck and a pinecone) from their backgrounds.

---

### `Lab03_Convolution_and_Histograms`
This lab focuses on two core concepts: spatial filtering and intensity-based enhancement.
* **2D Convolution:** Implements a 2D convolution function (`myconv`) from scratch, handling zero-padding and arbitrary kernel sizes (both square and non-square).
* **Histograms:**
    * Creates a function (`calc_hist_vector`) to compute an image's intensity histogram.
    * Uses histogram statistics to perform **linear histogram stretching** (contrast stretching).
    * Implements **logarithmic transformation** to enhance the dynamic range of low-contrast images.

---

### `Lab04_Hough_Transform`
This lab implements the Hough Transform, a powerful technique for detecting shapes and features in an image.
* **Hough Space:** Creates the Hough Transform for lines (`my_hough`) using the $r = x \cos \theta + y \sin \theta$ parameterization. This function builds the 2D accumulator array (Hough space) by "voting" from edge-detected pixels.
* **Peak Finding:** Implements **non-maximum suppression** (`non_max_sup`) to find the `k` most prominent peaks in the Hough space, which correspond to the strongest lines in the image.
* **Application:** The final script applies the functions to detect the yard lines on a football field.

---

### `Lab05_Fourier_Transform`
This lab explores the frequency domain by implementing the Discrete Fourier Transform (DFT).
* **DFT:** Implements the 2D DFT (`my_fourier`) from its mathematical definition.
* **Spectrum Analysis:** Creates a function (`fourier_parts`) to separate the complex DFT output into its **magnitude** and **phase** components.
* **Frequency Filtering:** Demonstrates a practical application by creating a filter (`mask_fourier`) to remove periodic (sinusoidal) noise from an image. This is done by manually setting the noise-corresponding frequency spikes in the magnitude spectrum to zero.

---

### `Lab06_Laws_Texture_Filters`
This lab implements a classic method for texture analysis and segmentation using Laws' Texture Energy Measures.
* **Laws' Kernels:** Generates the 2D filter kernels by combining 1D vectors (e.g., Level, Edge, Spot).
* **Training Phase:** Implements a "training" function that builds a texture model matrix by calculating the average texture "energy" (sum of squared filter responses) for a set of training images.
* **Recognition Phase:** Implements a "recognition" function that classifies each pixel of a new, composite-texture image by finding the closest matching texture model.
* **Smoothing:** Includes a **majority voting** filter to clean up noise and small "islands" in the final segmentation map.

---

### `Lab07_Image_Restoration`
This lab focuses on modeling image degradation and implementing filters to restore the original image.
* **Degradation:** Simulates a realistic degradation model by applying both a **motion blur kernel** and **additive Gaussian noise** to an image.
* **Restoration Filters:**
    * **Constrained Least Squares (CLS) Filter:** Implements the CLS filter, which is defined in the frequency domain and uses a regularization parameter $\alpha$.
    * **Wiener Filter:** Implements the Wiener filter, which requires knowledge (or an estimation) of the noise and signal power spectra (NSPR).
* **Artifact Reduction:** Implements an "edgetapering" function (`blur_edge`) to blur image boundaries before filtering, significantly reducing ringing artifacts.

---

### `Lab08_k-means_Clustering`
This lab implements the k-means clustering algorithm and applies it to image segmentation.
* **Algorithm:** Implements the complete k-means algorithm (`mykmeans`) from scratch, including:
    1.  **Initialization:** Equidistantly selecting initial cluster centroids.
    2.  **Assignment Step:** Assigning each data point to the nearest centroid.
    3.  **Update Step:** Recalculating centroids as the mean of their assigned points.
* **Application:**
    * First, tests the algorithm on the 2D Fisher's Iris dataset.
    * Second, adapts the algorithm for **color-based image segmentation** by reshaping the 3D RGB image into a 2D `(pixel_count, 3)` matrix, clustering the colors, and then reshaping the result back into an image.

---

### `Lab09_MRF_Segmentation`
This lab implements a powerful and robust image segmentation technique using Markov Random Fields (MRF).
* **Energy Function:** The segmentation is framed as an energy minimization problem, combining:
    * A **Posterior Term:** The likelihood of a pixel belonging to a class, modeled as a Gaussian distribution based on sample regions.
    * A **Prior Term:** A neighbor-dependent term that penalizes different labels in a pixel's neighborhood ($\beta$).
* **Initialization:** Implements both random initialization and a more informed **Maximum a Posteriori (MAP)** initialization.
* **Optimization:** Implements the **Modified Metropolis Dynamics (MMD)** algorithm, a simulated annealing-based approach, to iteratively find the minimal-energy (optimal) segmentation.

---

### `Project01_Scanner`
This project folder contains work related to a document scanner application. The provided file demonstrates the use of a **Hough Transform for Circles** to detect and localize circular marks (like multiple-choice bubbles) on a document. The accompanying "Hough space" image visualizes the 3D accumulator for circle centers and radii.

---

### `Project02_Segmentation`
This project implements a multi-stage pipeline to restore and segment distorted drone footage. All major components are implemented from scratch without relying on high-level built-in MATLAB functions.
* **Image Restoration:** Restores the blurred input image using **Richardson-Lucy (R-L) deconvolution**. The motion blur kernel for each image is derived from simulated IMU sensor data (theta and len). The iterative R-L algorithm ($\hat{u}^{(t+1)}=\hat{u}^{(t)}\cdot(\frac{d}{\hat{u}^{(t)}\otimes P}\otimes P^{*})$) is implemented in the **frequency domain** for efficiency.
* **Contrast Enhancement:** Applies a from-scratch implementation of the **Wallis filter** to enhance local contrast in the restored image.
* **Texture Segmentation:** Uses **Laws' Texture Energy filters** to classify pixels into semantic classes (e.g., grass, trees, cars). Texture samples are manually fabricated from the restored image to train the filter.
* **Post-Processing:** Refines the final segmentation map using **majority voting** to remove noise.
* **Object Counting:** Isolates specific classes (e.g., cars) into a binary mask and uses `regionprops` to count and locate each "blob".