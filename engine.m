% Program to calculate metric Q based on the paper by Zhu and Milanfar
% Author - U. A.
% 09.2023

clear;
close all;

% Read Image
I = imread("barbara.bmp");

% Converting image to YCbCr colorspace
I = rgb2ycbcr(I);

% Extracting only luminance channel (Y)
I = I(:, :, 1);

% Calculating the size of the image
[H, W] = size(I);

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

% Getting position for the labels
pos_x = H;
pos_y = W - 180;

I_with_text = insertText(I, [pos_x pos_y], Q_original, ...
                "BoxOpacity",0.3,"FontSize",17);

Ib1_with_text = insertText(I_blurry_1, [pos_x pos_y], Q_blurry_1, ...
                "BoxOpacity", 0.3, "FontSize",17);

Ib2_with_text = insertText(I_blurry_2, [pos_x pos_y], Q_blurry_2, ...
                "BoxOpacity", 0.3, "FontSize",17);
Ib3_with_text = insertText(I_blurry_3, [pos_x pos_y], Q_blurry_3, ...
                "BoxOpacity", 0.3, "FontSize",17);

% Montaging images in counter clockwise order
montage({I_with_text, Ib1_with_text, Ib3_with_text, Ib2_with_text});
title('Metric Q with different blur parameters');