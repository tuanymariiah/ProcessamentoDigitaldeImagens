function m1real = separa1real(colorida,imRotulo,rotulos1real)
  m1real = zeros(size(colorida,1),size(colorida,2),3);
  #m1real = colorida;
  for i = 1: size(colorida, 1)
    for j = 1: size(colorida, 2)
      
      for k = 1: size(rotulos1real,1)
        if imRotulo(i,j) == rotulos1real(k) 
          m1real(i,j,:) = colorida(i,j,:);   
        endif
      endfor
      
    endfor
  endfor
endfunction