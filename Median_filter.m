% Alberto Cereser, 21 May 2014
% Department of Physics, Technical University of Denmark
% alcer@fysik.dtu.dk
% This code reads images from an MCP detector, and for each calcualtes the
% median using the neighbouring ones

clc;
clear all;
close all;
i = 10;
file = sprintf('/Volumes/ALBERTO_HD/Data_ENGIN-X_May2013/AntonX/RoundRobin_Face6_1/Image 23_%05.fits', i);
neighbour_1 = sprintf('/Volumes/ALBERTO_HD/Data_ENGIN-X_May2013/AntonX/RoundRobin_Face6_1/Image 23_%05.fits', i+1);
neighbour_2 = sprintf('/Volumes/ALBERTO_HD/Data_ENGIN-X_May2013/AntonX/RoundRobin_Face6_1/Image 23_%05.fits', i-1);
A = fitsread(file);
B = fitsread(neighbour_1);
C = fitsread(neighbour_2);
