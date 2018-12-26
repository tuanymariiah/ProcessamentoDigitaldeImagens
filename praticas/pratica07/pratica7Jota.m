clear all
close all
pkg load image

jota= imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica07\j.jpg');
figure('name','Imagem J - Original')
imshow(jota)

%%binarizacao da imagem
jotabw = im2bw(jota);

%% erosao da imagem tipo do elemento estruturante (EE)
EE = [1 1 1; 
      1 1 1;
      1 1 1];
      
%joriginal = jotabw;
jerode = jotabw;

for x = 1:2
  for i = 2:size(jotabw,1)-1
    for j = 2:size(jotabw,2)-1
      if(jotabw(i,j)==1) 
        vizA = [jotabw(i-1,j-1) jotabw(i-1,j) jotabw(i-1,j+1);...
              jotabw(i,j-1) jotabw(i,j) jotabw(i,j+1);...
              jotabw(i+1,j-1) jotabw(i+1,j) jotabw(i+1,j+1)];
        if (sum(sum(vizA==EE))!=9)
          jerode(i,j)=0;
        end    
      end
    endfor
  endfor
  jotabw = jerode;
endfor

figure('Name','Imagem J - Erodida')
imshow(jerode)
#{
finalj = uint8(zeros(size(jerode,1), size(jerode,2), 3));

for i = 1:size(jerode,1)
  for j = 1:size(jerode,2)
    if jerode(i,j) == 1
      finalj(i,j,1) = 0;
      finalj(i,j,2) = 255;
      finalj(i,j,3) = 255;
    endif
  endfor
endfor

figure('Name','Imagem J - Colorido')
imshow(finalj)

