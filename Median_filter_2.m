% Alberto Cereser, 21 May 2014
% Department of Physics, Technical University of Denmark
% alcer@fysik.dtu.dk
% This code reads images from an MCP detector, and for each calcualtes the
% median using the neighbouring ones

clc;
clear all;
close all;
k = 42;
j = 0;
lower_value = k-2;
higher_value = k+2;
number_images = 2733;
average_partial = 0;
for i=1:number_images,
   s = sprintf('/Volumes/ALBERTO_HD/Data_ENGIN-X_May2013/AntonX/RoundRobin_Face5_2/Image 18_%05i.fits',i);
   B = uint16(fitsread(s));
   A(:,:,:,i) = B/mean2(B);
   average_partial = average_partial+mean2(B);
end
mean_all_images = average_partial/number_images;

M = median(A,4)*mean_all_images;

image_original = sprintf('/Volumes/ALBERTO_HD/Data_ENGIN-X_May2013/AntonX/RoundRobin_Face5_2/Image 18_%05i.fits',k);
next_image = sprintf('/Volumes/ALBERTO_HD/Data_ENGIN-X_May2013/AntonX/RoundRobin_Face5_2/Image 18_%05i.fits',k+1);
IMAGE_ORIGINAL = fitsread(image_original);
NEXT_IMAGE = fitsread(next_image);
image_clean_threshold = zeros(512,512);
        
simple_subtraction = IMAGE_ORIGINAL - NEXT_IMAGE;
image_clean =  double(IMAGE_ORIGINAL) - double(M);

for m=1:512,
    for n = 1:512,
        pixel = image_clean(m,n);
        if pixel > 20
            image_clean_threshold(m,n) = image_clean(m,n);
        end
    end
end

figure;
imagesc(image_clean_threshold); colorbar;
%figure;
%imagesc(IMAGE_ORIGINAL);
figure;
imagesc(M);
