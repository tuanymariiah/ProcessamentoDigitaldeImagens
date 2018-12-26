function imRotulo = rotula(im)
  rotulo = 15;
  rotulosIguais(1,1) = 0;
  r = 1;
  imRotulo = im;
  for(i=2:size(im,1))
    for(j=2:size(im,2))
      if(im(i,j)==1)
        if((im(i-1,j)==0)&&(im(i,j-1)==0))
          rotulo+=2; % novo rotulo (soma de 10 em 10)
          imRotulo(i,j)=rotulo;
        else
          if((im(i-1,j)==1)&&(im(i,j-1)==0))
            imRotulo(i,j)=imRotulo(i-1,j);
          else
            if((im(i-1,j)==0)&&(im(i,j-1)==1))
              imRotulo(i,j)=imRotulo(i,j-1);
            else
              if(((im(i-1,j)==1)&&(im(i,j-1)==1))&&(imRotulo(i-1,j)==imRotulo(i,j-1)))
                imRotulo(i,j)=imRotulo(i-1,j);
              else
                if(((im(i-1,j)==1)&&(im(i,j-1)==1))&&(imRotulo(i-1,j)!=imRotulo(i,j-1)))
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
endfunction