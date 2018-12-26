close all
clear all
pkg load image
for k=1:3
  pause (0.5);
  nomeImagem = strcat('im (',num2str(k),').jpg');
  colorida = imread(strcat('C:\Users\Tuany Mariah\Desktop\Tuany\',nomeImagem));
  %colorida = imread('C:\Users\Tuany Mariah\Desktop\Tuany\im (8).jpg');

  A = rgb2gray(colorida); % binariza��o
  figure('Name','Imagem Original')
  imshow(colorida)
  for i = 1: size(A, 1)
    for j = 1: size(A, 2)
      if A(i,j)>90 %%COLOCAR DEPOIS PARA 90
        A(i,j) = 1;%%COLOCAR DEPOIS PARA 1      
      else
        A(i,j) = 0;%%COLOCAR DEPOIS PARA 0
        
      endif
    endfor
  endfor
  #figure('Name','Imagem Binaria')
  #imshow(A, [0 1])


  A = double(A);
  % Considerando o elemento estruturante quadrado
  B = [1 1 1; 1 1 1; 1 1 1];

  C = A;
  for i=2:size(A,1)-1
    for j=2:size(A,2)-1
      if(A(i,j)==1) %se o pixel central da vizinhan�a de A = 1, deve ser analizado
        vizA = [A(i-1,j-1) A(i-1,j) A(i-1,j+1);...
              A(i,j-1) A(i,j) A(i,j+1);...
              A(i+1,j-1) A(i+1,j) A(i+1,j+1)];
        if (sum(sum(vizA==B))!=9) % se todos os pixels s�o iguais entre a vizinhan�a de A e B
          C(i,j)=0;
        end    
      end
    end
  end

  %figure('Name','Imagem Erodida')
  %imshow(C)

  %::::::::::::::::::::::::::::::::::::::: Erosao ::::::::::::::::::::::::::::::::::
  A = double(A);
  % Considerando o elemento estruturante quadrado
  B = [1 1 1; 1 1 1; 1 1 1];

  C = A;
  for i=2:size(A,1)-1
    for j=2:size(A,2)-1
      if(A(i,j)==1) %se o pixel central da vizinhan�a de A = 1, deve ser analizado
        vizA = [A(i-1,j-1) A(i-1,j) A(i-1,j+1);...
              A(i,j-1) A(i,j) A(i,j+1);...
              A(i+1,j-1) A(i+1,j) A(i+1,j+1)];
        if (sum(sum(vizA==B))!=9) % se todos os pixels s�o iguais entre a vizinhan�a de A e B
          C(i,j)=0;
        end    
      end
    end
  end
  %figure('Name','Imagem Erodida 1x')
  %imshow(C)
  %:::::::::::::::::::::::::::::::::Segunda eros�o:::::::::::::::::::::::::::::::::
  D = C;
  for i=2:size(C,1)-1
    for j=2:size(C,2)-1
      if(A(i,j)==1) %se o pixel central da vizinhan�a de A = 1, deve ser analizado
        vizB = [C(i-1,j-1) C(i-1,j) C(i-1,j+1);...
                C(i,j-1)   C(i,j)   C(i,j+1);...
               C(i+1,j-1)  C(i+1,j) C(i+1,j+1)];
        if (sum(sum(vizB==B))!=9) % se todos os pixels s�o iguais entre a vizinhan�a de A e B
          D(i,j)=0;
        end    
      end
    end
  end
  %figure('Name','Imagem Erodida 2x')
  %imshow(D)
  %:::::::::::::::::::::::::::::::::::::::Dilata��o:::::::::::::::::::::::::::::::::

  D = double(D);

  dilatacao = D;
  for i = 2: size(D,1)-1
      for j = 2: size(D,2)-1
        
        if(D(i,j) == 1)
        #{
          dilatacao(i-2,j) =1;
          dilatacao(i-1, j-1) = 1;
          dilatacao(i-1, j) = 1;
          dilatacao(i-1, j+1) = 1;
          dilatacao(i, j-2) = 1;
          dilatacao(i, j-1) = 1;
          #dilatacao(i,j) = 1;
          dilatacao(i, j+1) = 1;
          dilatacao(i, j+2) = 1;
          dilatacao(i+1, j-1) = 1;
          dilatacao(i+1, j ) = 1;
          dilatacao(i+1,j+1) = 1;
          dilatacao(i-2,j) = 1;
          #}
        
          dilatacao(i+1, j-1) = 1;
          dilatacao(i, j-1) = 1;
          dilatacao(i-1, j-1) = 1;
          dilatacao(i+1, j) = 1;
          %dilatacao(i, j) = 1;
          dilatacao(i-1, j) = 1;
          dilatacao(i+1, j+1) = 1;
          dilatacao(i, j+1) = 1;
          dilatacao(i-1, j+1) = 1;
          
        endif  
      end
    end
  %figure('Name','Imagem Dilatada')
  %imshow(dilatacao)
  %:::::::::::::::::::::::::::::::::Segunda dilata��o:::::::::::::::::::::::::::::::::
  dilatacao1 = dilatacao;
  for i = 2: size(dilatacao,1)-1
      for j = 2: size(dilatacao,2)-1
        
        if(dilatacao(i,j) == 1)
          dilatacao1(i+1, j-1) = 1;
          dilatacao1(i, j-1) = 1;
          dilatacao1(i-1, j-1) = 1;
          dilatacao1(i+1, j) = 1;
          %dilatacao1(i, j) = 1;
          dilatacao1(i-1, j) = 1;
          dilatacao1(i+1, j+1) = 1;
          dilatacao1(i, j+1) = 1;
          dilatacao1(i-1, j+1) = 1;
        #{
          dilatacao1(i-2,j) =1;
          dilatacao1(i-1, j-1) = 1;
          dilatacao1(i-1, j) = 1;
          dilatacao1(i-1, j+1) = 1;
          dilatacao1(i, j-2) = 1;
          dilatacao1(i, j-1) = 1;
          #dilatacao1(i,j) = 1;
          dilatacao1(i, j+1) = 1;
          dilatacao1(i, j+2) = 1;
          dilatacao1(i+1, j-1) = 1;
          dilatacao1(i+1, j ) = 1;
          dilatacao1(i+1,j+1) = 1;
          dilatacao1(i-2,j) = 1;
          #}
        endif  
      end
    end
  %figure('Name','Imagem Dilatada1')
  %imshow(dilatacao1)

  %:::::::::::::::::::::::::::::::::Rotula��o:::::::::::::::::::::::::::::::::
  rotulo = 15;
  rotulosIguais(1,1) = 0;
  r = 1;
  imRotulo = dilatacao1;
  for(i=2:size(dilatacao1,1))
    for(j=2:size(dilatacao1,2))
      if(dilatacao1(i,j)==1)
        if((dilatacao1(i-1,j)==0)&&(dilatacao1(i,j-1)==0))
          rotulo+=2; % novo rotulo (soma de 10 em 10)
          imRotulo(i,j)=rotulo;
        else
          if((dilatacao1(i-1,j)==1)&&(dilatacao1(i,j-1)==0))
            imRotulo(i,j)=imRotulo(i-1,j);
          else
            if((dilatacao1(i-1,j)==0)&&(dilatacao1(i,j-1)==1))
              imRotulo(i,j)=imRotulo(i,j-1);
            else
              if(((dilatacao1(i-1,j)==1)&&(dilatacao1(i,j-1)==1))&&(imRotulo(i-1,j)==imRotulo(i,j-1)))
                imRotulo(i,j)=imRotulo(i-1,j);
              else
                if(((dilatacao1(i-1,j)==1)&&(dilatacao1(i,j-1)==1))&&(imRotulo(i-1,j)!=imRotulo(i,j-1)))
                  %os vizinhos s?o rotulados e os rotulos s?o diferentes...
                  imRotulo(i,j)=imRotulo(i-1,j); %insere o rotulo de um dos vizinhos
                  eq1 = imRotulo(i-1,j); 
                  eq2 = imRotulo(i,j-1);
                  % guardar rotulos equivalentes - erro
                  ultimaLinha = size(rotulosIguais,1);
                  ultimaColuna = size(rotulosIguais,2);
                  [l1,c1]=find(rotulosIguais==eq1); %busca o 1o elemento
                  [l2,c2]=find(rotulosIguais==eq2); %busca o 2o elemento
                  if ((isempty(l1))&&(isempty(l2))) %n?o achou nenhum dos elementos
                    rotulosIguais(ultimaLinha+1,1) = eq1;
                    rotulosIguais(ultimaLinha+1,2) = eq2;
                  else
                    if ((!isempty(l1))&&(isempty(l2))) %n?o achou o 1o elemento
                      rotulosIguais(l1,ultimaColuna+1) = eq2;
                    else
                      if ((isempty(l1))&&(!isempty(l2))) %n?o achou o 2o elemento
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
  %figure('Name','Imagem Rotulada com erros')
  %imshow(uint8(imRotulo), [min(min(imRotulo)), max(max(imRotulo))])
  %:::::::::::::::::::::::::::::::::Retirar erros:::::::::::::::::::::::::::::::::
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
  %:::::::::::::::::::::::::::::::::Contagem de objetos:::::::::::::::::::::::::::::::::
  qtdRegioes =  size(unique(imRotulo),1)-1; %-1 para desconsiderar o fundo
  imRotulo = uint8(imRotulo);
  figure('Name','Imagem Rotulada 2')
  imshow(imRotulo, [min(min(imRotulo)) max(max(imRotulo))])
  title(strcat('Quantidade de Moedas (foreground): ',int2str(qtdRegioes)))
  %:::::::::::::::::::::::::::::::::Define Tamanho da Moeda:::::::::::::::::::::::::::::::::
  vetor = unique(imRotulo);
  areas = zeros(size(vetor,1));
  cores = zeros(size(vetor,1));
  for i = 1:size(imRotulo, 1)
    for j = 1:size(imRotulo,2)
      for x = 2:size(areas)
        if imRotulo(i,j) == vetor(x)
          areas(x)= areas(x) + 1;
          cores(x,1) = colorida(i,j,1);
          cores(x,2) = colorida(i,j,2);
          cores(x,3) = colorida(i,j,3);
        endif 
      endfor
    endfor
  endfor

  %disp(areas)
  disp(sort(areas, 'descend'))
  moedas = colorida;
  %::::::::::::::::::::::::::::::::::::: segmentacao por cor :::::::::::::::::::::::
  for i = 1: size(A, 1)
    for j = 1: size(A, 2)
      if C(i,j)==1 
        moedas(i,j,:) = colorida(i,j,:);     
      else
        moedas(i,j,:) = 0;
      endif
    endfor
  endfor
  %figure('Name','Moedas segmentadas')
  %imshow(moedas)

  moedasP = moedas;
  moedasB = moedas;
  %%moedas douradas
  for i = 1: size(A, 1)
    for j = 1: size(A, 2)
      if moedas(i,j,1) > 190 && moedas(i,j,2) > 140 && moedas(i,j,3) < 200
        moedasB(i,j,:) = moedas(i,j,:); 
      else
        moedasB(i,j,:) = 0; 
      endif
    endfor
  endfor
  %figure('Name','Moedas Douradas')
  %imshow(moedasB)

  %% moedas prateadas
  for i = 1: size(A, 1)
    for j = 1: size(A, 2)
      if moedas(i,j,1) > 140 && moedas(i,j,2) > 145 && moedas(i,j,3) > 160
        moedasP(i,j,:) = moedas(i,j,:); 
      else
        moedasP(i,j,:) = 0; 
      endif
    endfor
  endfor
  %figure('Name','Moedas Prateadas')
  %imshow(moedasP)

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
%  nomeImagemFinal = strcat('im (',num2str(k),').jpg');
  caminho = 'C:\Users\Tuany Mariah\Desktop\Tuany\imagem final teste\';
  imwrite(moedas, strcat('C:\Users\Tuany Mariah\Desktop\Tuany\imagem final teste\',nomeImagem))  
endfor
#}
%title(strcat('Quantidade de Moedas de 10 ctvs: ',int2str(cont10ctvs)))
