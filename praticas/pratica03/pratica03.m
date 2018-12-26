clear all 
close all

pkg load image

im = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica01\lena.jpg');

%figure('Name', 'Imagem Original')
%imshow(im)

im = rgb2gray(im);

%figure('Name', 'Imagem Cinza')
%imshow(im)
%imwrite(im, 'C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica03\im.jpg')

x=1;

%------------------------------  CODIGO IMAGEM REDUZIDA   ------------------------------%
for i = 1:2: size(im, 1)%percorro a coluna a cada 2 pixels
  y=1;
  for j = 1:2: size(im, 2)%percorro a linha a cada 2 pixels (um pixel sim e outro nao)
    imPeq(x,y) = im(i,j);%construo uma nova matriz(so que dessa vez menor) q vai receber a original a cada volta do laco
    y++
    endfor
    x++
endfor

%figure('Name', 'Imagem Reduzida')
%imshow(imPeq)
%imwrite(imPeq, 'C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica03\peq.jpg')

%------------------------------  CODIGO IMAGEM AMPLIADA   ------------------------------%

ImAmpliada = zeros(size(im,1),size(im,2));%criei uma nova matriz, utilizei a funcao zeros e passei como parametro o tamanho da matriz em escala de cinza (original) na primeira dimensao e na segunda
%figure(4)
%imshow(ImAmpliada)
x=1;
for i = 1:size(imPeq, 1)%percorro a matriz reduzida na primeira dimensao
  y=1;
  for j = 1:size(imPeq, 2)%percorro a matriz reduzida na segunda dimensao
    ImAmpliada(x,y) = imPeq(i,j);%pego a nova matriz e ela recebe a matriz reduzida
    y=y+2;
    endfor
    x=x+2;
endfor


%figure('Name', 'Imagem Ampliada')
%imshow(uint8(ImAmpliada))

%------------------------------  CODIGO IMAGEM INTERPOLACAO PELO VIZINHO MAIS PROXIMO   ------------------------------%

imVizProx = ImAmpliada;
for i = 2:2: size(imVizProx,1)
  for j = 2: size(imVizProx, 2)
    if imVizProx(i-1,j) != 0
      imVizProx(i,j) = imVizProx(i-1,j);
    else
      imVizProx(i,j) = imVizProx(i-1,j-1);
    endif
  endfor
endfor
figure('Name', 'Imagem Teste1')
imshow(uint8(imVizProx))
%imwrite(uint8(imVizProx), 'C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica03\imVizProx1.jpg')

for i = 1:2: size(imVizProx, 1)
  for j = 2: size(imVizProx, 2)
    if imVizProx(i,j)==0
      imVizProx(i,j) = imVizProx(i,j-1);
      endif
    endfor
endfor 

figure('Name', 'Imagem Teste2')
imshow(uint8(imVizProx))
%imwrite(uint8(imVizProx), 'C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica03\imVizProx2.jpg')

for i = 2:2: size(imVizProx, 2)
  %if imVizProx(i-1, j)!=0
    imVizProx(i,1) = imVizProx(i-1, 1);
  %endif
endfor

figure('Name', 'Imagem Teste3')
imshow(uint8(imVizProx))
%imwrite(uint8(imVizProx), 'C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica03\imVizProx3.jpg')

%------------------------------  CODIGO IMAGEM INTERPOLACAO BILINEAR   ------------------------------%











