clear all 
close all

pkg load image

im = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica04\objetos.jpg');
%figure('Name', 'Imagem Original')
%imshow(im)

%criando uma matriz imBw do mesmo tamanho de im
imbw = zeros(size(im,1),size(im,2));
%figure('Name', 'Imagem do mesmo tamanho')
%imshow(imbw)

for i = 1: size(im, 1)
  for j = 1: size(im, 2)
    if im(i,j) < 128
      imbw(i,j) = 0;
    else
      imbw(i,j) = 1;
    endif
    endfor
endfor

%figure('Name', 'Imagem Binaria')
%imshow(imbw)
%imwrite(imbw,'C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratoca04\obw.jpg' )

imRotulo = imbw;
%imwrite(teste,'C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratoca04\teste.jpg' )

vetorErros =0;% vetor de erros
contRotulo=10;
contErros=1;
% O for descrito a baixo serve para eu andar pela imagem rotulada(mascara)
for i = 2: size(imbw, 1)-1
  for j = 2: size(imbw, 2)-1
    if (imbw(i,j) == 1) % se p =1, ou seja, se o pixel q eu estiver olhando, imbw (i,j) for 1 eu entro em 4 condicionais diferente
      
      if (imbw(i-1,j)==0 && imbw(i, j-1) == 0)
        contRotulo = contRotulo + 5;
        imRotulo(i,j) = contRotulo;
      endif
      
      if (imbw(i-1,j) ==1 && imbw(i, j-1)==0)
        imRotulo(i,j) = imRotulo(i-1, j);        
      endif
      
      if(imbw(i-1,j) ==0 && imbw(i, j-1)==1)
        imRotulo(i,j) =  imRotulo(i, j-1);
      endif
      
      if (imbw(i-1, j)==1 &&imbw(i, j-1)==1) &&(imRotulo(i-1, j)==imRotulo(i, j-1))
        imRotulo(i,j) = imRotulo(i-1,j);
      endif
      
    
      
       
    endif%fecha o primeiro if de todos
    
    endfor
endfor

figure('Name', 'Imagem Rotudo')
imshow(imRotulo)