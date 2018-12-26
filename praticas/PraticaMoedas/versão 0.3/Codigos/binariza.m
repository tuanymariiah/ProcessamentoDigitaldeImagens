function A = binariza(im)
  for i = 1: size(im, 1)
    for j = 1: size(im, 2)
      if im(i,j)>90 
        A(i,j) = 1;
      else
        A(i,j) = 0;    
      endif
    endfor
  endfor
endfunction
