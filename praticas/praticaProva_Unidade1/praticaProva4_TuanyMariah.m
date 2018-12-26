clear all
close all
pkg load image

textura = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\text.jpeg');
flores =  imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\text5.jpg');
mascara =  imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\mascara.jpeg');
assinatura = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\assinatura.jpg');
for i = 1:size(textura,1)
  for j = 1:size(textura,2)
  textura1(i,j,:) =  textura((size(textura,1)+1)-j,i,:);%espelhei
  endfor
endfor

for i = 1:size(textura1,1)
  for j = 1:size(textura1,2)
  textura2(i,j,:) = textura(i,(size(textura,1)+1)-j,:);
  endfor
endfor

for i = 1:size(textura2)
  for j = 1:size(textura2)
    if i>=0 && i<=30 
      textura2(i,j,:) = textura2(i,j,:)*2;
    elseif i>=370 && i<=400 
      textura2(i,j,:) = textura2(i,j,:)*2;
    elseif (j>=0 && j<=30) 
      textura2(i,j,:) = textura2(i,j,:)*2;
    elseif j>=370 && j<=400 
      textura2(i,j,:) = textura2(i,j,:)*2;
    endif
  endfor
endfor
textura2 = double(textura2);
saida = textura2;
for i = 1:size(mascara,1)
  for j = 1:size(mascara, 2)
    if mascara(i,j,:)>=0 && mascara(i,j,:)<=30
      saida(i,j,:) = mascara(i,j,:);
    elseif mascara(i,j,:)>=245 && mascara(i,j,:)<=255
      saida(i,j,:) = max(flores(i,j,:),textura2(i,j,:));
    elseif mascara(i,j,:)>=75 && mascara(i,j,:)<=85
      saida(i,j,:) = flores(i,j,:);
    elseif mascara(i,j,:)>=185 && mascara(i,j,:)<=195
      saida(i,j,:) = ((textura2(i-1,j-1,:) + textura2(i-1,j,:) + textura2(i-1,j+1,:)...
    +textura2(i,j-1,:)+textura2(i,j+1,:)+textura2(i+1,j-1,:)+textura2(i+1,j,:)+textura2(i+1,j+1,:))/8); 
    endif
  endfor
endfor

final = saida;
final = min(assinatura, saida);

imwrite(final, 'C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\test.jpg')
figure(1)
imshow(uint8(final))
