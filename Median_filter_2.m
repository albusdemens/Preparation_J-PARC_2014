% Alberto Cereser, 21 May 2014
% Department of Physics, Technical University of Denmark
% alcer@fysik.dtu.dk
% This code reads images from an MCP detector, and for each calcualtes the
% median using the neighbouring ones

clc;
clear all;
close all;
i = 80;
file = sprintf('/Volumes/ALBERTO_HD/Data_ENGIN-X_May2013/AntonX/RoundRobin_Face6_1/Image 23_%05i.fits', i);
neighbour_1 = sprintf('/Volumes/ALBERTO_HD/Data_ENGIN-X_May2013/AntonX/RoundRobin_Face6_1/Image 23_%05i.fits', i-2);
neighbour_2 = sprintf('/Volumes/ALBERTO_HD/Data_ENGIN-X_May2013/AntonX/RoundRobin_Face6_1/Image 23_%05i.fits', i-1);
neighbour_3 = sprintf('/Volumes/ALBERTO_HD/Data_ENGIN-X_May2013/AntonX/RoundRobin_Face6_1/Image 23_%05i.fits', i+1);
neighbour_4 = sprintf('/Volumes/ALBERTO_HD/Data_ENGIN-X_May2013/AntonX/RoundRobin_Face6_1/Image 23_%05i.fits', i+2);
A = fitsread(file);
B = fitsread(neighbour_1);
C = fitsread(neighbour_2);
D = fitsread(neighbour_3);
E = fitsread(neighbour_4);

for i=1:4
    A_medfilt = medfilt2(A, [10 10]);
end

%Median obtained considering two positive and two negative neighbouring images
X(:,:,:,1) = A;
X(:,:,:,2) = B;
X(:,:,:,3) = C;
X(:,:,:,4) = D;
X(:,:,:,5) = E;
MEDIAN = median(X,4);

%Median considering one positive and one negative neighbouring image
Y(:,:,:,1) = A;
Y(:,:,:,2) = B;
Y(:,:,:,3) = E;
MEDIAN_1 = median(Y,4);

figure;
imagesc(A_medfilt);
figure;
imshow(MEDIAN_1,[])

for i=1:4
    MEDIAN_filtered = medfilt2(MEDIAN, [10 10]);
end

figure;
range = [1 0];
imagesc(MEDIAN_filtered);

%To isolate the extinction spots, we subtract the result of the median from
%the original image

Image_cleaned = A - MEDIAN;
Image_cleaned_1 = A - MEDIAN_1;
figure;
imagesc(Image_cleaned);
figure;
imagesc(Image_cleaned_1);


