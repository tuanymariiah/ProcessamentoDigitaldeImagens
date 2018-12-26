clear all
close all
pkg load image

lin = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica07\lin.jpg');
figure('name','Imagem Original do Lincoln')
imshow(lin)

linbw = im2bw(lin);
figure('name','Imagem Binarizada do Lincoln')
imshow(linbw)

EE = [1 1 1; 
      1 1 1;
      1 1 1];
imOriginal = linbw;
linerode = linbw;
for x = 1:10
  for i = 2:size(linbw,1)-1
    for j = 2:size(linbw,2)-1
      if(linbw(i,j)==1) 
        vizA = [linbw(i-1,j-1) linbw(i-1,j) linbw(i-1,j+1);...
              linbw(i,j-1) linbw(i,j) linbw(i,j+1);...
              linbw(i+1,j-1) linbw(i+1,j) linbw(i+1,j+1)];
        if (sum(sum(vizA==EE))!=9)
          linerode(i,j)=0;
        end    
      end
    endfor
  endfor
  linbw= linerode;
endfor

figure('Name','Imagem do Lincoln Erodida')
imshow(linerode)

finalin = imOriginal-linbw;

figure('Name','Imagem do Lincoln com Bordas')
imshow(finalin)

% criar uma nova imagem com os 3 canais

final2 = uint8(zeros(size(linerode,1), size(linerode,2), 3));
%% percorro a imagem erodida
for i = 1:size(linerode, 1)
  for j = 1:size(linerode, 2)
  if linerode(i,j) == 1
    final2(i,j,1) = 255;
    final2(i,j,2) = 255;
    final2(i,j,3) = 255;
  endif
  if finalin(i,j) == 1
    final2(i,j,1) = 255;
  endif
  endfor
endfor

figure('Name','Imagem com Bordas Vermelhas')
imshow(final2, [0 255])
