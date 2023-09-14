% Program to calculate metric Q based on the paper by Zhu and Milanfar
% Author - U. A.
% 09.2023

clear all;
close all;

% Read Image
I = imread("barbara.bmp");

% Converting image to YCbCr colorspace
I = rgb2ycbcr(I);

% Extracting only luminance channel (Y)
I = I(:, :, 1);

% Applying three different blur kernels 
I_blurry_1 = imgaussfilt(I, 1.5, "FilterSize", 23);
I_blurry_2 = imgaussfilt(I, 2.5, "FilterSize", 23);
I_blurry_3 = imgaussfilt(I, 3.5, "FilterSize", 23);

% Setting delta value to 0.001 (As in original paper)
delta = 0.001;

% Calculate metric Q for original image
Q_original = calculateQMetric(I, delta);

% Calculate metric Q for blurry images
Q_blurry_1 = calculateQMetric(I_blurry_1, delta);
Q_blurry_2 = calculateQMetric(I_blurry_2, delta);
Q_blurry_3 = calculateQMetric(I_blurry_3, delta);
