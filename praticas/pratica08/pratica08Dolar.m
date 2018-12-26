clear all
close all
pkg load image

dolar = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica8\dolar.jpg');
figure('name', 'Imagem Dolar - Original')
imshow(dolar)

dolargray = rgb2gray(dolar);

figure('name', 'Imagem dolar - Cinza')
imshow(dolargray)

im1 = zeros(size(img,1), size(img,2));
im2 = zeros(size(img,1), size(img,2));
im3 = zeros(size(img,1), size(img,2));
im4 = zeros(size(img,1), size(img,2));
im5 = zeros(size(img,1), size(img,2));
im6 = zeros(size(img,1), size(img,2));
im7 = zeros(size(img,1), size(img,2));
im8 = zeros(size(img,1), size(img,2));