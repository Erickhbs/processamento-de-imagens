clear all
close all

im = imread('C:\PDI\imagem.jpeg');
figure('name','completa')
imshow(im)

imr = im(:,:,1);
figure('name', 'vermelho')
imshow(imr)

img = im(:,:,2);
figure('name', 'verde')
imshow(img)

imb = im(:,:,3);
figure('name', 'azul')
imshow(imb)
