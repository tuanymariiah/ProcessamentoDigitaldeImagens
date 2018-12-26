clear all
close all
pkg load image

fundo = imread('C:\Users\jamelli\Downloads\prova4\fundo.jpeg');
masc = imread('C:\Users\jamelli\Downloads\prova4\mascara.jpeg');
flores = imread('C:\Users\jamelli\Downloads\prova4\bordado.jpeg');

fundoN1 = zeros(size(fundo,1),size(fundo,2),3);
fundoN2 = zeros(size(fundo,1),size(fundo,2),3);
#Colocando a imagem de cabeça para baixo
for k=1:size(fundo,1)
  fundoN1(:,k,:) = fundo(:,((size(fundo,1)-k)+1),:);
endfor

#espelhando metade da imagem
for i=1:size(fundoN1,1)
  for j=1:size(fundoN1,2)
    if j >= 0 && j<=200
      fundoN2(i,j,:) = fundoN1(i,((200-j)+1),:);
    else
      fundoN2(i,j,:) = fundoN1(i,j,:);
    endif
  endfor
endfor
#}

#fazendo a camada escura
for i=1:size(fundo,1)
  for j=1:size(fundo,2)
    if i>=20 && i<=380 && j>=20 && j<=380  
      fundoN2(i,j,:) -= 40;
    else 
      fundoN2(i,j,:) += 60;
    endif
  endfor
endfor

figure(1)
fundoN2 = uint8(fundoN2);
imshow(fundoN2)
#preenchendo os retangulos

saida = double(fundoN2);

for i=1:size(fundo,1)
  for j=2:size(fundo,2)
    if masc(i,j)>=0 && masc(i,j)<=30
      saida(i,j,:) = 0;
    elseif masc(i,j)>=70 && masc(i,j)<=110
      saida(i,j,:) = flores(i,j,:);
    elseif masc(i,j)>=180 && masc(i,j)<=200
      #media para borrar
      saida(i,j,:) =  (saida(i-1,j-1,:)+saida(i-1,j+1,:)+saida(i+1,j-1,:)+saida(i+1,j+1,:)  ...
      +saida(i-1,j,:)+saida(i,j-1,:)+saida(i+1,j,:)+saida(i,j+1,:)) / 8;  
    elseif masc(i,j)>200 && masc(i,j)<=255  
      #min para misturar
      saida(i,j,:) = max(flores(i,j,:),saida(i,j,:));
    endif
  endfor
endfor

figure(2)
saida = uint8(saida);
imshow(saida)