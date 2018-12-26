pkg load image

clear all
close all

%Questão 1

%Leio a imagem original e exibo
entrada1 = imread('prv2.jpg');
%figure('Name','Imagem original: RGB')
%imshow(im)

r(:,:) = entrada1(:,:,1);
g(:,:) = entrada1(:,:,2);
b(:,:) = entrada1(:,:,3);

imRosaAmarelo = uint8(zeros(size(entrada1,1), size(entrada1,2), size(entrada1,3)));

%Deixando apenas onde for rosa e amarelo e o resto eu deixo em branco
for i=1:size(entrada1,1)
  for j=1:size(entrada1,2)
    if((r(i,j)>100)&&(g(i,j)>100)&&(b(i,j)<100))
      imRosaAmarelo(i,j,:) = entrada1(i,j,:);
    elseif((r(i,j)>100)&&(g(i,j)<100)&&(b(i,j)>100))
      imRosaAmarelo(i,j,:) = entrada1(i,j,:);
    else
      imRosaAmarelo(i,j,:) = 255;
    end
  end
end

%Exibindo e salvando a imagem resultante
figure('Name','Rosa e Amarelo');
imshow(imRosaAmarelo)
%imwrite(imRosaAmarelo,'2Cores.jpg');

%Transformo pra cinza e exibo a imagem cinza
imgCinza = rgb2gray(imRosaAmarelo);

figure('Name','Imagem cinza');
imshow(imgCinza)

%Binarizo a imagem
for i=1:size(imgCinza,1)
  for j=1:size(imgCinza,2)
     if(imgCinza(i,j) == 255)
      imBin(i,j) = 0;
     else
      imBin(i,j) = 1;
    end
  end
end
%Exibo resultado final
figure('Name','Imagem Binaria - m1'); 
imshow(imBin)

%-----------------------------------------------------------------------------------------------

%Questão 2

B = [1 1 1; 1 1 1; 1 1 1];


C = imBin;

for i=2:size(imBin,1)-1
  for j=2:size(imBin,2)-1
    if(imBin(i,j)==1) %se o pixel central da vizinhan�a de A = 1, deve ser analizado
      vizA = [imBin(i-1,j-1) imBin(i-1,j) imBin(i-1,j+1);...
            imBin(i,j-1) imBin(i,j) imBin(i,j+1);...
            imBin(i+1,j-1) imBin(i+1,j) imBin(i+1,j+1)];
      if (sum(sum(vizA==B))!=9) % se todos os pixels s�o iguais entre a vizinhan�a de A e B
        C(i,j)=0;
      end    
    end
  end
end

figure('Name','Imagem Erodida')
imshow(C)

final = imBin - C;
figure('Name','Bordas - m2')
imshow(final)

%---------------------------------------------------------------------------------------------------------------
%Questão 3

%Leio a imagem original e exibo
#{
entrada2 = imread('ruido.jpg');
figure('Name','Imagem original: ruido')
imshow(entrada2)

preenc = zeros(size(entrada2,1)+4,size(entrada2,2)+4);
preenc(3:size(preenc,1)-2, 3:size(preenc,2)-2)=entrada2(:,:);

%figure('Name', 'Imagem Preenchida')
%imshow(preenc, [min(min(preenc)) max(max(preenc))])

imgG = zeros(size(preenc,1), size(preenc,2));

%filtro passa baixa
%w = [1 1 1; 1 1 1; 1 1 1];

for x=2:size(preenc,1)-1
    for y=2:size(preenc,2)-1
        imgG(x,y) = (preenc(x-1,y-1) + preenc(x-1,y) + preenc(x-1,y+1) + ...
                preenc(x,y-1) + preenc(x,y) + preenc(x,y+1) + ...
                preenc(x+1,y-1) + preenc(x+1,y) + preenc(x+1,y+1))/9; 
    end
end

%cortando area excedente
g1=imgG(3:size(imgG,1)-2, 3:size(imgG,2)-2);

figure('Name', 'Resultado 1')
imshow(imgG, [min(min(imgG)) max(max(imgG))])

%-----------------------------------------------------------------------------------------------------------

%Questão 4

%Esse trecho vai dar erro apenas por causa da diferença de dimensões das imagens, pois não consegui igualar. :'(

%Leio a imagem original e exibo
original = entrada2;
borrada = [min(min(imgG)) max(max(imgG))];
figure('Name','Imagem original: suavizada')
imshow(borrada)

%Subtraio a imagem borrada da original
subMask = original - borrada;
figure('Name','Subtracao')
imshow(subMask)

%Somo a máscara à imagem original com o peso k=3
ponderada = original + 3 * subMask;
figure('Name','Final')
imshow(ponderada)


#}