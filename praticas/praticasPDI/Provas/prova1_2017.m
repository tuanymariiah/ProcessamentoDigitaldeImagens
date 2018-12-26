clear all
close all
pkg load image

assinatura = imread('C:\Users\jamelli\Downloads\provaUnidade1\assinatura.png');
fundo = imread('C:\Users\jamelli\Downloads\provaUnidade1\img2.jpg');
mascara = imread('C:\Users\jamelli\Downloads\provaUnidade1\mascara3.jpg');
quad = imread('C:\Users\jamelli\Downloads\provaUnidade1\text4.jpg');
fundoInv = zeros(size(fundo,1),size(fundo,2),3);
#invertendo a imagem
for i=1:size(fundoInv,1)
  for j=1:size(fundoInv,2)
      t = (size(fundoInv,2)+1)-i;
      fundoInv(t,j,:) = fundo(i,j,:);
  endfor
endfor
#colocando a borda transparente
for i=1:size(fundoInv,1)
  for j=1:size(fundoInv,2)
    if (i > 0 && i < 23) && (j > 0 && j <= 400 )
      fundoInv(i,j,:) -=45;
    elseif (i >= 23 && i <= 400) && (j > 0 && j < 23 )
      fundoInv(i,j,:) -=45;
    elseif (j >= 23 && j <= 400) && (i > 377 && i < 400 )
      fundoInv(i,j,:) -=45;
    elseif (i>=23  && i<=377 ) && (j>=377 && j<400)
      fundoInv(i,j,:) -=45;
    elseif (i>=23  && i<=377 ) && (j>=188 && j<212)
      fundoInv(i,j,:) -=45;
    endif
  endfor
endfor

bw = zeros(size(fundoInv,1),size(fundoInv,2));
#colocando assinatura
for i=1:size(fundoInv,1)
  for j=1:size(fundoInv,1)
    if assinatura(i,j) >= 240
      fundoInv(i,j,:) *=1;
    else 
      fundoInv(i,j,:) *=0;
    endif
  endfor
endfor
#fundoInv = max(assinatura,fundoInv);
saida = zeros(size(fundoInv,1),size(fundoInv,2),3);
med = (8);
#colocando os quadrados
for i=2:size(saida,1)-1
  for j=2:size(saida,1)-1
    if mascara(i,j) >= 0 && mascara(i,j)<=30
      saida(i,j,:) = 0;
    elseif mascara(i,j) > 30 && mascara(i,j)<=90
      saida(i,j,:) = quad(i,j,:);
    elseif mascara(i,j) >= 160 && mascara(i,j)<=189
      saida(i,j,:) = 255 - quad(i,j,:);
      #saida(i,j,:) = max(saida(i,j,:),fundoInv(i,j,:));
    elseif mascara(i,j) >= 190 && mascara(i,j)<=255
      saida(i,j,:) =  (fundoInv(i-1,j-1,:)+fundoInv(i-1,j+1,:)+fundoInv(i+1,j-1,:)+fundoInv(i+1,j+1,:) ...
      +fundoInv(i-1,j,:)+fundoInv(i,j-1,:)+fundoInv(i+1,j,:)+fundoInv(i,j+1,:)) / 8;
      #borrando a img com a mediana
    else
      saida(i,j,:) = fundoInv(i,j,:);
    endif
  endfor
endfor


figure("name","Fundo")
imshow(uint8(fundoInv))
%saida = sum(saida,:);
figure("name","Saida")
imshow(uint8(saida))