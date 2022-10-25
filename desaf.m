clear all
close all

im = imread('C:\PDI\imagem.jpeg');
figure('name','completa')
imshow(im)

%imr = im(:,:,1);
%figure('name', 'vermelho')
%imshow(imr)

%img = im(:,:,2);
%figure('name', 'verde')
%imshow(img)

%imb = im(:,:,3);
%figure('name', 'azul')
%imshow(imb)

imf = im(:, :, :);

%fundo branco

%for(i = 1: 1 : size(im, 1))
%  for(j = 1: 1 : size(im, 2))
%    if!((im(i, j, 1)>130)&&(im(i, j, 2)<130)&&(im(i, j, 3)<130))
%      imf(i, j, :) = 255;
%    endif
%  endfor
%endfor

%fundo preto(resolução mais rápida)binario

imf = ((im(:, :, 1)>130)&(im(:, :, 2)<130)&(im(:, :, 3)<130));
imf = im .* uint8(imf);

figure('name', 'final')
imshow(imf)
