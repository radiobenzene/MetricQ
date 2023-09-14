% Read image here
I = imread("barbara.bmp");

I = rgb2ycbcr(I);
I = I(:, :, 1);

I2 = imgaussfilt(I, 12.5, "FilterSize", 103);
imshow(I2);
Q = calculateQMetric(I, 0.001);

Q2 = calculateQMetric(I2, 0.001);