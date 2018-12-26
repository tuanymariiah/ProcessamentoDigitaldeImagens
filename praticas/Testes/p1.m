clear all
close all
pkg load image 

im = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\Testes\img2.jpg');
masc = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\Testes\mascara3.jpg');
text4 = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\Testes\text4.jpg');

ass = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\Testes\ass.jpg');

for i=1: size(im,1);
  for j=1: size(im,2);
   imInvertida(i,j,:) = im((size(im,2)+1)-i,j,:);
  endfor
endfor

#figure(1)
#imshow(imInvertida);
#imComBorda = rgb2gray(imInvertida);
#imComBorda = zeros(size(im,1),size(im,2));

for i=1: size(imInvertida,1);
  for j=1: size(imInvertida,2);
    if i >0 && i<20
      imComBorda(i,j,:) = imInvertida(i,j,:)-85;
      elseif i>380 &&i<400
         imComBorda(i,j,:) = imInvertida(i,j,:)-85;
       elseif j > 0&& j<20
         imComBorda(i,j,:) = imInvertida(i,j,:)-85;
       elseif j>380 && j<400
         imComBorda(i,j,:) = imInvertida(i,j,:)-85;
       elseif j >190&& j<210
         imComBorda(i,j,:) = imInvertida(i,j,:)-85;
      else
      imComBorda(i,j,:) = imInvertida(i,j,:);
    endif   
  endfor
endfor

#figure(2)
#imshow(imComBorda);
#mascbin = zeros(size(masc,1),size(masc,2));
%vetorTest = zeros(8);
saida = zeros(size(masc,1),size(masc,2),3);
for i = 1: size(masc,1)
  for j = 1:size(masc,2)
    if masc (i,j)>= 0 && masc (i,j)<=30 ;
      saida(i,j,:)= 0;
      #disp('borda preta')
      elseif masc (i,j)>30 && masc (i,j)<=90 
      saida(i,j,:) = text4(i,j,:);
      #disp('cima')
      elseif masc(i,j) >= 160 && masc (i,j)<=189
      saida(i,j,:) = 255-text4(i,j,:);
      #saida(i,j,:)=max(saida(i,j,:),text4(i,j,:));
      #disp('borda borrada')
    elseif masc(i,j) >190  & masc(i,j,:)<=255
      %saida(i,j,:) =  (imComBorda(i-1,j-1,:)+imComBorda(i-1,j+1,:)+imComBorda(i+1,j-1,:)+imComBorda(i+1,j+1,:)  ...
      %+imComBorda(i-1,j,:)+imComBorda(i,j-1,:)+imComBorda(i+1,j,:)+imComBorda(i,j+1,:)) / 8;
      
      %saida(i,j,:) =(imInvertida(i-1, j-1,:)+imInvertida(i-1,j,:)+imInvertida(i-1, j+1,:)+imInvertida(i, j-1,:)+imInvertida(i,j,:)+imInvertida(i, j+1,:)+imInvertida(i+1, j-1,:)+imInvertida(i+1, j,:)+imInvertida(i+1, j+1,:))/8; 
      %disp('borrada')
      else
      saida(i,j,:) = imComBorda(i,j,:);
    endif
  endfor
endfor
figure(3)
imshow(uint8(saida));

#ass = rgb2gray(ass);
#figure('name', 'teste')
#imshow(ass)
s = saida;
s = min(ass,saida);
figure('name','results')
imshow(uint8(s))
imwrite(s,'C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\Testes\results.jpg' )