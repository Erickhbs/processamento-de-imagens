close all
clear all
pkg load image


im = imread('C:\PDI\feiajoTeste.jpeg');
%im = imread('D:\EAJ\2022\2022_2\PDI\Aulas\Aula 3 - Sistema de PDI e Fundamentos\testeHist.jpg');
figure('Name','Imagem original')
imshow(im)

im2 = rgb2gray(im);
%im2 = im;
figure('Name','Intensidades de cinza');
imshow(im2)

figure('Name','Histograma original');
imhist(im2)

%limiar fixo = 70
limiar = 70;
im3 = im2;
for(i=1:1:size(im2,1))
  for(j=1:1:size(im2,2))
    if(im2(i,j)<limiar)
      im3(i,j) = 255;
    else
      im3(i,j) = 0;
    endif
  endfor
endfor

%transformando a im3 de uint8 em bin�ria - M�SCARA
im4 = im2bw(im3);

figure('Name','Limiariza��o com limiar fixo (70)')
imshow(im3)

figure('Name','Limiariza��o com limiar fixo (70) 2');
imshow(im4)

im5 = im;
figure('Name','Gr�os c�pia')
imshow(im5)

for(i=1:size(im,1))
  for(j=1:size(im,2))
    if(im3(i,j)==255) %pixel de background (fundo)
      im5(i,j,:) = 255; %"apago" - pintar de branco
    endif
  endfor
endfor
figure('Name','Gr�os segmentados')
imshow(im5)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Corte autom�tico pelo limiar (vale)
%1 - vetor do histograma em linha
v = imhist(im2); %vetor em colunas
vHist(1,:) = v(:,1);
pico1 = 0;
posicaoPico1  = 0;
for(i=1:256)
  if(vHist(i)>pico1)
    pico1 = vHist(i);
    posicaoPico1 = i;
  endif
endfor
pico1
posicaoPico1

%normaliza��o da esq p/ direita
vHistED = vHist;
for(i=2:256)
  if(vHistED(i)<vHistED(i-1))
    vHistED(i) = vHistED(i-1);
  endif
endfor
figure('Name','Histograma Esq-Dir normalizado');
plot(vHistED)

%normaliza��o da direita p/ esq
vHistDE = vHist;
for(i=255:-1:1)
  if(vHistDE(i)<vHistDE(i+1))
    vHistDE(i) = vHistDE(i+1);
  endif
endfor
figure('Name','Histograma Dir-Esq normalizado');
plot(vHistDE)

modaED = mode(vHistED); %n�mero que mais se repete no vetor vHistED - MODA
for(i=1:256)
  if(vHistED(i)==modaED)
    posicaoModaED = i;
    break;
  endif
endfor

modaED
posicaoModaED

modaDE = mode(vHistDE); %n�mero que mais se repete no vetor vHistDE - MODA
for(i=256:-1:1)
  if(vHistDE(i)==modaDE)
    posicaoModaDE = i;
    break;
  endif
endfor

modaDE
posicaoModaDE

if(pico1==modaDE)
  pico2 = modaED;
  posicaoPico2 = posicaoModaED;
else
  pico2 = modaDE;
  posicaoPico2 = posicaoModaDE;
endif

pico2
posicaoPico2
vale=0
posicaoVale=0
if(posicaoPico1<posicaoPico2)
  vale = vHist(posicaoPico1);
  posicaoVale = posicaoPico1;
  for (i=posicaoPico1:posicaoPico2)
    if(vale > vHist(i))
      vale = vHist(i);
     posicaoVale = i;
    endif
  endfor
else
  vale = vHist(posicaoPico2);
  posicaoVale = posicaoPico2;
  for (i=posicaoPico2:posicaoPico1)
    if(vale > vHist(i))
      vale = vHist(i);
     posicaoVale = i;
    endif
  endfor
endif

vale
posicaoVale


%limiar autom�tico = posicaoVale
limiar = posicaoVale;
im6 = im2;
for(i=1:1:size(im2,1))
  for(j=1:1:size(im2,2))
    if(im2(i,j)<limiar)
      im6(i,j) = 255;
    else
      im6(i,j) = 0;
    endif
  endfor
endfor
figure('Name','Gr�os segmentados automaticamente - m�scara')
imshow(im6)

im7 = im;
for(i=1:size(im,1))
  for(j=1:size(im,2))
    if(im6(i,j)==255) %pixel de background (fundo)
      im7(i,j,:) = 255; %"apago" - pintar de branco
    endif
  endfor
endfor
figure('Name','Gr�os segmentados automaticamente')
imshow(im7)
