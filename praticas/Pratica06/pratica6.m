clear all
close all
pkg load image
%::::::::::::::::::::::::::: QUESTAO 03 :::::::::::::::::::::::::::
soja = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\Pratica06\soja.jpg');
figure('name', 'Figura Original: SOJA')
imshow(soja)
%::::::::::::::::::::::::::: QUESTAO 04 :::::::::::::::::::::::::::
sojaCinza= rgb2gray(soja);
figure('name', 'SOJA CINZA')
imshow(sojaCinza)
figure('name', 'SOJA HISTOGRAMA DA SOJA CINZA')
imhist(sojaCinza)
%::::::::::::::::::::::::::: QUESTAO 05 :::::::::::::::::::::::::::

for i = 1:size(sojaCinza, 1)
  for j = 1:size(sojaCinza,2)
    if sojaCinza(i,j) > 100
      mascara(i,j)=0;
      else
      mascara(i,j)=1;
    endif
  endfor
endfor
figure('name', 'Mascara')
imshow(mascara)


%final = sojaCinza;
final= double(soja);
for i=1:size(sojaCinza,1)
  for j=1:size(sojaCinza,2)
    if(mascara(i,j,:)==0)
      final(i,j,:) = soja(i,j,:);
    else
      final(i,j,:) = 255;
    end
  end
end
    
figure('Name','Final'); 
imshow(uint8(final))