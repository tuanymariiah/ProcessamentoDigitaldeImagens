close all
clear all
pkg load image
totalMoedas = 0;
total_1_real = 0;
total_10cents_prat = 0;
total_10cents_dou = 0;
total_5cents_dou = 0;
for k=1:20
  nomeImagem = strcat('im (',num2str(k),').jpg');
  colorida = imread(strcat('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\moedasPratica\MoedasTuany_Bruno\',nomeImagem));

  A = rgb2gray(colorida); % binarização
  #figure('Name','Imagem Original')
  #imshow(colorida)
  A=binariza(A);
  #figure('Name','Imagem Binaria')
  #imshow(A, [0 1])
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
  totalMoedas = totalMoedas + qtdRegioes;
  imRotulo = uint8(imRotulo);
  #figure('Name','Imagem Rotulada sem erros')
  #imshow(imRotulo, [min(min(imRotulo)) max(max(imRotulo))])
  #title(strcat('Quantidade de Moedas (foreground): ',int2str(qtdRegioes)))
  
  %:::::::::::::::::::::::::::::::::Define Tamanho da Moeda:::::::::::::::::::::::::::::::::
  vetor = unique(imRotulo);
  areas = calculaArea(imRotulo,vetor);
  cores = encontraCores(imRotulo,vetor,colorida);
  %::::::::::::::::::::::::::::::::::::: segmentacao por cor :::::::::::::::::::::::::::::::
  moedas = segmentacao(colorida,A,C1);
  #figure('Name','Moedas segmentadas')
  #imshow(moedas)
  %::::::::::::::::::::::::::::::::::::: Classificação das moedas ::::::::::::::::::::::::::
  cont1real = 0;
  cont10douctvs = 0;
  cont10pratctvs = 0;
  cont50pctvs = 0;
  cont5douctvs = 0;
  cont5pratctvs = 0;
  rotulos1real = zeros(size(unique(imRotulo)));
  contR1 = 1;
  for x = 1:size(areas)
    if areas(x)>2500
        cont1real = cont1real+1;
        rotulos1real(contR1) = vetor(x);
        contR1++;
      else if areas(x)>1700 && areas(x)<=1950  
        cont10pratctvs++;
      elseif areas(x)>1400 && areas(x)<1805 && (cores(x,1) > 190 && cores(x,2) > 166 && cores(x,3) >131)
        cont10douctvs++;
      elseif areas(x)>1900 && areas(x)<=2067 %&& (cores(x,1) > 210 && cores(x,2) > 190 && cores(x,3) >150)
        cont5douctvs++;
      endif
    endif
  endfor
  
  
  moedas1real = separa1real(D2,imRotulo,rotulos1real);
  figure('Name','Moedas segmentadas')
  imshow(moedas)
  title([strcat('Quantidade de Moedas de 1real: ',int2str(cont1real)); 
         strcat('Quantidade de Moedas de 10 ctvs Dourada: ',int2str(cont10douctvs));...
         strcat('Quantidade de Moedas de 10 ctvs Prateada: ',int2str(cont10pratctvs))
         strcat('Quantidade de Moedas de 5 ctvs Dourada: ',int2str(cont5douctvs))])
  filename = strcat('saida (',num2str(k),').jpg');;
  imwrite(moedas, strcat('C:\Users\Aluno\Downloads\MoedasTuany_Bruno\saidas\',filename)); 
  figure('Name','moedas de 1 real')
  imshow(moedas1real)
  title([strcat('Quantidade de Moedas de 1 real: ',int2str(cont1real)); 
         strcat('Apenas as moedas de 1 real binarizadas')])
  
  total_1_real = total_1_real + cont1real; 
  total_10cents_prat = total_10cents_prat + cont10pratctvs;
  total_10cents_dou = total_10cents_dou + cont10douctvs;
  total_5cents_dou = total_5cents_dou + cont5douctvs;
endfor
%:::::::::::::::::::::::::Saida final:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
disp("total de moedas de 1 real")
disp(total_1_real)
disp("total de moedas de 10 cents prateada")
disp(total_10cents_prat)
disp("total de moedas de 10 cents dourada")
disp(total_10cents_dou)
disp("total de moedas de 5 cents dourada")
disp(total_5cents_dou)
disp("Total de moedas contadas nas 20 imagens ")
disp(totalMoedas)
disp("Porcentagem de moedas de 1 real ")
p1real = (total_1_real/totalMoedas) * 100;
disp(strcat(num2str(p1real)," %"))
