clear all 
close all

pkg load image

im = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica01\lena.jpg');

figure(1), imshow(im)

imCinza = rgb2gray(im);

figure('Name','imCinza'), imshow(imCinza);

%------------------------------Redução da img com funcao-----------------------%

tic();

imPeq = imresize(imCinza,0.25);
figure(4)
imshow(imPeq)
Reducao_da_img_com_funcao = toc();
Reducao_da_img_com_funcao

