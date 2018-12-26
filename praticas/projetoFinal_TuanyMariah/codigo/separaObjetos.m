function imNova = separaObjetos(rotulo,vetor,qtdD)
  cont = 1;
  for k=2:qtdD+1
    for i=1:size(rotulo,1)
      for j=1:size(rotulo,2)
        if(vetor(k) == rotulo(i,j))
          imNova(i,j,cont) = 1;
        else
          imNova(i,j,cont) = 0;
        endif       
      endfor
    endfor
    cont++;
  endfor
endfunction