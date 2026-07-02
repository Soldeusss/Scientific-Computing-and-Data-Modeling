# Scientific Computing and Data Modeling

A collection of MATLAB projects demonstrating scientific computing techniques in computer vision, digital signal processing (DSP), statistical modeling, and experimental data analysis

This repository showcases numerical analysis, scientific visualization, statistical modeling, and technical documentation using MATLAB and LaTeX

## Repository Structure

### 1. Computer Vision and Image Processing
Scripts focused on manipulating image matrices, image analysis, and image compression concepts.
* **Feature Matching & Stitching:** Image stitching pipelines using SURF feature detection, geometric transformations, and alpha blending.
* **Spatial Filtering & Edge Detection (`Spatial_Filtering_EdgeDetection`):** Manual implementation of convolutional filters (Prewitt, Sobel, Canny) for edge detection and contrast clipping.
* **Color Space & Histograms (`colorSpace`):** RGB to HSV conversions and histograms.
* **Bit-Plane Slicing & Compression (`bitPlaneSlicing_compression`):** Analyzing JPEG compression and steganography techniques.

### 2. Signal Processing
Analyzing sensor data and acoustic signals to extract features over time.
* **EEG Data Analysis (`EEG-Data-Analysis`):** Processing raw physiological time-series data (`.csv`/`.mat`). Utilizes Fast Fourier Transforms (FFT), spectrograms, and bandpower extraction to analyze cognitive states across specific frequency bands (Delta, Theta, Alpha, Beta, Gamma).
* **Wave Analysis (`waveAnalysis`):** Conducted time-frequency analysis on real-world audio datasets in MATLAB to visualize and compare dynamic frequency shifts and power distributions.

### 3. Statistical Modeling and Regression
Modeling real-world experimental physics data and applying statistics.
* Implements Ordinary Least Squares (OLS) linear regression, error propagation, confidence intervals, and data visualization. 
* **Projects Included:**
  * Circuit Time Constants (`circuit_Time_constant`)
  * Charge-to-Mass Ratio (`helmholtz`)
  * Ideal Gas Law (`molsLab`)
  * Ohm's Law (`resistorLab`)

## Tech Stack
* **Languages:** MATLAB, LaTeX
* **Core Concepts:** Matrix Operations, Convolutional Filtering, Signal Processing, Regression Analysis, Statistical Modeling, Data Visualization.

## Sample Results

<img width="624" alt="Spectrogram analysis" src="https://github.com/user-attachments/assets/b232893b-0a63-4ae7-a0b4-24218bd17ea3" />

**Spectrogram & Frequency Analysis** — Visualizing complex time-series data. The top chart estimates the power spectral density of an audio signal, while the bottom spectrogram tracks how those frequency bands shift dynamically over time.

<img width="732" alt="Histogram comparison" src="https://github.com/user-attachments/assets/a31fc78a-842e-4219-9ba7-78f2c1a245b5" />

**Image Processing** — Pixel manipulation and distribution analysis. This compares a grayscale image with its negative counterpart, using histograms to visualize exactly how the pixel intensity distribution is inverted.

<img width="629" alt="OLS regression" src="https://github.com/user-attachments/assets/28615798-efa8-4383-88c6-d9afa342c5e9" />

**Statistical Modeling** — Least Squares Regression applied to experimental physics data. The model maps Voltage vs. Current (Ohm's Law) to determine the physical resistance from the slope of the line of best fit, calculated here at 976.85 Ω for Resistor 1.
