clear all
close all
pkg load image
totaldepecas = 0;
for k = 40:40
  nomeImagem = strcat('im (',num2str(k),').jpg');

  dominocolorido = imread(strcat('C:\Users\Tuany Mariah\Desktop\aquisicaoDomino3\',nomeImagem));
  #figure('name','imagem domino original'), imshow(dominocolorido)

  B = aumentaBrilho(dominocolorido);
  figure('name','imagem domino com o brilho aumentado em 50%'), imshow(B)
  
  saida = separaAzul(B);
  #dominocinza = rgb2gray(B);
  #figure('name','imagem domino em tons de cinza'), imshow(dominocinza)
  
  hist = imhist(saida);
  lim = limiar(hist);
  
  A = binariza(saida,lim);
  #figure('Name','Imagem Binaria'), ims how(A, [0 1])
  
  erodir0 = erode(A);
  #figure('name','imagem domino erodida 0x'), imshow(erodir0)
  
  erodir1 = erode(erodir0);
  #figure('name','imagem domino erodida 1x'), imshow(erodir1)
  
  [rotulo,qtdD] = bwlabel(erodir1); #rotular e contar objetos
  vetor = unique(rotulo);
  pSep = separaObjetos(rotulo,vetor,qtdD);#separa objetos
  disp('Quantidade de Domino')
  disp(qtdD)
  
  domino = segmentacao(B, A, erodir1);#segmenta todas as pecas da imagem
  figure('name','imagem domino segmentada'), imshow(domino)
  
  #o for abaixo serve para printar todas as imagens separadas
  for i=1:qtdD
   #disp(i);
   #figure(i), imshow(pSep(:,:,i))
  endfor
  
  #segmentacao das imagens separadas, para "recuperar" as bolinhas de cada peca
  for i=1:qtdD
   recuperabolinhas = segmentacao(B, A, pSep(:,:,i));#segmenta
   #figure('name','imagem domino separada e segmentada para a recuperacao das bolinhas'), imshow(recuperabolinhas)
   
   #colocando as imagens separadas e segmentadas em tons de cinza
   bolinhascinza = rgb2gray(recuperabolinhas);
   figure('name','imagem domino separada e segmentada em tons de cinza'), imshow(bolinhascinza)
     
   #binarizando cada peca
   
   bolinhasbw = binarizacadapeca(recuperabolinhas,pSep(:,:,i));
   #figure('name','imagem domino separada e segmentada binarizada'), imshow(bolinhasbw, [0 1])
   
   #dilatando cada peca cada peca
   dilatacaobolinha = dilata(bolinhasbw);
   #figure('name','imagem domino separada dilatada 1 vez'), imshow(dilatacaobolinha)
   
   dilatacaobolinha1 = dilata(dilatacaobolinha);
   #figure('name','imagem domino separada dilatada 2 vez'), imshow(dilatacaobolinha1)
   
   erodirboliha = erode(dilatacaobolinha1);
   #figure('name','imagem domino separada e erodida 1 vez'), imshow(erodirboliha)
   
   erodirboliha1 = erode(erodirboliha);
   #figure('name','imagem domino separada e erodida 2 vez'), imshow(erodirboliha1)
   
   erodirboliha2 = erode(erodirboliha1);
   #figure('name','imagem domino separada e erodida 3 vez'), imshow(erodirboliha2)
   
   
   [rotuloP,qtdP] = bwlabel(erodirboliha1); #rotular e contar objetos
   disp('Quantidade Total de Bolinhas')
   qtdP1=qtdP-1;
   disp(qtdP1)
   if qtdP1 == 4
     disp('A sua peca pode ser uma 1x1, 5x0, 3x3, 2x2, 1x5')
   elseif qtdP1 == 5
     disp('A sua peca pode ser uma 5x3, 4x2, 6x5, 0x3, 4x1,4x3')
   elseif qtdP1 == 2
     disp('A sua peca pode ser uma 1x2,6x2, 0x0, 6x4, 6x3, 6x1')
   elseif qtdP1 == 7
     disp('A sua peca pode ser uma 4x5')
   elseif qtdP1 == 8
     disp('A sua peca pode ser uma 5x5')
   elseif qtdP1 == 3
     disp('A sua peca pode ser uma 2x0, 3x1, 0x4, 2x3')
   elseif qtdP1 == 0
     disp('A sua peca pode ser uma 0x6')
   elseif qtdP1 == 1
     disp('A sua peca pode ser uma 6x6,1x1')
   endif
  endfor
endfor