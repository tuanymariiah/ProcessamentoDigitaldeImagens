clear all
close all
pkg load image

im = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica05\mulherNeg.jpg');
#figure('Name','Imagem Original: Mulher em Negativo')
#imshow(im)

roi = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica05\ROI_circular.jpg');
roi1 = zeros(size(roi,1),size(roi,2));

%%binarizando ROI
for i = 1:size(roi1,1)
  for j = 1: size(roi1, 2)
    if roi(i,j)< 128
      roi1(i,j) = 0;
    else
      roi1(i,j) = 1;
    endif
  endfor
endfor
%figure('Name','Imagem ROI binarizada')
%imshow(roi)

imOpArit = im.* roi1;

#figure('Name','Imagem ROI binarizada')
#imshow(imOpArit)

imBackG = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica05\flores.jpg');
#figure('Name','Imagem Flores')
#imshow(imBackG)

imOperConj = max(imOpArit, imBackG);

#figure('Name','Imagem: Operacao com Conjuntos - Uniao')
#imshow(imOperConj)

imOperP2P = 255- imOperConj;

#figure('Name','Imagem: Operação Ponto a Ponto - Negativo')
#imshow(imOperP2P)

for i = 1:size(imOperP2P, 1)
  for j = 1:size(imOperP2P,2)
    imTGeo(i,j,:) = imOperP2P(i,(size(imOperP2P,2)+1)-j,:);
  endfor
endfor

#figure('Name','Imagem Espelhada: Transformacao Geometrica – Espelhamento Horizontal')
#imshow(imTGeo)

imSaida = zeros(size(im, 1), size(im, 2), 3);
x=0;
for i = 1:size(imTGeo,1)
  for j = 1: 1:size(imTGeo,2)
    if roi1(i,j) ==0
      imSaida(i,j, :) = 255 -imTGeo(i,j,:);
      else
      x = size(imTGeo,2)-j;
      imSaida = 255 - imOpArit;
    endif
  endfor
endfor
figure('Name','Imagem Teste')
imshow(uint8(imSaida))
imwrite(imSaida, 'C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica05\saida.jpg')
