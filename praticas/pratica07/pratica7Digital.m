clear all
close all
pkg load image

digital = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\pratica07\digital.jpg');
figure('name','Imagem Original da Digital')
imshow(digital)


%%binarizacao da imagem
digitalbw = im2bw(digital);

figure('name','Imagem da Digital Binarizada')
imshow(digitalbw)
%% erosao da imagem tipo do elemento estruturante (EE)
EE = [1 1 1; 
      1 1 1;
      1 1 1];

digitalerode = digitalbw;
for i = 2:size(digitalbw,1)-1
  for j = 2:size(digitalbw,2)-1
    if(digitalbw(i,j)==1) 
      vizA = [digitalbw(i-1,j-1) digitalbw(i-1,j) digitalbw(i-1,j+1);...
            digitalbw(i,j-1) digitalbw(i,j) digitalbw(i,j+1);...
            digitalbw(i+1,j-1) digitalbw(i+1,j) digitalbw(i+1,j+1)];
      if (sum(sum(vizA==EE))!=9)
        digitalerode(i,j)=0;
      end    
    end
  endfor
endfor

figure('Name','Imagem da Digital Erodida')
imshow(digitalerode)

%% dilatacao da imagem 
dilatacao = digitalerode;
for i = 2: size(digitalerode,1)-1
  for j = 2: size(digitalerode,2)-1
    if(digitalerode(i,j) == 1)        
      dilatacao(i+1, j-1) = 1;
      dilatacao(i, j-1) = 1;
      dilatacao(i-1, j-1) = 1;
      dilatacao(i+1, j) = 1;
      dilatacao(i-1, j) = 1;
      dilatacao(i+1, j+1) = 1;
      dilatacao(i, j+1) = 1;
      dilatacao(i-1, j+1) = 1;
    endif  
  endfor
endfor

figure('Name','Imagem da Digital Dilatada')
imshow(dilatacao)