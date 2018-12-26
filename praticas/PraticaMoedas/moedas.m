clear all
close all
pkg load image
moedas = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\sm.jpg');
im = zeros(size(moedas,1),size(moedas,2));
for i=1:size(moedas,1)
  for j=1:size(moedas,2)
    if (moedas(i,j) > 126)
      im(i,j) = 0;
    else 
      im(i,j) = 1;
    endif  
  endfor
endfor

figure(1)
imshow(im)
im2 = zeros(size(moedas,1),size(moedas,2));
%disp('entrando no for');
for i=3:size(im,1)-2
  %disp('entrando no primeiro for');
  for j=3:size(im,2)-2
    %disp('entrando no segundo for');
    if (im(i,j) == 1)
      %disp('entrou no primeiro if');
      if (im(i,j-2)!=0 || im(i,j-1)!=0 || im(i,j+1)!=0 || im(i,j+1)!=0 ||...
        im(i-1,j-1)!=0 || im(i-1,j)!=0 || im(i-1,j+1)!=0 ||...
        im(i-2,j)!=0 || im(i+1,j-1)!=0 || im(i+1,j)!=0 || im(i+1,j+1)!=0 || ...
        im(i+2,j)!=0) 
          im2(i,j) = 0;
          %disp('entrou no segundo if');
      else 
          im2(i,j) = 1;    
          %disp('entrou no else');
      endif
    endif     
  endfor
endfor

figure(2)
imshow(im2)