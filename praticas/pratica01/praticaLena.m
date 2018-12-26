clear all
close all
pkg load image

im = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica01\lena.jpg');

figure(1)
imshow(im) %mostra a imagem original

im = rgb2gray(im);%transforma a imagem em escala cinza para ficar mais facil de trabalhar
figure(2)
imshow(im)%mostra a segunda imagem em escala cinza

cont = 255;
for j = 1:size(im, 2)
  for i = 1:size(im, 1)
    im(i,j) -=cont; 
    endfor
    cont--;
endfor

figure(3)
imshow(im)


