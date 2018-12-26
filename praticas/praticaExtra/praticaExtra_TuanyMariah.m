clear all
close all
pkg load image

semente = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\praticaExtra\semente (2).jpeg');
figure('name', 'Semente Original')
imshow(semente)

semente = rgb2gray(semente);

figure('name', 'Semente Cinza')
imshow(semente)

figure('name', 'Histograma da Semente')
imhist(semente)

%::::::::::::::::::::::::::::::::::::: Feijao Preto ::::::::::::::::::::::::::::::::::::: 
for i = 1:size(semente, 1)
  for j = 1:size(semente,2)
    if semente(i,j) > 4 && semente(i,j) < 70
      mascaraFP(i,j)=1;
      else
      mascaraFP(i,j)=0;
    endif
  endfor
endfor
figure('name', 'Mascara da Semente')
imshow(mascaraFP)
imwrite(mascaraFP,'C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\praticaExtra\sementefeijaopreto.jpg');


% Calculo do Percentual de area: feijao preto
branco = 0; %
totalPx = 0;%Area Total da imagem.

for i=1: size(semente,1);
  for j=1: size(semente,2);
   if(mascaraFP(i,j) == 1)
      branco = branco+1;
   end
   totalPx = totalPx+1;
   
   areatotal = (branco * 100)/totalPx; %Regra de 3 simples.
  endfor
endfor
%figure('name', 'Area da semente'),imshow(mascaraFP);
title(strcat('Percentual de Area Ocupada do Gr�o de Feijao Preto: ',mat2str(areatotal),'%')); %Resultado

%::::::::::::::::::::::::::::::::::::: Feijao Verde :::::::::::::::::::::::::::::::::::::

%imwrite(semente,'C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\praticaExtra\sementepeb.jpg');
for i = 1:size(semente, 1)
  for j = 1:size(semente,2)
    if semente(i,j) > 140
      mascaraFV(i,j)=0;
      else
      mascaraFV(i,j)=1;
    endif
  endfor
endfor
figure('name', 'Mascara da Semente: Feijao Verde')
imshow(mascaraFV)

% Calculo do Percentual de area: feijao verde
branco = 0; %
totalPx = 0;%Area Total da imagem.

for i=1: size(semente,1);
  for j=1: size(semente,2);
   if(mascaraFV(i,j) == 0)
      branco = branco+1;
   end
   totalPx = totalPx+1;
   
   areatotal = (branco * 100)/totalPx; %Regra de 3 simples.
  endfor
endfor

title(strcat('Percentual de Area Ocupada do Grao de Feijao Verde: ',mat2str(areatotal),'%')); %Resultado
