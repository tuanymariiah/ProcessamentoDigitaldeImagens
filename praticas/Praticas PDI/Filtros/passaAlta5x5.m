pkg load image

clear all
close all
% pratica de correlação com filtragem passa alta
im = imread('E:\Documentos\TADS\PDI\Praticas Aula\Pratica Aula 8\lena.jpg');
imc = rgb2gray(im);
figure(1)
imshow(imc);

%criando imagem maior de zeros com numero de linhas e colunas igual ao  
%tamanho original somado ao dobro da metade arredondada do tamanho do filtro a ser usado
bzero = zeros(size(imc,1)+6,size(imc,2)+6); % 6 pq o filtro sera de tamanho 5
%colocando a imagem original dentro da 'moldura' bordada a zeros
bzero(4:size(bzero,1)-3, 4:size(bzero,2)-3) = imc(:,:);
figure(2)
imshow(uint8(bzero))
%gerando a imagem de saida a ser processada
saida = zeros(size(bzero,1),size(bzero,2));
%criando a matriz dos pesos (o filtro)
w = [-1 -1 -1 -1 -1; -1 -1 -1 -1 -1; -1 -1 24 -1 -1; -1 -1 -1 -1 -1; -1 -1 -1 -1 -1];
for i=3:size(bzero,1)-2
  for j=3:size(bzero,2)-2
    saida(i,j) = (w(1,1)*bzero(i-2,j-2) + w(1,2)*bzero(i-2,j-1) + w(1,3)*bzero(i-2,j) + w(1,4)*bzero(i-2,j+1) + w(1,5)*bzero(i-2,j+2) + ...
                w(2,1)*bzero(i-1,j-2) + w(2,2)*bzero(i-1,j-1) + w(2,3)*bzero(i-1,j) + w(2,4)*bzero(i-1,j+1) + w(2,5)*bzero(i-1,j+2) + ...
                w(3,1)*bzero(i,j-2) + w(3,2)*bzero(i,j-1) + w(3,3)*bzero(i,j) + w(3,4)*bzero(i,j+1) + w(3,5)*bzero(i,j+2) + ...
                w(4,1)*bzero(i+1,j-2) + w(4,2)*bzero(i+1,j-1) + w(4,3)*bzero(i+1,j) + w(4,4)*bzero(i+1,j+1) + w(4,5)*bzero(i+1,j+2) + ...
                w(5,1)*bzero(i+2,j-2) + w(5,2)*bzero(i+2,j-1) + w(5,3)*bzero(i+2,j) + w(5,4)*bzero(i+2,j+1) + w(5,5)*bzero(i+2,j+2))/25;
  endfor
endfor


%ao final do processamento da filtragem, retirar a borda antes colocada na imagem para assim obter a saida final 
saida2(:,:) = saida(3:size(saida,1)-6, 3:size(saida,2)-6);
figure(3)
#imshow(saida, [min(min(saida)) max(max(saida))])
imshow(uint8(saida))