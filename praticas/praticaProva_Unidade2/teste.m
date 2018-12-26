clear all
close all
pkg load image

fig = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\praticaProva_Unidade2\prv2.jpg');
figure('name', 'Imagem Original')
imshow(fig)

r = fig(:,:,1);
g = fig(:,:,2);
b = fig(:,:,3);

red = uint8(zeros(size(fig,1), size(fig,2), size(fig,3)));
amr = uint8(zeros(size(fig,1), size(fig,2), size(fig,3)));
azl = uint8(zeros(size(fig,1), size(fig,2), size(fig,3)));
mag =  uint8(zeros(size(fig,1), size(fig,2), size(fig,3)));
t = uint8(zeros(size(fig,1), size(fig,2), size(fig,3)));
for i = 1:size(fig, 1)
  for j = 1:size(fig, 2)
    if r(i,j,:)>100&&b(i,j,:)>100 
      t(i,j,:) = 255;
    elseif (r(i,j,:)>100 &&g (i,j,:)>100)
      t(i,j,:) = 255;
     else 
      t(i,j,:) = 0;
    endif
  endfor
endfor
figure('Name', 'magenta e amarelo'), imshow(t);