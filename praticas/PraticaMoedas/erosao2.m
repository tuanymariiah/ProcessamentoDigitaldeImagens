clear all
close all
pkg load image

im = imread('C:\Users\jamelli\Downloads\im.jpg');
imC = rgb2gray(im);
%im6 = im2bw(im);
figure(1)
imshow(imC)

#im = im2bw(im);
%im6 = zeros(size(im,1),size(im,2));
%im6 = im;
for i=1:size(im,1)
  for j=1:size(im,2)
    if imC(i,j) < 85 
      im6(i,j) = 1;
    else
      im6(i,j) = 0;
    endif
  endfor  
endfor

figure(2)
imshow(im6)


im2 = im6;
for i=3:size(im6,1)-2
  for j=3:size(im6,2)-2
    if im6(i,j) != 0
      im2(i+1,j+1) = 1;
				im2(i-1,j-1) = 1;
				im2(i+1,j) = 1;
				im2(i-1,j) = 1;
				im2(i,j-1)= 1;
				im2(i,j+1) = 1;
				im2(i+1,j-1) = 1;
				im2(i-1,j+1) = 1;
        im2(i-2,j) = 1;
        im2(i,j-2) = 1;
        im2(i+2,j) = 1;
        im2(i,j+2) = 1;
    endif
  endfor
endfor

im3 = im2;
for i=3:size(im6,1)-2
  for j=3:size(im6,2)-2
    if im2(i,j) != 0
      im3(i+1,j+1) = 1;
				im3(i-1,j-1) = 1;
				im3(i+1,j) = 1;
				im3(i-1,j) = 1;
				im3(i,j-1)= 1;
				im3(i,j+1) = 1;
				im3(i+1,j-1) = 1;
				im3(i-1,j+1) = 1;
        im3(i-2,j) = 1;
        im3(i,j-2) = 1;
        im3(i+2,j) = 1;
        im3(i,j+2) = 1;
    endif
  endfor
endfor

im4 = im3;
for i=3:size(im6,1)-2
  for j=3:size(im6,2)-2
    if im3(i,j) != 0
      im4(i+1,j+1) = 1;
				im4(i-1,j-1) = 1;
				im4(i+1,j) = 1;
				im4(i-1,j) = 1;
				im4(i,j-1)= 1;
				im4(i,j+1) = 1;
				im4(i+1,j-1) = 1;
				im4(i-1,j+1) = 1;
        im4(i-2,j) = 1;
        im4(i,j-2) = 1;
        im4(i+2,j) = 1;
        im4(i,j+2) = 1;
    endif
  endfor
endfor


im5 = im4;
for i=3:size(im6,1)-2
  for j=3:size(im6,2)-2
    if im4(i,j) != 0
      im5(i+1,j+1) = 1;
				im5(i-1,j-1) = 1;
				im5(i+1,j) = 1;
				im5(i-1,j) = 1;
				im5(i,j-1)= 1;
				im5(i,j+1) = 1;
				im5(i+1,j-1) = 1;
				im5(i-1,j+1) = 1;
        im5(i-2,j) = 1;
        im5(i,j-2) = 1;
        im5(i+2,j) = 1;
        im5(i,j+2) = 1;
    endif
  endfor
endfor

im6 = im5;
for i=3:size(im6,1)-2
  for j=3:size(im6,2)-2
    if im5(i,j) != 0
      im6(i+1,j+1) = 1;
				im6(i-1,j-1) = 1;
				im6(i+1,j) = 1;
				im6(i-1,j) = 1;
				im6(i,j-1)= 1;
				im6(i,j+1) = 1;
				im6(i+1,j-1) = 1;
				im6(i-1,j+1) = 1;
        im6(i-2,j) = 1;
        im6(i,j-2) = 1;
        im6(i+2,j) = 1;
        im6(i,j+2) = 1;
    endif
  endfor
endfor

figure(3)
imshow(im6)
im6 = 255 - im6;


rotulo = 2;
rotulosIguais(1,1) = 0;
%rotulosIguais(2,1) = 0;
r = 1; %indice do vetor rotulos Iguais
imRotulo = im6; %imagem cópia para armazenar os rotulos
for(i=2:size(im6,1))
  for(j=2:size(im6,2))
    if(im6(i,j)==1)
      if((im6(i-1,j)==0)&&(im6(i,j-1)==0))
        rotulo+=10; % novo rotulo (soma de 10 em 10)
        imRotulo(i,j)=rotulo;
      else
        if((im6(i-1,j)==1)&&(im6(i,j-1)==0))
          imRotulo(i,j)=imRotulo(i-1,j);
        else
          if((im6(i-1,j)==0)&&(im6(i,j-1)==1))
            imRotulo(i,j)=imRotulo(i,j-1);
          else
            if(((im6(i-1,j)==1)&&(im6(i,j-1)==1))&&(imRotulo(i-1,j)==imRotulo(i,j-1)))
              imRotulo(i,j)=imRotulo(i-1,j);
            else
              if(((im6(i-1,j)==1)&&(im6(i,j-1)==1))&&(imRotulo(i-1,j)!=imRotulo(i,j-1)))
                %os vizinhos são rotulados e os rotulos são diferentes...
                imRotulo(i,j)=imRotulo(i-1,j); %insere o rotulo de um dos vizinhos
                eq1 = imRotulo(i-1,j); 
                eq2 = imRotulo(i,j-1);
                % guardar rotulos equivalentes - erro
                ultimaLinha = size(rotulosIguais,1);
                ultimaColuna = size(rotulosIguais,2);
                [l1,c1]=find(rotulosIguais==eq1); %busca o 1o elemento
                [l2,c2]=find(rotulosIguais==eq2); %busca o 2o elemento
                if ((isempty(l1))&&(isempty(l2))) %não achou nenhum dos elementos
                  rotulosIguais(ultimaLinha+1,1) = eq1;
                  rotulosIguais(ultimaLinha+1,2) = eq2;
                else
                  if ((!isempty(l1))&&(isempty(l2))) %não achou o 1o elemento
                    rotulosIguais(l1,ultimaColuna+1) = eq2;
                  else
                    if ((isempty(l1))&&(!isempty(l2))) %não achou o 2o elemento
                      rotulosIguais(l2,ultimaColuna+1) = eq1;
                    end
                  end
                end
              end  
            end
          end
        end
      end
    end
  end
end

figure('Name','Imagem Rotulada com erros')
imshow(uint8(imRotulo), [min(min(imRotulo)), max(max(imRotulo))])

%retirar erros de equivalências de rótulos
for(i=2:size(imRotulo,1))
  for(j=2:size(imRotulo,2))
    if(imRotulo(i,j)!=0)
      [l,c]=find(rotulosIguais==imRotulo(i,j)); %procura o elemento nos erros
      if(!isempty(l))
        imRotulo(i,j) = rotulosIguais(l,1);
      end
    end
  end
end

qtdRegioes =  size(unique(imRotulo),1)-1; %-1 para desconsiderar o fundo
imRotulo = uint8(imRotulo);
figure('Name','Imagem Rotulada 2')
imshow(imRotulo, [min(min(imRotulo)) max(max(imRotulo))])
%imwrite(imRotulo, 'E:\EAJ\2018\PDI\Aulas\Aula 3-relacoes\imRotulo.jpg');

title(strcat('Quantidade de Regioes (foreground): ',int2str(qtdRegioes)))