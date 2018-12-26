clear all
close all
clc

Lena = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\lena.jpg');
figure('NAME','Lena'),imshow(Lena);

%------------------Rota��o----------------------------------------

%-------Lena-Rotacionada-para-a-Esquerda--------------------------

for i=1:size(Lena,1)
  for j=1:size(Lena,2)
    LenaRotEsquerda(i,j,:) = Lena(j,(size(Lena,1)+1)-i,:);
  end
end
 
figure('NAME','Lena Rotacionada para a Esquerda'),imshow(LenaRotEsquerda);

%-------Lena-Rotacionada-para-a-Direita--------------------------

for i=1:size(Lena,1)
  for j=1:size(Lena,2)
    LenaRotDireita(i,j,:) = Lena((size(Lena,2)+1)-j,i,:);
  end
end
 
figure('NAME','Lena Rotacionada para a Direita'),imshow(LenaRotDireita);


%-----------------Espelhamento-------------------------------------

%-----------------Espelhamento-Horizontal--------------------------

for i=1:size(Lena,1)
  for j=1:size(Lena,2)
    LenaEspHorizontal(i,j,:) = Lena(i,(size(Lena,2)+1)-j,:);
  end
end
 
figure('NAME','Lena Espelhada Horizontalmente'),imshow(LenaEspHorizontal);

%-----------------Espelhamento-Verticalmente--------------------------

for i=1:size(Lena,1)
  for j=1:size(Lena,2)
    LenaEspVertical(i,j,:) = Lena((size(Lena,1)+1)-i,j,:);
  end
end
 
figure('NAME','Lena Espelhada Verticalmente'),imshow(LenaEspVertical);



for i=1:size(Lena,1)
  for j=1:size(Lena,2)
    LenaR(i,j,:) = Lena(j,i,:);
  end
end
 
figure('NAME','Lena Espelhada Diagonalmente'),imshow(LenaR);

