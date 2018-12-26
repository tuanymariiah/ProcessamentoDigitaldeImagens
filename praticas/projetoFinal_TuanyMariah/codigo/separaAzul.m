function A = separaAzul(im)
  b = im(:,:,3);
  r = im(:,:,1);
  A = b-r;
endfunction