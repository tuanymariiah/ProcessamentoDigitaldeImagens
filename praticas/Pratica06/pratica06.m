clear all
close all
pkg load image

im = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\praticaExtra\semente (2).jpeg');
figure('name', 'Figura Original: RGB')
imshow(im)

%::::::::::::::::::::::::::: Feijao Preto :::::::::::::::::::::::::::
%Ler cada camada, da im1, red, green e blue
r = im(:,:,1);
g = im(:,:,2);
b = im(:,:,3);

for i = 1:size(im,1)
  for j = 1:size(im, 2)
    if (b(i,j,:)>55 || g(i,j,:)>35 || r(i,j,:)>50)
      im(i,j,1)=255;
      im(i,j,2)=255;
      im(i,j,3)=255;
      else
      im(i,j,1) = 0;
			im(i,j,2) = 0;
			im(i,j,3) = 0; 
    endif
  endfor
endfor

figure('name', 'Feijao Preto')
imshow(im)

branco = 0; %
totalPx = 0;%Area Total da imagem.

for i=1: size(im,1);
  for j=1: size(im,2);
   if(im(i,j) == 0)
      branco = branco+1;
   end
   totalPx = totalPx+1;
   
   areatotal = (branco * 100)/totalPx; %Regra de 3 simples.
  endfor
endfor

title(strcat('Percentual de Area Ocupada do Gr�o de Feijao Preto: ',mat2str(areatotal),'%')); %Resultado
%::::::::::::::::::::::::::: Arroz :::::::::::::::::::::::::::
for i = 1:size(im,1)
  for j = 1:size(im, 2)
    if (b(i,j,:)<190 && r(i,j,:)>150 && g(i,j,:)>0)
      im(i,j,1)=0;
      im(i,j,2)=0;
      im(i,j,3)=0;
      else
      im(i,j,1) = 255;
			im(i,j,2) = 255;
			im(i,j,3) = 255; 
    endif
  endfor
endfor
figure('name', 'Arroz')
imshow(im)

for i=1: size(im,1);
  for j=1: size(im,2);
   if(im(i,j) == 0)
      branco = branco+1;
   end
   totalPx = totalPx+1;
   
   areatotal = (branco * 100)/totalPx; %Regra de 3 simples.
  endfor
endfor

title(strcat('Percentual de Area Ocupada do Grao de Milho: ',mat2str(areatotal),'%')); %Resultado
%::::::::::::::::::::::::::: Arroz :::::::::::::::::::::::::::
for i = 1:size(im,1)
  for j = 1:size(im, 2)
    if (b(i,j,:)>145 && r(i,j,:)>30 && g(i,j,:)>30)
      im(i,j,1)=0;
      im(i,j,2)=0;
      im(i,j,3)=0;
      else
      im(i,j,1) = 255;
			im(i,j,2) = 255;
			im(i,j,3) = 255; 
    endif
  endfor
endfor
figure('name', 'Arroz')
imshow(im)

for i=1: size(im,1);
  for j=1: size(im,2);
   if(im(i,j) == 0)
      branco = branco+1;
   end
   totalPx = totalPx+1;
   
   areatotal = (branco * 100)/totalPx; %Regra de 3 simples.
  endfor
endfor

title(strcat('Percentual de Area Ocupada do Grao de Arroz: ',mat2str(areatotal),'%')); %Resultado