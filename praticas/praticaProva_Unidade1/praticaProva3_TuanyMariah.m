clear all
close all

pkg load image

textura = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\textura.jpg');
mascara = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\mascara1.jpg');
flor = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\flores.jpg');
listras2 = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\listras2.jpg');
ass = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\assinatura.jpg');
%figure('name', 'Imagem: Com Textura Original')
%imshow(textura)

%figure('name', 'Imagem: Imagem de Flores')
%imshow(flor)

for i = 1:size(textura,1)
  for j = 1:size(textura,2)
  textura1(i,j,:) = textura((size(textura,2)+1)-j,i,:);%%rotacionei 1x
  endfor
endfor

%figure('name','Imagem: Textura Invertida')
%imshow(textura1)

for i = 1:size(textura1,1)
  for j = 1:size(textura1,2)
  textura2(i,j,:) =  textura1(i,(size(textura,2)+1)-j,:);%espelhei
  endfor
endfor


#figure('name','Imagem: Textura Invertida e Espelhada')
#imshow(textura2)

for i = 1:size(textura2)
  for j = 1:size(textura2)
    if i>=360 && i<=400
      textura2(i,j,:) = textura2(i,j,:)/1.5;
    endif
  endfor
endfor

#figure('name','Imagem: Textura Com Borda Escura Embaixo')
#imshow(textura2)

for i = 1:size(textura2)
  for j = 1:size(textura2)
    if (j>=190 && j<=240) && !(i>=360 && i<=400) && !(i>=0 &&i<=45)
      textura2(i,j,:) = textura2(i,j,:)2.5;
    elseif i>=0 &&i<=45
      textura2(i,j,:) = textura2(i,j,:)+65;
    endif
  endfor
endfor

%figure('name','Imagem: Textura Com Borda Escura no Meio')
%imshow(textura2)

saida = textura2;

for i = 1:size(listras2,1)
  for j = 1:size(listras2,2)
  listras1(i,j,:) = listras2((size(listras2,2)+1)-j,i,:);
  endfor
endfor

for i = 1:size(listras1,1)
  for j = 1:size(listras1,2)
  listra3(i,j,:) =  listras1(i,(size(listras1,2)+1)-j,:);
  endfor
endfor

for i = 1:size(flor,1)
  for j = 1:size(flor,2)
  rosa(i,j,:) =  flor((size(flor,2)+1)-i,j,:);
  endfor
endfor

for i = 1:size(rosa,1)
  for j = 1:size(rosa,2)
  rosas(i,j,:) =  rosa(i,(size(rosa,2)+1)-j,:);
  endfor
endfor

%figure('name','Imagem: Flores Rotacionadas')
%imshow(rosas)

for i = 1:size(mascara,1)
  for j = 1:size(mascara,1)
    if mascara(i,j) >=0 && mascara(i,j) <=25 
      saida(i,j,:) = mascara(i,j,:);
    elseif mascara(i,j) >=35 && mascara(i,j) <=65 
     saida(i,j,:) = listra3(i,j,:); 
    elseif mascara(i,j) >=160 && mascara(i,j) <=190 
      saida(i,j,:) = 255-listra3(i,j,:); 
    elseif mascara(i,j) >=75 && mascara(i,j) <=85
      saida(i,j,:) = 255-rosas(i,j,:);
    endif
  endfor
endfor

%figure('name','Imagem: Com Bordas')
%imshow(saida)

for i=1: size(ass,1);
  for j=1: size(ass,2);
   ass1(i,j,:) = ass((size(ass,2)+1)-i,j,:);%%rotacao 2x
  endfor
endfor

final = saida;
final = min(ass1, saida);

figure('name','Imagem: Final')
imshow(final)

imwrite(final, 'C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\tesr.jpg')