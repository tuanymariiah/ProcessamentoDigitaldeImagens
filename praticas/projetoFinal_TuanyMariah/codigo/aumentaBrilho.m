function B = aumentaBrilho(im)
  for i=1:size(im,1)
    for j=1:size(im,2)
     B(i,j,:) = im(i,j,:)-(im(i,j,:)* 0.5);
    endfor
  endfor
endfunction