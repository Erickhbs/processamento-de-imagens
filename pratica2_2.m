close all
clear all

im = imread('D:\EAJ\2022\2022_2\PDI\Aulas\Aula 2-Imagens Coloridas\rgb.jpg');
figure('Name','Imagem original');
imshow(im)

im4 = uint8(zeros(size(im,1),size(im,2),3)); %vermelha
for(i=1:size(im,1))
  for(j=1:size(im,2))
    if((im(i,j,1)>126) && (im(i,j,2)<126) && (im(i,j,3)<126))
      im4(i,j,:) = im(i,j,:);
    else
      im4(i,j,:) = 255;
    endif
  endfor
endfor  
figure('Name','Imagem vermelha')
imshow(im4)

im3 = uint8(zeros(size(im,1),size(im,2),3)); %verde
for(i=1:size(im,1))
  for(j=1:size(im,2))
    if((im(i,j,1)<126) && (im(i,j,2)>70) && (im(i,j,3)<126))
      im3(i,j,:) = im(i,j,:);
    else
      im3(i,j,:) = 255;
    endif
  endfor
endfor  
figure('Name','Imagem verde')
imshow(im3)

im2 = uint8(zeros(size(im,1),size(im,2),3)); %amarelo
for(i=1:size(im,1))
  for(j=1:size(im,2))
    if((im(i,j,1)>126) && (im(i,j,2)>126) && (im(i,j,3)<126))
      im2(i,j,:) = im(i,j,:);
    else
      im2(i,j,:) = 255;
    endif
  endfor
endfor  
figure('Name','Imagem amarelo')
imshow(im2)


im5 = uint8(zeros(size(im,1),size(im,2),3)); 
for(i=1:size(im,1))
  for(j=1:size(im,2))
    if((im(i,j,1)<60) && (im(i,j,2)<60) && (im(i,j,3)<60))
      im5(i,j,:) = im(i,j,:);
    else
      im5(i,j,1) = 0;
      im5(i,j,2) = 0;
      im5(i,j,3) = 255;
    endif
  endfor
endfor  
figure('Name','Imagem final')
imshow(im5)




