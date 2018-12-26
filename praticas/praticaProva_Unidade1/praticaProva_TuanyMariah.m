clear all
close all

pkg load image

textura = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\imagens\textura.jpg');
mascara = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\praticaProva_Unidade1\mascara.jpg');
listras = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\praticaProva_Unidade1\listras.jpg');
ass = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\praticaProva_Unidade1\assinatura.jpg');
#figure('Name', 'Textura')
#imshow(textura)

for i = 1:size(textura, 1)
  for j = 1: size(textura, 2)
    texturaInvertida(i,j,:) = textura((size(textura,2)+1)-i,j,:);
  endfor
endfor

figure('Name', 'Textura Invertida')
imshow(texturaInvertida)


for i = 1:size(texturaInvertida,1)
  for j = 1:size(texturaInvertida, 2)
    if i > 0 && i<20
      imComBorda (i, j,:) = texturaInvertida(i,j,:)/1.5;      
      else
      imComBorda (i,j, :) =  texturaInvertida(i,j,:);
    endif
  endfor
endfor
#figure('Name', 'Imagem com Borda Escura')
#imshow(imComBorda)

saida = imComBorda;

for i = 1: size(mascara, 1)
  for j = 1:size(mascara, 2)
    if mascara(i,j,:) <= 30
      saida(i,j,:) = mascara(i, j, :);
    elseif mascara (i,j,:)>= 245
      saida (i,j,:) = listras(i,j,:);
    elseif mascara (i,j,:) >= 175 && mascara (i,j,:) <= 205
      saida (i,j,:) = 255-listras(i,j,:);
    endif
  endfor
endfor

final = saida;
final = min(ass, saida);

figure('Name', 'Final')
imshow(final)
imwrite(final, 'C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\praticaProva_Unidade1\final.jpg')