close all
clear all
pkg load image

im = imread('C:\PDI\feijaoPreto.jpeg');

imCinza = zeros(size(im,1)/2,size(im,2)/2);

y = 1;
x = 1;
for(i=1:2:size(im,1))
    for(j=1:2:size(im,2))
        imCinza(y,x) = im(i,j);
        x++;
    endfor
    y++;
endfor

figure('Name','Imagem pequena')
imshow(imCinza)

%distColumns = floor(size(imCinza,2)/5);
%distRows = floor(size(imCinza,1)/5);
%C:\Users\ehbs1\OneDrive\Documentos\Crop
%for(i=1:5)
%    for(j=1:5)
%        imCropada=zeros(distRows,distColumns);
%        contY = 1;
%        contX = 1;
%        for(ii=(distRows*i)-distRows+1:distRows*i)
%            for(jj=(distColumns*i)-distColumns+1:distColumns*j)
%                imCropada(contY,contX) = imCinza(ii,jj);
%                contX++;
%            endfor
%            contY++;
%        endfor
%        imwrite(imCropada,strcat('C:\Users\ehbs1\OneDrive\Documentos\Crop\',mat2str(i),',',mat2str(j),'.jpg'))
%    endfor
%endfor
