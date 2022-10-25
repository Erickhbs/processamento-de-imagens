close all
clear all

im = imread('D:\EAJ\2022\2022_2\PDI\Aulas\Aula 3 - Sistema de PDI e Fundamentos\soja.jpg');
im2 = rgb2gray(im);
figure(1)
imshow(im2)

figure(2)
imhist(im2)

v = imhist(im2);

v2(1,:) = v(:,1);
