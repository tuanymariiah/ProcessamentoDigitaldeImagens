#{
function A = binariza(im,l)
  for i = 1: size(im, 1)
    for j = 1: size(im, 2)
      if im(i,j)>l
        A(i,j) = 1;
      else
        A(i,j) = 0;    
      endif
    endfor
  endfor
endfunction
#}
function bin = binariza(im, indiceVale)
  bin = ~(im>indiceVale);
endfunction