function A = binarizacadapeca(recuperabolinhas, pSep)
  for i = 1: size(recuperabolinhas, 1)
    for j = 1: size(recuperabolinhas, 2)
      if recuperabolinhas(i,j) < 40 && pSep(i,j) == 1
        A(i,j) = 1;
      else
        A(i,j) = 0;    
      endif
    endfor
  endfor
endfunction
