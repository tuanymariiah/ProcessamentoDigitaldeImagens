clear all
close all
pkg load image

morangoo = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\morango.jpg');
figure('name','imagem original do morango')
imshow(morangoo)

r(:,:,:) = morangoo(:,:,1);
%figure('name','imagem original do R'),imshow(r);
g(:,:,:) = morangoo(:,:,2);
%figure('name','imagem original do G'),imshow(g);
b(:,:,:) = morangoo(:,:,3);
%figure('name','imagem original do B'),imshow(b);

%amar = uint8(zeros(size(morangoo,1), size(morangoo,2), size(morangoo,3)));
%verm = uint8(zeros(size(morangoo,1), size(morangoo,2), size(morangoo,3)));
%verd = uint8(zeros(size(morangoo,1), size(morangoo,2), size(morangoo,3)));
ciano = morangoo;
for i = 1:size(morangoo,1)
  for j = 1:size(morangoo,2)
    if(r(i,j,:)>100 && g(i,j,:)<50)
       ciano(i,j,1) = 255;
       ciano(i,j,2) = 0;
       ciano(i,j,3) = 0;
       else
       ciano(i,j,1) = 255;
       ciano(i,j,2) = 255;
       ciano(i,j,3) = 255;
    endif 
  endfor
endfor
figure('name','imagem teste vermelho')
imshow(ciano)