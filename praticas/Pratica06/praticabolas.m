clear all
close all
pkg load image

bolas = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\Pratica06\bolas.jpg');
figure('name', 'Imagem Original')
imshow(bolas)

r = bolas(:,:,1);
g = bolas(:,:,2);
b = bolas(:,:,3);

bolamerela=bolas;

for i=1: size(bolas,1);
	for j=1: size(bolas,2);
		
		if(g(i,j,:) > 130 && b(i,j,:) < 240)
			bolamerela(i,j,1) = 255;
			bolamerela(i,j,2) = 255;
			bolamerela(i,j,3) = 0; 
		else
			bolamerela(i,j,1) = 255;
			bolamerela(i,j,2) = 255;
			bolamerela(i,j,3) = 255; 
		end
	endfor
endfor

figure('name', 'Imagem: Bola Amarela')
imshow(bolamerela)
bolciano= bolas;

for i=1: size(bolas,1);
	for j=1: size(bolas,2);
		
		if((r(i,j,:) > 130)&&b(i,j,:)<200)
			bolciano(i,j,1) = 0;
			bolciano(i,j,2) = 255;
			bolciano(i,j,3) = 255; 
		else
			bolciano(i,j,1) = 255;
			bolciano(i,j,2) = 255;
			bolciano(i,j,3) = 255; 
		end
	endfor
endfor

figure('name', 'Imagem: Bola Ciano')
imshow(bolciano)
bolmag = bolas;

for i=1: size(bolas,1);
	for j=1: size(bolas,2);
		
		if((b(i,j,:) > 130)&&g(i,j,:)<200)
			bolmag(i,j,1) = 255;
			bolmag(i,j,2) = 0;
			bolmag(i,j,3) = 255; 
		else
			bolmag(i,j,1) = 255;
			bolmag(i,j,2) = 255;
			bolmag(i,j,3) = 255; 
		end
	endfor
endfor

figure('name', 'Imagem: Bola Magenta')
imshow(bolmag)

todasbolas = bolas;
for i=1: size(bolas,1);
	for j=1: size(bolas,2);
		
		if((b(i,j,:) > 130)&&g(i,j,:)<200)
			todasbolas(i,j,1) = 255;
			todasbolas(i,j,2) = 0;
			todasbolas(i,j,3) = 255;
     elseif ((r(i,j,:) > 130)&&b(i,j,:)<200)
      todasbolas(i,j,1) = 0;
			todasbolas(i,j,2) = 255;
			todasbolas(i,j,3) = 255;
      elseif (g(i,j,:) > 130 && b(i,j,:) < 200)
			todasbolas(i,j,1) = 255;
			todasbolas(i,j,2) = 255;
			todasbolas(i,j,3) = 0;
      else
      todasbolas(i,j,1) = 255;
			todasbolas(i,j,2) = 255;
			todasbolas(i,j,3) = 255;
		end
	endfor
endfor

figure('name', 'Imagem:todas as bolas')
imshow(todasbolas)

bolasneg=255-bolas;

figure('name', 'Imagem:todas as Bolas Negativadas')
imshow(bolasneg)