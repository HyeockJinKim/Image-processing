function [pdf, cdf] = my_histogram(img)
% Make histogram (PDF, CDF) of image
% img : Grayscale image                             dimension ( X x Y )
% pdf : Probability Distribution Function of image  dimension ( 256 )
% cdf : Cumulative Distribution Function of image   dimension ( 256 )

pdf = zeros(1, 256);
[x, y] = size(img);

% Caculate PDF (Probability Distribution Function)
for i = 1:x
    for j = 1:y
        pdf(img(i, j)+1) = pdf(img(i, j)+1) + 1;
    end
end
pdf = pdf / sum(pdf);

% Caculate CDF (Cumulative Distribution Function)
cdf = pdf;
for i = 2:256
    cdf(i) = cdf(i) + cdf(i-1);
end

end