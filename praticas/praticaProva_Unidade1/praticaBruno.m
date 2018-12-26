clear all
close all
pkg load image

textura = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\text4.jpg');
mascara = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\mascara4.jpg');
flores = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\text5.jpg');
listras = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\listras2.jpg');
quadradin = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\text.jpeg');
assinatura = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\assinatura.jpg');


for i = 1:size(textura,1)
  for j = 1:size(textura,2)
    texturaRE(i,j,:) = textura(j,(size(textura,1)+1)-i,:);#textura rotacionada para esquerda
  endfor
endfor

%figure('name', 'textura rotacionada para a esquerda')
%imshow(texturaRE)
for i = 1:size(texturaRE,1)
  for j = 1:size(texturaRE,2)
    if i>=0 && i<=20
      texturaRE(i,j,:) = quadradin(i,j,:)*2;
      elseif i>=380 && i<=400
      texturaRE(i,j,:) = quadradin(i,j,:)*2;
      elseif j>=380 && j<=400
      texturaRE(i,j,:) = quadradin(i,j,:)*2;
      elseif j>=0 && j<=20
      texturaRE(i,j,:) = quadradin(i,j,:)*2;
    endif
  endfor
endfor

saida = texturaRE;
for i = 1:size(mascara,1)
  for j = 1:size(mascara,2)
    if mascara(i,j,:) >=0 &&mascara(i,j,:) <=36
      saida(i,j,:) = mascara(i,j,:);
      elseif mascara(i,j,:) >=210 &&mascara(i,j,:) <=220
      saida(i,j,:) = flores(i,j,:);
      elseif mascara(i,j,:) >=100 &&mascara(i,j,:) <=115
      saida(i,j,:) = 255-flores(i,j,:);
      elseif mascara(i,j,:) >=65 &&mascara(i,j,:) <=75
      saida(i,j,:) = listras(i,j,:);
    endif
  endfor
endfor

final = saida;
final = min(assinatura, saida);
figure(1)
imshow(final)
imwrite(final, 'C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\praticabruno.jpg')