clear all
close all

pkg load image

im = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica05\lena.jpg');

%figure('Name', 'Imagem Original')
%imshow(im)

im = rgb2gray(im);
#figure('Name', 'Imagem Original em Tom de Cinza')
#imshow(im)

for i = 10:15
  for j = 1:size(im, 2)
    im(i, j) = 0;
    #im(20, j)=0;
  endfor
endfor

for i = 20:25
  for j = 1:size(im, 2)
    im(i, j) = 0;
    #im(20, j)=0;
  endfor
endfor

for i = 462:467
  for j = 1:size(im, 2)
    im(i, j) = 0;
    #im(20, j)=0;
  endfor
endfor

for i = 472:477
  for j = 1:size(im, 2)
    im(i, j) = 0;
    #im(20, j)=0;
  endfor
endfor

for i = 1:size(im, 1)
  for j = 472:477
    im(i, j) = 0;
    #im(20, j)=0;
  endfor
endfor
for i = 1:size(im, 1)
  for j = 462:467
    im(i, j) = 0;
    #im(20, j)=0;
  endfor
endfor
for i = 1:size(im, 1)
  for j = 20:25
    im(i, j) = 0;
    #im(20, j)=0;
  endfor
endfor
for i = 1:size(im, 1)
  for j = 10:15
    im(i, j) = 0;
    #im(20, j)=0;
  endfor
endfor
%figure('Name', 'Imagem Teste1')
%imshow(im)


figure('Name', 'Imagem com Bordas')
imshow(im)
imwrite(im,'C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica05\teste.jpg' )