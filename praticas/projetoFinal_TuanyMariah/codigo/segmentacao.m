function domino = segmentacao(dominocolorido,A,erodir0)
  domino = dominocolorido;
  for i = 1: size(A, 1)
    for j = 1: size(A, 2)
      if erodir0(i,j)==1 
        domino(i,j,:) = dominocolorido(i,j,:);     
      else
        domino(i,j,:) = 0;
      endif
    endfor
  endfor
endfunction