close all
clear all

im = imread('C:/PDI/graosBaixoContraste.png');
figure('Name','Imagem original');
imshow(im)

imGray = rgb2gray(im);
figure('Name','Imagem original em intensidades de cinza');
imshow(imGray)

figure('Name','Histograma original');
imhist(imGray)

vHist = imhist(imGray);

vHistL(1,:) = vHist(:,1);


for(i=1:256)
  if(vHistL(i)!=0) %tem pixels dessa intensidade i
    menorIntensidade = i;
    break;
  endif
endfor

menorIntensidade

for(i=256:-1:1)
  if(vHistL(i)!=0) %tem pixels dessa intensidade i
    maiorIntensidade = i;
    break;
  endif
endfor

maiorIntensidade

novoIntervalo = 256/(maiorIntensidade-menorIntensidade+1)

novoIntervalo = floor(novoIntervalo) %arredondamento para baixo
%novoIntervalo = ceil(novoIntervalo) %arredondamento para cima

%vHistAC = zeros(1,256);
cont = 1;
intensidadeNova = 1;
for(i=menorIntensidade:maiorIntensidade)
  vHistAC(1,cont) = i;
  vHistAC(2,cont) = intensidadeNova;

  intensidadeNova = intensidadeNova + novoIntervalo;
  cont++; %quantidade de colunas da matriz de mapeamento
endfor

figure('Name','vHistAC');
plot(vHistAC)

imAC = imGray;
for(i=1:size(imGray,1))
  for(j=1:size(imGray,2))
    for(k=1:(cont-1))
      if(imAC(i,j)==vHistAC(1,k))
        imAC(i,j) = vHistAC(2,k); %onde k � o �ndice do histograma alargado que representa a nova intensidade
      endif
    endfor
  endfor
endfor

figure('Name','Imagem alargada');
imshow(imAC)
figure('Name','Novo histograma');
imhist(imAC)








