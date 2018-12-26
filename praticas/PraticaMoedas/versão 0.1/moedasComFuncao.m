close all
clear all
pkg load image
for k=1:3
  nomeImagem = strcat('im (',num2str(k),').jpg');
  colorida = imread(strcat('C:\Users\jamelli\Downloads\Jamelli\',nomeImagem));
  #colorida = imread('C:\Users\jamelli\Downloads\Jamelli\im (8).jpg');

  A = rgb2gray(colorida); % binarizaï¿½ï¿½o
  figure('Name','Imagem Original')
  imshow(colorida)
  A=binariza(A);
  figure('Name','Imagem Binaria')
  imshow(A, [0 1])
  A = double(A);
  C1 = erode(A);
  #figure('Name','Imagem Erodida 1x')
  #imshow(C1)
  
  C2 = erode(C1);
  #figure('Name','Imagem Erodida 2x')
  #imshow(C2)
  
  D1 = dilata(C2);
  #figure('Name','Imagem dilatada 1x')
  #imshow(D1)
  
  D2 = dilata(D1);
  #figure('Name','Imagem dilatada 2x')
  #imshow(D2)
  %:::::::::::::::::::::::::::::::::Contagem de objetos:::::::::::::::::::::::::::::::::::::
  imRotulo = rotula(D2);
  qtdRegioes =  size(unique(imRotulo),1)-1; %-1 para desconsiderar o fundo
  imRotulo = uint8(imRotulo);
  figure('Name','Imagem Rotulada sem erros')
  imshow(imRotulo, [min(min(imRotulo)) max(max(imRotulo))])
  title(strcat('Quantidade de Moedas (foreground): ',int2str(qtdRegioes)))
  
  %:::::::::::::::::::::::::::::::::Define Tamanho da Moeda:::::::::::::::::::::::::::::::::
  vetor = unique(imRotulo);
  areas = calculaArea(imRotulo,vetor);
  cores = encontraCores(imRotulo,vetor,colorida);
  %::::::::::::::::::::::::::::::::::::: segmentacao por cor :::::::::::::::::::::::::::::::
  moedas = segmentacao(colorida,A,C1);
  figure('Name','Moedas segmentadas')
  imshow(moedas)
  %::::::::::::::::::::::::::::::::::::: Classificação das moedas ::::::::::::::::::::::::::
  cont1real = 0;
  cont10douctvs = 0;
  cont10pratctvs = 0
  cont50pctvs = 0;
  cont5douctvs = 0;
  cont5pratctvs = 0;

  for x = 1:size(areas)
    if areas(x)>2500
      cont1real = cont1real+1;
      else if areas(x)>1700 && areas(x)<=1950  
        #disp(cont10ctvs)
        cont10pratctvs++;
      elseif areas(x)>1400 && areas(x)<1805 && (cores(x,1) > 190 && cores(x,2) > 166 && cores(x,3) >131)
        cont10douctvs++;
      elseif areas(x)>1900 && areas(x)<=2067 %&& (cores(x,1) > 210 && cores(x,2) > 190 && cores(x,3) >150)
      cont5douctvs++;
      %elseif areas(x)>1900 && areas(x)<=2067
      %cont25dctvs++;
      endif
    endif
  endfor


  figure('Name','Moedas segmentadas')
  imshow(moedas)
  title([strcat('Quantidade de Moedas de 1real: ',int2str(cont1real)); 
         strcat('Quantidade de Moedas de 10 ctvs Dourada: ',int2str(cont10douctvs));...
         strcat('Quantidade de Moedas de 10 ctvs Prateada: ',int2str(cont10pratctvs))
         strcat('Quantidade de Moedas de 5 ctvs Dourada: ',int2str(cont5douctvs))])
  #filename = strcat('imSaida.jpg');
  #caminho = 'C:\Users\Tuany Mariah\Desktop\Tuany\imagem final teste\';
  #imwrite(moedas, strcat('C:\Users\jamelli\Downloads\Jamelli\imagem final\',filename));  
endfor