clear all %fechar todas as variáveis
close all %fechar as janelas abertas

op='s';

while (op=='s')
  numero = input("Digite a porcentagem para escurecer/clarear a imagem: ");
  if(numero>0)
    val =(numero/100)+1;
  else
    val =1-abs(numero/100);
  endif  
  val
  im = imread('D:\EAJ\2021\2021.2\PDI\Aulas\Aula 2-Imagens Coloridas\negativo.jpg');
  figure('Name','Imagem Original')
  imshow(im)

  im2=uint8(im * val);
  figure('Name','Imagem Transformada')
  imshow(im2)

  numero = input("Digite uma nova porcentagem para escurecer/clarear a imagem: ");
  if(numero>0)
    val =(numero/100)+1;
  else
    val =1-abs(numero/100);
  endif  
  val
  im3=uint8(im2 * val);
  figure('Name','Imagem Transformada 2')
  imshow(im3)
  
  
  op = input("deseja mudar a luminosidade ainda??","s");
endwhile

printf("fim!")