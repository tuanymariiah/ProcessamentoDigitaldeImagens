clear all
close all
pkg load image
t = tic
im = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\lena.jpg');
size(im) %mostra o tamanho da imagem 'matriz' na janela de comando

figure('Name', 'Imagem Lena Original')
imshow(im) %mostra a imagem original

im = rgb2gray(im);%transforma a imagem em escala cinza para ficar mais facil de trabalhar
figure('Name', 'Imagem Lena Cinza')
imshow(im)%mostra a segunda imagem em escala cinza
size(im) 

%imCinza = zeros(512,512);
for i=1:size(im,1)
  for j=1:size(im, 2)
    imCinza(i,j) = im(i,j)+(im(i,j)* 0.4);%aumento de cada pixel da imagemem 40 porcento 
    endfor
endfor

figure('Name', 'Imagem Lena com aumento de 40% no pixel')
imshow(uint8(imCinza))

for i=1:size(im, 1)
  for j=1:size(im, 2)
  imCinza2(i,j) = im(i,j) - (im(i,j)*0.4);%diminuicao de cada pixel da imagemem 40 porcento 
  endfor
endfor


toc(t)
figure('Name', 'Imagem Lena com diminuicao de 40% no pixel')%tambem pode ser usado figure(1)
imshow(uint8(imCinza2))