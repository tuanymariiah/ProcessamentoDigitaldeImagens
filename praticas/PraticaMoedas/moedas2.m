clear all
close all
pkg load image
moedas = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\sm.jpg');
im = zeros(size(moedas,1),size(moedas,2));
%binarizou as 'moedas'
for i=1:size(moedas,1)
  for j=1:size(moedas,2)
    if (moedas(i,j) > 126)
      im(i,j) = 1;
    else 
      im(i,j) = 0;
    endif  
  endfor
endfor
im2 =im;

for i=3:size(moedas,1)-2
  for j=3:size(moedas,2)-2
    if im(i,j) == 0
      if (im(i,j-2)!=1 || im(i,j-1)!=1 || im(i,j+1)!=1 || im(i,j+1)!=1 ||...
        im(i-1,j-1)!=1 || im(i-1,j)!=1 || im(i-1,j+1)!=1 ||...
        im(i-2,j)!=1 || im(i+1,j-1)!=1 || im(i+1,j)!=1 || ...
        im(i+1,j+1)!=1 || im(i+2,j)!=1) 
          im2(i,j) = 0;
          
      else
          im2(i,j) = 1;
      endif
    endif
  endfor
endfor
im3 = im2;
for i=3:size(moedas,1)-2
  for j=3:size(moedas,2)-2
    if im2(i,j) == 0
      if (im2(i,j-2)!=1 || im2(i,j-1)!=1 || im2(i,j+1)!=1 || im2(i,j+1)!=1 ||...
        im2(i-1,j-1)!=1 || im2(i-1,j)!=1 || im2(i-1,j+1)!=1 ||...
        im2(i-2,j)!=1 || im2(i+1,j-1)!=1 || im2(i+1,j)!=1 || ...
        im2(i+1,j+1)!=1 || im2(i+2,j)!=1) 
          im3(i,j) = 0;
          
      else
          im3(i,j) = 1;
      endif
    endif
  endfor
endfor
im4 = im3;
for i=3:size(moedas,1)-2
  for j=3:size(moedas,2)-2
    if im3(i,j) == 0
      if (im3(i,j-2)!=1 || im3(i,j-1)!=1 || im3(i,j+1)!=1 || im3(i,j+1)!=1 ||...
        im3(i-1,j-1)!=1 || im3(i-1,j)!=1 || im3(i-1,j+1)!=1 ||...
        im3(i-2,j)!=1 || im3(i+1,j-1)!=1 || im3(i+1,j)!=1 || ...
        im3(i+1,j+1)!=1 || im3(i+2,j)!=1) 
          im4(i,j) = 0;
          
      else
          im4(i,j) = 1;
      endif
    endif
  endfor
endfor

im5 = im4;
for i=3:size(moedas,1)-2
  for j=3:size(moedas,2)-2
    if im4(i,j) == 0
      if (im4(i,j-2)!=1 || im4(i,j-1)!=1 || im4(i,j+1)!=1 || im4(i,j+1)!=1 ||...
        im4(i-1,j-1)!=1 || im4(i-1,j)!=1 || im4(i-1,j+1)!=1 ||...
        im4(i-2,j)!=1 || im4(i+1,j-1)!=1 || im4(i+1,j)!=1 || ...
        im4(i+1,j+1)!=1 ||im4(i+2,j)!=1) 
          im5(i,j) = 0;
          
      else
          im5(i,j) = 1;
      endif
    endif
  endfor
endfor
figure(1)
imshow(im)

figure(2)
imshow(im5)