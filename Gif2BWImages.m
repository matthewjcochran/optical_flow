function [im1, im2] = Gif2BWImages(file)

im1 = imread(file, 1);
im2 = imread(file, 2);

im1 = double(rgb2gray(im1)) / 256;
im2 = double(rgb2gray(im2)) / 256; 

