clear all
close all
pkg load image

moedas = imread('C:\Users\Tuany Mariah\Downloads\im2.jpg');
figure('name', 'Imagem Moeda - Original')
imshow(moedas)
colorida = moedas;
moedas = rgb2gray(moedas);

%{
moedas = im2bw(moedas);
figure('Name','Imagem Binarizada')
imshow(moedas)
%}
figure('name', 'Imagem Moeda - P&B')
imshow(moedas)
figure('name', 'histograma cinza')
imhist(moedas(:,:))
%:::::::::::::::::::::::::::::::::: binarizacao ::::::::::::::::::::::::::::::::::

for i = 1: size(moedas, 1)
  for j = 1: size(moedas, 2)
    if moedas(i,j)>90
      moedasb(i,j) = 1;
    else
      moedasb(i,j) = 0;
    endif
  endfor
endfor
figure('Name','Imagem Binaria')
imshow(moedasb, [0 1])

%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
%:::::::::::::::::::::::::::::::::: contagem de objetos ::::::::::::::::::::::::::

rotulo = 15;
rotulosIguais(1,1) = 0;
r = 1;
imRotulo = moedasb;
for(i=2:size(moedasb,1))
  for(j=2:size(moedasb,2))
    if(moedasb(i,j)==1)
      if((moedasb(i-1,j)==0)&&(moedasb(i,j-1)==0))
        rotulo+=5; % novo rotulo (soma de 10 em 10)
        imRotulo(i,j)=rotulo;
      else
        if((moedasb(i-1,j)==1)&&(moedasb(i,j-1)==0))
          imRotulo(i,j)=imRotulo(i-1,j);
        else
          if((moedasb(i-1,j)==0)&&(moedasb(i,j-1)==1))
            imRotulo(i,j)=imRotulo(i,j-1);
          else
            if(((moedasb(i-1,j)==1)&&(moedasb(i,j-1)==1))&&(imRotulo(i-1,j)==imRotulo(i,j-1)))
              imRotulo(i,j)=imRotulo(i-1,j);
            else
              if(((moedasb(i-1,j)==1)&&(moedasb(i,j-1)==1))&&(imRotulo(i-1,j)!=imRotulo(i,j-1)))
                %os vizinhos s�o rotulados e os rotulos s�o diferentes...
                imRotulo(i,j)=imRotulo(i-1,j); %insere o rotulo de um dos vizinhos
                eq1 = imRotulo(i-1,j); 
                eq2 = imRotulo(i,j-1);
                % guardar rotulos equivalentes - erro
                ultimaLinha = size(rotulosIguais,1);
                ultimaColuna = size(rotulosIguais,2);
                [l1,c1]=find(rotulosIguais==eq1); %busca o 1o elemento
                [l2,c2]=find(rotulosIguais==eq2); %busca o 2o elemento
                if ((isempty(l1))&&(isempty(l2))) %n�o achou nenhum dos elementos
                  rotulosIguais(ultimaLinha+1,1) = eq1;
                  rotulosIguais(ultimaLinha+1,2) = eq2;
                else
                  if ((!isempty(l1))&&(isempty(l2))) %n�o achou o 1o elemento
                    rotulosIguais(l1,ultimaColuna+1) = eq2;
                  else
                    if ((isempty(l1))&&(!isempty(l2))) %n�o achou o 2o elemento
                      rotulosIguais(l2,ultimaColuna+1) = eq1;
                    endif
                  endif
                endif
              endif  
            endif
          endif
        endif
      endif
    endif
  endfor
endfor
figure('Name','Imagem Rotulada com erros')
imshow(uint8(imRotulo), [min(min(imRotulo)), max(max(imRotulo))])

%retirar erros 
for(i=2:size(imRotulo,1))
  for(j=2:size(imRotulo,2))
    if(imRotulo(i,j)!=0)
      [l,c]=find(rotulosIguais==imRotulo(i,j)); %procura o elemento nos erros
      if(!isempty(l))
        imRotulo(i,j) = rotulosIguais(l,1);
      endif
    endif
  endfor
endfor

qtdRegioes =  size(unique(imRotulo),1)-1; %-1 para desconsiderar o fundo
imRotulo = uint8(imRotulo);
figure('Name','Imagem Rotulada 2')
imshow(imRotulo, [min(min(imRotulo)) max(max(imRotulo))])
title(strcat('Quantidade de Moedas (foreground): ',int2str(qtdRegioes)))

%:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
%::::::::::::::::::::::::::::::::::: Calculo de Ares::::::::::::::::::::::::::::::



#{
for i=1:size(imRotulo, 1)
  for j =1:size(imRotulo,2)
    if imRotulo(i,j) == 20
      cont1++;
    elseif imRotulo(i,j) == 50
      cont2++
    elseif imRotulo(i,j) == 240
      cont3++;
    elseif imRotulo(i,j) == 255
      cont4++; 
    endif
  endfor
endfor
#}

vetor = unique(imRotulo);
areas = zeros(size(vetor,1));
for i = 1:size(imRotulo, 1)
  for j = 1:size(imRotulo,2)
    for x = 2:size(areas)
      if imRotulo(i,j) == vetor(x)
        areas(x)= areas(x) + 1;
      endif 
    endfor
  endfor
endfor

disp(areas)
%{
figure('name', 'histograma 1')
imhist(colorida(:,:,1))
figure('name', 'histograma 2')
imhist(colorida(:,:,2))
figure('name', 'histograma 3')
imhist(colorida(:,:,3))
}%