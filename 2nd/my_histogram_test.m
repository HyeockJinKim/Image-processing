img = imread('cameraman.tif');

[pdf, cdf] = my_histogram(img);

figure,

subplot(1, 1000, 1:470);
stem(0:255, pdf);
title('PDF of Image');

subplot(1, 1000, 530:1000);
stem(0:255, cdf);
title('CDF of Image');
