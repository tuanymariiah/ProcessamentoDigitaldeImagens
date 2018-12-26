clear all 
close all

pkg load image

foto2 = imread('C:\Users\Tuany Mariah\Desktop\2\foto2.jpg');
img = imread('C:\Users\Tuany Mariah\Desktop\2\img2.jpg');
mascara = imread('C:\Users\Tuany Mariah\Desktop\2\mascara2.jpg');
ass = imread('C:\Users\Tuany Mariah\Desktop\2\ass.jpg');

for i=1:size(foto2,1)
  for j=1:size(foto2,2)
    fotoVertical(i,j,:) = foto2((size(foto2,1)+1)-i,j,:);
  end
end

for i=1:size(fotoVertical,1)
  for j=1:size(fotoVertical,2)
    fotoEspHorizontal(i,j,:) = fotoVertical(i,(size(fotoVertical,2)+1)-j,:);
  end
end

for i=1:size(fotoEspHorizontal,1)
  for j=1:size(fotoEspHorizontal,2)
    if (i >=0 && i<=40)&& (j>=0 && j<40)
      fotoEspHorizontal(i,j,:)= 255-fotoEspHorizontal(i,j,:);
    elseif (i >=360 && i<=400)&& (j>=0 && j<40)
      fotoEspHorizontal(i,j,:)= 255-fotoEspHorizontal(i,j,:);
    elseif (j >=360 && j<=400)&& (i>=0 && i<40)
      fotoEspHorizontal(i,j,:)= 255-fotoEspHorizontal(i,j,:);
    elseif (j >=360 && j<=400)&& (i>=360 && i<400)
      fotoEspHorizontal(i,j,:)= 255-fotoEspHorizontal(i,j,:);
    endif
  end
end

for i=1:size(img,1)
  for j=1:size(img,2)
   imgVertical(i,j,:) = img((size(img,2)+1)-j,i,:);
  end
end

teste = zeros(size(fotoEspHorizontal,1),size(fotoEspHorizontal,2));


fotoEspHorizontal = double(fotoEspHorizontal);
saida = fotoEspHorizontal;
for i=1:size(fotoEspHorizontal,1)
  for j=1:size(fotoEspHorizontal,2)
    if mascara(i,j,:) >=210 && mascara(i,j,:) <=255
      saida(i,j,:) = mascara(i,j,:); 
      elseif mascara(i,j,:) >=0 && mascara(i,j,:) <=30
      saida(i,j,:) = imgVertical(i,j,:); 
      elseif mascara(i,j,:) >=185 && mascara(i,j,:) <=192
      saida(i,j,:) = ((fotoEspHorizontal(i-1,j-1,:) + fotoEspHorizontal(i-1,j,:) + fotoEspHorizontal(i-1,j+1,:)...
    +fotoEspHorizontal(i,j-1,:)+fotoEspHorizontal(i,j+1,:)+fotoEspHorizontal(i+1,j-1,:)+fotoEspHorizontal(i+1,j,:)+fotoEspHorizontal(i+1,j+1,:))/8); 
      elseif mascara(i,j,:) >=113 && mascara(i,j,:) <=170
      saida(i,j,:) = 0;
    endif 
 end
end

figure(1)
imshow(uint8(saida))
imwrite(uint8(saida), 'C:\Users\Tuany Mariah\Desktop\2\provaTuany.jpg')
