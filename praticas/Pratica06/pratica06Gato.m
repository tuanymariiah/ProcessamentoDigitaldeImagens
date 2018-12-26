clear all
close all
pkg load image

gato = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\Pratica06\rgb6.jpg');
figure('name','Imagem Original')
imshow(gato)

r(:,:) = gato(:,:,1);
g(:,:) = gato(:,:,2);
b(:,:) = gato(:,:,3);

amar = uint8(zeros(size(gato,1), size(gato,2), size(gato,3)));
verm = uint8(zeros(size(gato,1), size(gato,2), size(gato,3)));
verd = uint8(zeros(size(gato,1), size(gato,2), size(gato,3)));
%::::::::::::::::::::::: Canal Amarelo ::::::::::::::::::::::: 
for i = 1:size(gato, 1)
  for j = 1:size(gato, 2)
    if ((r(i,j)>100) && (g(i,j)>100) && (b(i,j)<100))
      amar(i,j,:) = gato(i,j,:);
    else
      amar(i,j,:) = 255;
    endif
  endfor
endfor

figure('name','Imagem - Canal Amarelo')
imshow(amar)
%::::::::::::::::::::::: Canal Vermelho ::::::::::::::::::::::: 
for i = 1:size(gato, 1)
  for j = 1:size(gato, 2)
    if ((r(i,j)>100) && (g(i,j)<100) && (b(i,j)<100))
      verm(i,j,:) = gato(i,j,:);
    else
      verm(i,j,:) = 255;
    endif
  endfor
endfor
figure('name','Imagem - Canal Vermelho')
imshow(verm)

%::::::::::::::::::::::: Canal Verde ::::::::::::::::::::::: 

for i = 1:size(gato, 1)
  for j = 1:size(gato, 2)
    if ((r(i,j)<100) && (g(i,j)>100) && (b(i,j)<100))
      verd(i,j,:) = gato(i,j,:);
    else
      verd(i,j,:) = 255;
    endif
  endfor
endfor
figure('name','Imagem - Canal Verde')
imshow(verd)