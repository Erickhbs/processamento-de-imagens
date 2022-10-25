clear all
close all


for(i=1:60)
  for(j=1:256)
    imDegrade(i,j) = uint8(0);
  endfor
endfor

figure(1)
imshow(imDegrade)

%imDegrade = uint8(zeros(60,256));


%for(i=1:60)
  for(j=1:256)
    imDegrade(:,j) = uint8(j-1);
  endfor
%endfor

figure('Name','Imagem em degradê')
imshow(imDegrade)

im = imread('D:\EAJ\2022\2022_2\PDI\Aulas\Aula 1-Introd\Lena.jpg');
figure('Name','Lena original');
imshow(im)

%transformar para escalas de cinza
im2 = uint8(zeros(size(im,1),size(im,2)));

tic
for(i=1:size(im,1))
  for(j=1:size(im,2))
    im2(i,j) = 0.3*im(i,j,1) + 0.59*im(i,j,2) + 0.11*im(i,j,3);
    % 0.3*R +0.59*G +0.11*B
  endfor
endfor
toc
figure('Name','Lena em escalas de cinza 1');
imshow(im2)

tic
imR = im(:,:,1);
imG = im(:,:,2);
imB = im(:,:,3);

%for(i=1:size(im,1))
%  for(j=1:size(im,2))
    im2 = 0.3*imR + 0.59*imG + 0.11*imB;
    % 0.3*R +0.59*G +0.11*B
%  endfor
%endfor
toc
figure('Name','Lena em escalas de cinza 2');
imshow(im2)

imDegrade1 = im2;
cont = (size(imDegrade1,2)/2)*-1;  %256 = metade da largura da imagem
for(j=1:size(imDegrade1,2))
  imDegrade1(:,j) = imDegrade1(:,j)+cont;
  cont++;
endfor
figure('Name','Lena em degrade 1');
imshow(imDegrade1);

imDegrade2 = im2;
cont = 0;  %256 = metade da largura da imagem
%cont = 1/(size(im,2)/2); %1/256 = 0.004
for(j=1:size(imDegrade2,2))
  imDegrade2(:,j) = imDegrade2(:,j)*cont;
  cont = cont + 0.004;
endfor
figure('Name','Lena em degrade 2');
imshow(imDegrade2);

valorC = input('Digite um percentual valor para clareamento: ');
valorC = ((valorC/100)+1);
valorE = input('Digite um percentual valor para escurecimento: ');
valorE = 1-(valorE/100);

tic
imClara1 = im2;
for(j=1:size(imDegrade2,2))
  imClara1(:,j) = imClara1(:,j)*valorC;
endfor
figure('Name','Lena Clara 1');
imshow(imClara1);
imEscura1 = im2;
for(j=1:size(imEscura1,2))
  imEscura1(:,j) = imEscura1(:,j)*valorE;
endfor
figure('Name','Lena Escura 1');
imshow(imEscura1);
toc

tic
imClara1 = im2;
%for(j=1:size(imDegrade2,2))
  imClara1 = imClara1*valorC;
%endfor
figure('Name','Lena Clara 2');
imshow(imClara1);
imEscura1 = im2;
%for(j=1:size(imEscura1,2))
  imEscura1 = imEscura1*valorE;
%endfor
figure('Name','Lena Escura 2');
imshow(imEscura1);
toc


imwrite(imDegrade,'D:\EAJ\2022\2022_2\PDI\Aulas\Aula 1-Introd\saida1.jpg');
imwrite(imDegrade,'D:\EAJ\2022\2022_2\PDI\Aulas\Aula 1-Introd\saida2.png');




