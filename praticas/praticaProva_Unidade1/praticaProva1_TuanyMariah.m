clear all
close all

pkg load image

flores = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\flores.jpg');
mascara = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\mascara2.jpg');
listras = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\img3.jpg');
quadradin =  imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\img2.jpg');
textura =  imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\text4.jpg');
figure('name', 'Imagem Fundo')
imshow(flores)

for i = 1: size(flores, 1)
  for j = 1: size(flores, 2)
    imInvertida(i,j,:) = flores(i,(size(flores,2)+1)-j,:);
    #im(i,j,:) = flores((size(flores,2)+1)-i,j,:);
  endfor
endfor

figure('name', 'Invertida')
imshow(imInvertida)

for i = 1: size(imInvertida, 1)
  for j = 1: size(imInvertida, 2)
    %im(i,j,:) = flores(i,(size(flores,2)+1)-j,:);
    imCabecaBaixo(i,j,:) = flores((size(flores,2)+1)-i,j,:);
  endfor
endfor


figure('name', 'Cabeca para Baixo')
imshow(imCabecaBaixo)

for i = 1:size(imCabecaBaixo,1)
  for j = 1: size(imCabecaBaixo,2)
    if i >= 0 && i <= 20
    imComBorda(i,j,:) = 255 - listras(i, j,:);
    elseif i >= 380 && i <= 400
    imComBorda(i,j,:) = 255 - listras(i, j,:);
    elseif j >= 0 && j <= 20
    imComBorda(i,j,:) = 255 - listras(i, j,:);
    elseif j >= 380 && j <= 400
    imComBorda(i,j,:) = 255 - listras(i, j,:);
    elseif j >= 190 && j <= 220
    imComBorda(i,j,:) = 255 - listras(i, j,:);
    else
    imComBorda(i,j,:) = 255 - imCabecaBaixo(i,j,:);
    endif
  endfor
endfor

figure('name', 'Imagem com Borda')
imshow(imComBorda)
saida = imComBorda;
for i = 1: size(imComBorda,1)
  for j = 1: size(imComBorda,2)
    if mascara(i,j,:) <=60
      saida(i,j,:) = mascara(i,j,:); 
    elseif mascara(i,j,:)>=70 && mascara(i,j,:)<=85
      saida(i,j,:) = quadradin(i,j,:)/1.5;
     elseif mascara(i,j,:)>=230
     saida(i,j,:) = textura(i,j,:) * 1.5;
    endif
  endfor
endfor
figure('name', 'teste')
imshow(saida)
