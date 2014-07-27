function [fx, fy, ft] = CalcDerivatives(im1, im2)

% define masks
hx = [-1 0 1; -2 0 2; -1 0 1] / 8;
hy = hx';
ht = ones(3) / 9;

% calculate the (average) derivatives
fx = (conv2(im1, hx) + conv2(im2, hx)) / 2;
fy = (conv2(im1, hy) + conv2(im2, hy)) / 2;
ft = conv2(im2, ht) - conv2(im1, ht);

% return same size as inputs
fx = fx(2:size(fx, 1) - 1, 2:size(fx, 2) - 1);
fy = fy(2:size(fy, 1) - 1, 2:size(fy, 2) - 1);
ft = ft(2:size(ft, 1) - 1, 2:size(ft, 2) - 1);
