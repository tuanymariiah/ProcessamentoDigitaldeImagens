pkg load image

clear all
close all

% pratica de correlaÃ§Ã£o com filtragem passa alta
im = imread('E:\Documentos\TADS\PDI\Praticas Aula\Pratica Aula 8\ruido2.jpg');
imc = rgb2gray(im);
figure("name","Entrada")
imshow(imc);

%criando imagem maior de zeros com numero de linhas e colunas igual ao  
%tamanho original somado ao dobro da metade arredondada do tamanho do filtro a ser usado
bzero = zeros(size(imc,1)+6,size(imc,2)+6); % 6 pq o filtro sera de tamanho 5
%colocando a imagem original dentro da 'moldura' bordada a zeros
bzero(4:size(bzero,1)-3, 4:size(bzero,2)-3) = imc(:,:);
%aplicando a filtragem estatistica de mediana
saida = zeros(size(bzero,1),size(bzero,2));
%criando um vetor para a vizinhança
md = [0 0 0 0 0 0 0 0 0];
for i=2:size(bzero,1)-1
  for j=2:size(bzero,2)-1
    %colocando a vizinhança em um vetor
    md(1) = bzero(i-1,j-1);
    md(2) = bzero(i-1,j);
    md(3) = bzero(i-1,j+1);
    md(4) = bzero(i,j-1);
    md(5) = bzero(i,j);
    md(6) = bzero(i,j+1);
    md(7) = bzero(i+1,j-1);
    md(8) = bzero(i+1,j);
    md(9) = bzero(i+1,j+1);
    %ordenando a vizinhança
    ord = sort(md);
    %colocando o a mediana na saida (ponto central do vetor ordenado
    saida(i,j) = ord(5);
  endfor
endfor
saida2(:,:) = saida(3:size(saida,1)-4, 3:size(saida,2)-4);;
figure("name","filtro estatistico de mediana")
imshow(saida2, [min(min(saida2)) max(max(saida2))])