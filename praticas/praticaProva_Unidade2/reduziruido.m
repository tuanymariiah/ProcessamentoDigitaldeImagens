clear all
close all
pkg load image

lena = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\lena.jpg');

lena =  imnoise (lena, "salt & pepper", 0.08);##como deixar a imagem sal e pimenta

figure('name', 'Imagem: Lena com Efeito Sal e Pimenta')
imshow(lena)

lena = rgb2gray(lena);

figure('name', 'Imagem: Lena com Efeito Sal e Pimenta P&B')
imshow(lena)

lena = double(lena);
final= lena;

for i = 3:size(lena,1)-2
  for j =3:size(lena,2)-2
    final(i,j) = ((lena(i-1,j-1) + lena(i-1,j) + lena(i-1,j+1)...
    +lena(i,j-1)+lena(i,j+1)+lena(i+1,j-1)+lena(i+1,j)+lena(i+1,j+1))/8); 
  endfor
endfor
figure('name', 'Imagem: Lena com Efeito Sal e Pimenta P&B')
imshow(uint8(final))
