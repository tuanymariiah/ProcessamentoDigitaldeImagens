function moedas = segmentacao(colorida,A,C1)
  moedas = colorida;
  for i = 1: size(A, 1)
    for j = 1: size(A, 2)
      if C1(i,j)==1 
        moedas(i,j,:) = colorida(i,j,:);     
      else
        moedas(i,j,:) = 0;
      endif
    endfor
  endfor
endfunction