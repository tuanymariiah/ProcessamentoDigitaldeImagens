clear all
close all

pkg load image

textura = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\img3.jpg');
mascara = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\mascara2.jpg');
florosa = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\text5.jpg');
ass = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\ass.jpg');
figure('name','Imagem: Textura Original')
imshow(textura)

for i = 1:size(textura,1)
  for j = 1:size(textura,2)
  textura1(i,j,:) = textura((size(textura,2)+1)-j,i,:);
  #texturaInvertida(i,j,:) =  textura((size(textura,2))-i,j,:);
  endfor
endfor

figure('name','Imagem: Textura Invertida')
imshow(textura1)

for i = 1:size(textura1,1)
  for j = 1:size(textura1,2)
  textura2(i,j,:) =  textura1(i,(size(textura,2)+1)-j,:);
  #texturaInvertida(i,j,:) =  textura((size(textura,2))-i,j,:);
  endfor
endfor

figure('name','Imagem: Textura Invertida e Espelhada')
imshow(textura2)

for i = 1:size(textura2,1)
  for j = 1:size(textura2,2)
    if j>=190 && j<=210
    textura2(i,j,:) = textura2(i,j,:)+85; 
    endif
  endfor
endfor

figure('name','Imagem: Textura Invertida com Listras mais Claras')
imshow(textura2)
textura2 = double(textura2);
saida = textura2;
#saida= double(saida);

for i = 1:size(mascara,1)
  for j = 1:size(mascara,2)
    if mascara(i,j,:)>=0 && mascara(i,j,:)<=30
      saida(i,j,:) = mascara(i,j,:);
    elseif mascara(i,j,:)>=240 && mascara(i,j,:)<=255
      saida(i,j,:) = max(saida(i,j,:), florosa(i,j,:));
    elseif mascara(i,j,:)>=70 && mascara(i,j,:)<=85
    saida(i,j,:) = florosa(i,j,:);
    elseif mascara(i,j,:)>=155 && mascara(i,j,:)<=175
    saida(i,j,:) = ((textura2(i-1,j-1,:) + textura2(i-1,j,:) + textura2(i-1,j+1,:)...
    +textura2(i,j-1,:)+textura2(i,j+1,:)+textura2(i+1,j-1,:)+textura2(i+1,j,:)+textura2(i+1,j+1,:))/8);   
    #textura2(i,j,:) = textura2(i,j,:)*1.5; 
    endif
  endfor
endfor
final = saida;
final = min(ass, saida);


figure('name','Imagem: Textura Invertida com Listras mais Claras e com as bordas')
imshow(uint8(final))

