clear all
close all
pkg load image
totaldepecas = 0;
for k = 40:40
  nomeImagem = strcat('im (',num2str(k),').jpg');

  dominocolorido = imread(strcat('C:\Users\Tuany Mariah\Desktop\aquisicaoDomino3\',nomeImagem));
  figure('name','imagem domino original'), imshow(dominocolorido)

  B = aumentaBrilho(dominocolorido);
  figure('name','imagem domino com o brilho aumentado em 50%'), imshow(B)
  
  saida = separaAzul(dominocolorido);
  dominocinza = rgb2gray(B);
  figure('name','imagem domino em tons de cinza'), imshow(dominocinza)
  
  hist = imhist(saida);
  lim = limiar(hist);
  
  A = binariza(saida,lim);
  figure('Name','Imagem Binaria'), imshow(A, [0 1])
  
  erodir0 = erode(A);
  figure('name','imagem domino erodida 0x'), imshow(erodir0)
  
  erodir1 = erode(erodir0);
  figure('name','imagem domino erodida 1x'), imshow(erodir1)
  
  [rotulo,qtdD] = bwlabel(erodir1); #rotular e contar objetos
  vetor = unique(rotulo);
  pSep = separaObjetos(rotulo,vetor,qtdD);#separa objetos
  disp(qtdD)
  
  domino = segmentacao(dominocolorido, A, erodir1);#segmenta todas as pecas da imagem
  figure('name','imagem domino segmentada'), imshow(domino)
  
  #o for abaixo serve para printar todas as imagens separadas
  for i=1:qtdD
   disp(i)
   figure(i)
   imshow(pSep(:,:,i))
  endfor
  
  #segmentacao das imagens separadas, para "recuperar" as bolinhas de cada peca
  for i=1:qtdD
   recuperabolinhas = segmentacao(dominocolorido, A, pSep(:,:,i));#segmenta
   figure('name','imagem domino separada e segmentada para a recuperacao das bolinhas'), imshow(recuperabolinhas)
  endfor
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  #for i=1:size(qtdD)
    #figure(i)
    #disp(i)
    #imshow(pSep(:,:,i))
  #endfor
  #figure("name","imagem separada 1")
  #imshow(pSep(:,:,1))
  #figure("name","imagem separada 2")
  #imshow(pSep(:,:,2))
  
  
  #{
    
  erodir0 = erode(A);
  figure('name','imagem domino erodida 0x'), imshow(erodir0)
  vetr
  erodir1 = erode(erodir0);
  figure('name','imagem domino erodida 1x'), imshow(erodir1)
  
  #{
  erodir1 = erode(erodir0);
  figure('name','imagem domino erodida 1x'), imshow(erodir1)
  
  erodir2 = erode(erodir0);
  figure('name','imagem domino erodida 1x'), imshow(erodir2)
  
  
  dilatada = dilata(erodir2);
  figure('name','imagem domino dilatada 1x'), imshow(dilatada)
  
  dilatada1 = dilata(dilatada)
  figure('name','imagem domino dilatada 2x'), imshow(dilatada1)
  #}
  
  #domino = segmentacao(dominocolorido, A, erodir0);
  #figure('name','imagem domino segmentada'), imshow(domino)
  
  imRotulo = rotula(erodir1);
  qtdRegioes =  size(unique(imRotulo),1)-1; %-2para desconsiderar o fundo e a faixa do meio
  totaldepecas = totaldepecas + qtdRegioes;
  disp(totaldepecas);
  #disp("Quantidade de bolinhas: ",num2str(qtdRegioes))
  imRotulo = uint8(imRotulo);
  #figure('Name','Imagem Rotulada sem erros')
  #imshow(imRotulo, [min(min(imRotulo)) max(max(imRotulo))])
  #title(strcat('Quantidade de Pecas de Domino (foreground): ',int2str(qtdRegioes)))

  
  #}  
  
endfor