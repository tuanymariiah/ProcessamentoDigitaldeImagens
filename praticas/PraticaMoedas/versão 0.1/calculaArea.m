function areas = calculaArea(imRotulo,vetor)
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
endfunction