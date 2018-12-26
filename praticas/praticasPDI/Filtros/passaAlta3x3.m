pkg load image

clear all
close all
% pratica de correlacao com filtragem passa alta
im = imread('lena.jpg');
imc = rgb2gray(im);
figure("name","imagem de entrada")
imshow(imc);

%Criando imagem maior de zeros com numero de linhas e colunas igual ao  
%tamanho original somado ao dobro da metade arredondada do tamanho do filtro a ser usado
bzero = zeros(size(imc,1)+4,size(imc,2)+4); % 6 pq o filtro sera de tamanho 5
%colocando a imagem original dentro da 'moldura' bordada a zeros
bzero(3:size(bzero,1)-2, 3:size(bzero,2)-2) = imc(:,:);
%gerando a imagem de saida a ser processada
saida = zeros(size(bzero,1),size(bzero,2));
%criando a matriz dos pesos (o filtro)
%filtro laplaciano
w = [-1 -1 -1 ; 
     -1  8 -1; 
     -1 -1 -1];
for i=2:size(bzero,1)-1
  for j=2:size(bzero,2)-1
    saida(i,j) = (w(1,1)*bzero(i-1,j-1) + w(1,2)*bzero(i-1,j) + w(1,3)*bzero(i-1,j+1) + ...
                w(2,1)*bzero(i,j-1) + w(2,2)*bzero(i,j) + w(2,3)*bzero(i,j+1) + ...
                w(3,1)*bzero(i+1,j-1) + w(3,2)*bzero(i+1,j) + w(3,3)*bzero(i+1,j+1));
  endfor
endfor


%ao final do processamento da filtragem, retirar a borda 
%antes colocada na imagem para assim obter a saida final
saida2(:,:) = saida(3:size(saida,1)-6, 3:size(saida,2)-6);
figure("name","imagem de saida")
saida2 = 255-saida2;

imshow(uint8(saida2));