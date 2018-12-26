function cores = encontraCores(imRotulo,vetor,colorida)
  cores = zeros(size(vetor,1));
  for i = 1:size(imRotulo, 1)
    for j = 1:size(imRotulo,2)
      for x = 2:size(cores)
        if imRotulo(i,j) == vetor(x)
          cores(x,1) = colorida(i,j,1);
          cores(x,2) = colorida(i,j,2);
          cores(x,3) = colorida(i,j,3);
        endif 
      endfor
    endfor
  endfor
endfunction