clear all 
close all
pkg load image
placa = imread('C:\Users\Tuany Mariah\Desktop\placa.jpg');
figure('name', 'imagem da placa original')
imshow(placa)

pcinza = rgb2gray(placa);

figure('name', 'imagem da placa tons de cinza')
imshow(pcinza)

pbw=pcinza;
for i= 1:size(pcinza, 1)
  for j= 1:size(pcinza, 2)
    if pcinza(i,j)>126
      pbw(i,j)= 1;
    else
    pbw (i,j)= 0; 
    endif
  endfor
endfor
figure('name', 'imagem da placa binarizada')
imshow(pbw, [0 1])