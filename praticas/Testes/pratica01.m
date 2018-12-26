clear all
close all

pkg image load
img = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\img2.jpg');
#lena = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\lena.jpg');

#lena =  imnoise (lena, "salt & pepper", 0.02);##como deixar a imagem sal e pimenta

#figure('name', 'Imagem: Lena com Efeito Sal e Pimenta')
#imshow(lena)

%lena = rgb2gray(lena);

%figure('name', 'Imagem: Lena com Efeito Sal e Pimenta P&B')
%imshow(lena)

#{
lena = double(lena);
final= lena;
for i = 3:size(lena,1)-2
  for j =3:size(lena,2)-2
    if i>=0 && i<210
    final(i,j) = ((lena(i-1,j-1) + lena(i-1,j) + lena(i-1,j+1)...
    +lena(i,j-1)+lena(i,j+1)+lena(i+1,j-1)+lena(i+1,j)+lena(i+1,j+1))/8)*2; 
    endif
  endfor
endfor
#}
img= double(img);
final= img;
for i = 3:size(img,1)-2
  for j =3:size(img,2)-2
    if (i>=0 && i<20) ||(i>=380 && i<400)||(j>=0 && j<20) ||(j>=380 && j<400)
    final(i,j,:) = ((img(i-1,j-1,:) + img(i-1,j,:) + img(i-1,j+1,:)...
    +img(i,j-1,:)+img(i,j+1,:)+img(i+1,j-1,:)+img(i+1,j,:)+img(i+1,j+1,:))/8)*1; 
    endif
  endfor
endfor
figure('name', 'final1')
imshow(uint8(final))
