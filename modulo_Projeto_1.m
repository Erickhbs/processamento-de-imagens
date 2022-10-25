clear all
close all
pkg load image

imBase = imread('C:\PDI\feiajoTeste.jpeg');

figure('name', 'imagem original')
imshow(imBase)


%tranformando em tons de cinza para melhor vizualização do grão
imCinza = rgb2gray(imBase);
figure('name','histograma de cinza')
imhist(imCinza)
figure('name','semnte em tons de cinza')
imshow(imCinza)

%vale = ;
%imTeste = imBase;
%for(i=1:1:size(imBase,1))
%  for(j=1:1:size(imBase,2))
%    if(imBase(i,j)>vale)
%      imTeste(i,j) = 255;
%    else
%      imTeste(i,j) = 0;
%    endif
%  endfor
%endfor

%figure('name','mascara em fundo branco')
%imshow(imCinza)


