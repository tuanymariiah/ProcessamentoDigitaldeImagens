clear all
close all
pkg load image

im = imread('C:\Users\jamelli\Downloads\bolinhas.jpg');
imBW = zeros(size(im,1),size(im,2));
for i=1:size(im,1)
  for j=1:size(im,2)
    if im(i,j) > 126
      imBW(i,j) = 1;
    else
      imBW(i,j) = 0;
    endif
  endfor  
endfor
figure(1)
imshow(imBW)

im2 = imBW;
for i=3:size(imBW,1)-2
  for j=3:size(imBW,2)-2
    if imBW(i,j) != 0
      im2(i+1,j+1) = 1;
				im2(i-1,j-1) = 1;
				im2(i+1,j) = 1;
				im2(i-1,j) = 1;
				im2(i,j-1)= 1;
				im2(i,j+1) = 1;
				im2(i+1,j-1) = 1;
				im2(i-1,j+1) = 1;
        im2(i-2,j) = 1;
        im2(i,j-2) = 1;
        im2(i+2,j) = 1;
        im2(i,j+2) = 1;
    endif
  endfor
endfor

im3 = im2;
for i=3:size(imBW,1)-2
  for j=3:size(imBW,2)-2
    if im2(i,j) != 0
      im3(i+1,j+1) = 1;
				im3(i-1,j-1) = 1;
				im3(i+1,j) = 1;
				im3(i-1,j) = 1;
				im3(i,j-1)= 1;
				im3(i,j+1) = 1;
				im3(i+1,j-1) = 1;
				im3(i-1,j+1) = 1;
        im3(i-2,j) = 1;
        im3(i,j-2) = 1;
        im3(i+2,j) = 1;
        im3(i,j+2) = 1;
    endif
  endfor
endfor

im4 = im3;
for i=3:size(imBW,1)-2
  for j=3:size(imBW,2)-2
    if im3(i,j) != 0
      im4(i+1,j+1) = 1;
				im4(i-1,j-1) = 1;
				im4(i+1,j) = 1;
				im4(i-1,j) = 1;
				im4(i,j-1)= 1;
				im4(i,j+1) = 1;
				im4(i+1,j-1) = 1;
				im4(i-1,j+1) = 1;
        im4(i-2,j) = 1;
        im4(i,j-2) = 1;
        im4(i+2,j) = 1;
        im4(i,j+2) = 1;
    endif
  endfor
endfor

im5 = im4;
for i = 2: size(im4,1)-1
	for j = 2: size(im4,2)-1
		if(im4(i,j) == 1 && (im4(i+1,j+1) == 0 || im4(i-1,j-1) == 0 || im4(i+1,j) == 0 ...
		|| im4(i-1,j) == 0 || im4(i,j-1) == 0 || im4(i,j+1) == 0 || im4(i+1,j-1) == 0 || im4(i-1,j+1) == 0 ))
			im5(i+1,j+1) = 1;
			im5(i-1,j-1) = 1;
			im5(i+1,j) = 1;
			im5(i-1,j) = 1;
			im5(i,j-1)= 1;
			im5(i,j+1) = 1;
			im5(i+1,j-1) = 1;
			im5(i-1,j+1) = 1;
		endif
	endfor
endfor

figure(2)
imshow(im5)
