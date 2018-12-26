clear all
close all
pkg load image
im = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\praticaProva_Unidade2\img01.jpg');
figure('name','imagem original')
imshow(im)

img =  imnoise (im, "salt & pepper", 0.800);##como deixar a imagem sal e pimenta

figure('name','imagem com efeito sal e pimenta')
imshow(img)


