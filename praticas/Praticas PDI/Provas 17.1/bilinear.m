clear all #limpa as variáveis da memória
close all #fecha todas as janelas abertas

pkg load image
 
#1.Lendo a imagem original
im = imread('C:\Users\jamelli\Downloads\lena.jpg'); 
#figure('Name','Imagem 1') 
#imshow(im)
#2.Transformando a img em tons de cinza
imCinza = rgb2gray(im); 
figure('Name','Imagem cinza')
imshow(imCinza) 

#3.Reduzindo a imagem imCinza para 25% do seu tamanho 
x=1;
for i=1:2:size(imCinza,1)
    y=1;
    for j=1:2:size(imCinza,2)
        imPeq(x,y) = imCinza(i,j);
        y++;
    end
    x++;
end
#{
figure('Name','Imagem 3')
imshow(imPeq)
4.Escrevendo no disco imPeq como peq.jpg
imwrite(imPeq, 'C:\Users\jamelli\Downloads\peq.jpg');
#}

#5. Ampliando imagem para posterior interpolação
ampliada = uint8(zeros(512,512));
n = 1;
for i=1:2:size(ampliada,1)
    m=1;
    for j=1:2:size(ampliada,2)
        ampliada(i,j) = imPeq(n,m);
        m++;
    end
    n++;
end

figure('name','imagem ampliada')
imshow(ampliada)
bilinear = double(ampliada);

#8.Interpolação bilinear

#linhas zeradas com 4 vizinhos
for i=2:2:size(bilinear,1)-1
  for j=2:2:size(bilinear,2)-1
    bilinear(i,j) = ((bilinear(i-1,j-1) + bilinear(i+1,j-1) + bilinear(i+1,j+1) + bilinear(i-1,j+1)) / 4);
  endfor
endfor

#linhas zeradas com apenas 2 vizinhos
for i=2:2:size(bilinear,1)-1
  for j=3:2:size(bilinear,2)-1
    bilinear(i,j) = ((bilinear(i-1,j) + bilinear(i+1,j)) / 2);
  endfor
endfor

#linhas com valores != 0
for i=3:2:size(bilinear,1)-1
  for j=2:2:size(bilinear,2)-1
    bilinear(i,j) = ((bilinear(i,j+1) + bilinear(i,j-1)) / 2);
  endfor
endfor

#borda da esquerda
for i=2:2:size(bilinear)-1
  bilinear(i,1) = ( ( bilinear(i-1,1) + bilinear(i+1,1) ) / 2 );
endfor

#borda de cima
for j=2:2:size(bilinear)-1
  bilinear(1,j) = ( ( bilinear(1,j-1) + bilinear(1,j+1) ) / 2 );
endfor
#{
borda da direita
t = size(bilinear,1)-1;
for i=2:2:size(bilinear)-1
  bilinear(i,size(bilinear,1)-1) = ((bilinear(i,t-1) + (bilinear(i-1,t-1)) / 2) ) ;
  t--;
endfor  

borda de baixo
l = size(bilinear,1)-1;
for j=2:2:size(bilinear)-1
  bilinear(size(bilinear,1)-1,j) = ((bilinear(l-1,j) + (bilinear(i-1,t-1)) / 2) ) ;
  l--;
endfor
#}
figure('name','imagem bilinear')
imshow(uint8(bilinear))
#9.Escrevendo a imagem bilinear no disco
imwrite(uint8(bilinear), 'C:\Users\jamelli\Downloads\bilinear.jpg')