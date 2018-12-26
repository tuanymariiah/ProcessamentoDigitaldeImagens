
im = uint8(zeros(255,255));
x = 0;
for j=1:size(im,2)
  for i=1:size(im,1)
    im(i,j) = x;
  endfor
  x+=1;
endfor
figure(1)
imshow(im)