function dilatacao = dilata(im)
  dilatacao = im;
  for i = 2: size(im,1)-1
      for j = 2: size(im,2)-1
        if(im(i,j) == 1)        
          dilatacao(i+1, j-1) = 1;
          dilatacao(i, j-1) = 1;
          dilatacao(i-1, j-1) = 1;
          dilatacao(i+1, j) = 1;
          dilatacao(i-1, j) = 1;
          dilatacao(i+1, j+1) = 1;
          dilatacao(i, j+1) = 1;
          dilatacao(i-1, j+1) = 1;
        endif  
      endfor
    endfor
endfunction