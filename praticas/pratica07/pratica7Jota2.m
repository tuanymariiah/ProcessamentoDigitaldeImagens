clear all
close all
pkg load image

jota2 = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica07\j2.jpg');
figure('name', 'Imagem Jota - ORIGINAL')
imshow(jota2)
jotabw = im2bw(jota2);

%% dilatacao da imagem tipo do elemento estruturante (EE)
EE = [0 0 0; 
      0 0 0;
      0 0 0];
      
jdilata = jotabw;
for x = 1:2
  for i = 2:size(jotabw,1)-1
    for j = 2:size(jotabw,2)-1
      if(jotabw(i,j)==0) 
        vizA = [jotabw(i-1,j-1) jotabw(i-1,j) jotabw(i-1,j+1);...
                jotabw(i,j-1) jotabw(i,j) jotabw(i,j+1);...
                jotabw(i+1,j-1) jotabw(i+1,j) jotabw(i+1,j+1)];
        if (sum(sum(vizA==EE))!=9)
            jdilata(i,j)=1;
        end    
      end
    endfor
  endfor
    jotabw = jdilata;
endfor

figure('name', 'Imagem Jota - DILATADA')
imshow(jdilata)

EE = [1 1 1; 
      1 1 1;
      1 1 1];
jota=jdilata;

for x = 1:2
  for i = 2:size(jdilata,1)-1
    for j = 2:size(jdilata,2)-1
      if(jotabw(i,j)==1) 
        vizA = [jotabw(i-1,j-1) jdilata(i-1,j) jdilata(i-1,j+1);...
              jdilata(i,j-1) jdilata(i,j) jdilata(i,j+1);...
              jdilata(i+1,j-1) jdilata(i+1,j) jdilata(i+1,j+1)];
        if (sum(sum(vizA==EE))!=9)
          jota(i,j)=0;
        end    
      end
    endfor
  endfor
  jdilata = jota;
endfor

figure('name', 'Imagem Jota')
imshow(jota)