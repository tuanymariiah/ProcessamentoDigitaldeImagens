clear all
close all
pkg load image
qtdTotal = 0;
descritores=[];
cont =1;
for k = 40:40
  nomeImagem = strcat('im (',num2str(k),').jpg');

  dominocolorido = imread(strcat('C:\Users\Tuany Mariah\Desktop\aquisicaoDomino3\',nomeImagem));
  #figure('name','imagem domino original'), imshow(dominocolorido)

  B = aumentaBrilho(dominocolorido);
  #figure('name','imagem domino com o brilho aumentado em 50%'), imshow(B)
  
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
  figure('name','Objetos')
  imshow(rotulo,[]);
  colormap(jet), colorbar;
  vetor = unique(rotulo);
  title([strcat('Quantidade de Pecas: ',int2str(qtdD))])
  pSep = separaObjetos(rotulo,vetor,qtdD);#separa objetos
  #disp('Quantidade de Domino')
  #disp(qtdD)
  
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
   imwrite(recuperabolinhas,'C:\Users\Tuany Mariah\Desktop\aquisicaoDomino3\saida.jpg')
   figure('name','imagem domino separada e segmentada para a recuperacao das bolinhas'), imshow(recuperabolinhas)
   
   #colocando as imagens separadas e segmentadas em tons de cinza
   #bolinhascinza = rgb2gray(recuperabolinhas);
   #figure('name','imagem domino separada e segmentada em tons de cinza'), imshow(bolinhascinza)
     
   #binarizando cada peca
   
   bolinhasbw = binarizacadapeca(recuperabolinhas,pSep(:,:,i));
   #figure('name','imagem domino separada e segmentada binarizada'), imshow(bolinhasbw, [0 1])
   
   #dilatando cada peca cada peca
   dilatacaobolinha = dilata(bolinhasbw);
   #figure('name','imagem domino separada dilatada 1 vez'), imshow(dilatacaobolinha)
      
   erodirboliha = erode(dilatacaobolinha);
   #figure('name','imagem domino separada e erodida 1 vez'), imshow(dilatacaobolinha)
   
   erodirboliha1 = erode(erodirboliha);
   #figure('name','imagem domino separada e erodida 2 vez'), imshow(erodirboliha1)  
   
   [rotuloP,qtdP] = bwlabel(erodirboliha1); #rotular e contar objetos
   #disp('Quantidade Total de Bolinhas')
   qtdP1 = qtdP - 2;
   #disp(qtdP1)
   figure('name','Bolinhas do Domino')
   imshow(rotuloP,[]);
   colormap(jet), colorbar;
   title([strcat('Quantidade de Bolinhas: ',int2str(qtdP1))])

   if qtdP1 == 1
     disp('A sua peca eh uma 1x0')
   elseif qtdP1 == 2
     disp('A sua peca pode ser uma 1x1 ou 2x0')
   elseif qtdP1 == 3
     disp('A sua peca pode ser uma 1x2 ou 0x3 ')
   elseif qtdP1 == 4
     disp('A sua peca pode ser uma 3x1, 0x4 ou 2x2')
   elseif qtdP1 == 5
     disp('A sua peca pode ser uma 0x5, 4x1 ou 2x3')
   elseif qtdP1 == 6
     disp('A sua peca pode ser uma 1x5,3x3,0x6 ou 4x2,')
   elseif qtdP1 == 7
     disp('A sua peca pode ser uma 2x5,6x1 ou 4x3')
   elseif qtdP1 == 8
     disp('A sua peca pode ser uma 5x3, 6x2 ou 4x4')
   elseif qtdP1 == 9
     disp('A sua peca pode ser uma 4x5 ou 6x3')
   elseif qtdP1 == 10
     disp('A sua peca pode ser uma 5x5 ou 6x4')
   elseif qtdP1 == 11
     disp('A sua peca eh uma 6x5')
   elseif qtdP1 == 12
     disp('A sua peca eh uma 6x6')
   else
     disp('A sua peca eh uma 0x0')
   endif
   #saida = strcat('saida (',num2str(qtdD),').jpg');
   #imwrite(rotuloP, strcat('C:\Users\Tuany Mariah\Desktop\aquisicaoDomino3\saida\',saida))
   
   
   descritores(cont,1) = qtdP1;
   cont++;
  endfor

  qtdTotal = qtdTotal + qtdD; 
   
endfor
  disp("Quantidade Total de Pecas")
  disp(qtdTotal)
