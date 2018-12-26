pkg load image

clc
clear all
close all


im = imread('C:\Users\Tuany Mariah\Desktop\aquisicaoDomino2\red\im (2).jpg');
figure('NAME','imagem original'),imshow(im);


%HISTOGRAMA-DA-IMAGEM-ORIGINAL---------------------
 
 figure('Name','Histograma da fruta original')
 imhist(im);
 
%SEGMENTAÇÃO--------------------------------------

r = im(:,:,1);
b = im(:,:,3);
im2 = b-r;

his = imhist(im2);

%Pegando o segundo maior pico do histograma
pico2 = 0; 
indicePico2 = 0; %indice do segundo maior pico encontrado
for i=2:256
   if(his(i)>pico2)
      pico2 = his(i); 
      indicePico2 = i;
 end
end

%Procurando o vale entre os dois picos do histograma
vale = max(his); %valor do maior pico
indiceVale = 0;
for i=2:indicePico2
   if(his(i) < vale)
      vale = his(i); 
      indiceVale = i; 
  end
end

%Limiariza a imagem a partir do indice do vale do histograma
bin = ~(im2>indiceVale); %o ' ~ ' inverte os valores binarios para fazer a multiplicaÃ§Ã£o abaixo

semFundo = zeros(size(im,1),size(im,2),3, 'uint8');
semFundo = im.*bin; %para cada elemento(pixel) sera multiplicado o valor correspondente no binario (i,j) * 0 = 0 OU (i,j)*1 = (i,j)

figure('NAME','Imagem Sem Fundo'),imshow(semFundo);


%BINARIZAÇÃO-------------------------------------------------

for i=1:size(semFundo,1)
  for j=1:size(semFundo,2)
    
  if(semFundo(i,j)>60)
      imBinaria(i,j) = 1;
     else
      imBinaria(i,j) = 0;
    end
  end
end

figure('NAME','Imagem Binaria');
imshow(imBinaria);



%ELEMENTO-ESTRUTURAL-PARA-DILAATAÇÃO-E-EROSÃO----------------

matriz = [0,1,0;1,1,1;0,1,0];

%ABERTURA-1--------------------------------------------------

abertura1 = imopen (imBinaria, matriz);
figure('NAME','ABERTURA 1'),imshow(abertura1);

%PREENCHIMENTO--DE-BURACOS-----------------------------------

P1= imfill(abertura1,'holes');
figure('NAME','Preenchimento'),imshow(P1);

%erosao-1----------------------------------------------------

erosao = P1;

for i=2:size(P1,1)-1
 for j=2:size(P1,2)-1
      
      if(P1(i,j) == 1)
         
      im_erosao  = [P1(i-1,j-1),P1(i-1,j),P1(i-1,j+1);...
                    P1(i,j-1),P1(i,j),P1(i,j+1);...
                    P1(i+1,j-1),P1(i+1,j),P1(i+1,j+1)]; 
                  
                  if((sum(sum(im_erosao==matriz)))!=5)
               
                  erosao(i,j)=0;
               end
            end
         end
      end
   
figure('NAME','Imagem Erodida 1');
imshow(erosao);

%ABERTURA--2-------------------------------------------------

abertura2 = imopen (erosao, matriz);
figure('NAME','ABERTURA 2'),imshow(abertura2);


%EROSAO--2---------------------------------------------------

erosao2 = abertura2;

for i=2:size(abertura2,1)-1
 for j=2:size(abertura2,2)-1
      
      if(abertura2(i,j) == 1)
         
      im_erosao2  = [abertura2(i-1,j-1),abertura2(i-1,j),abertura2(i-1,j+1);...
                    abertura2(i,j-1),abertura2(i,j),abertura2(i,j+1);...
                    abertura2(i+1,j-1),abertura2(i+1,j),abertura2(i+1,j+1)]; 
                  
                  if((sum(sum(im_erosao2==matriz)))!=5)
               
                  erosao2(i,j)=0;
               end
            end
         end
      end
   
figure('NAME','Imagem Erodida 2');
imshow(erosao2)
%ABERTURA-3--------------------------------------------------

abertura3 = imopen (erosao2, matriz);
figure('NAME','ABERTURA 3'),imshow(abertura3);

%EROSAO--3---------------------------------------------------

erosao3 = abertura3;

for i=2:size(abertura3,1)-1
 for j=2:size(abertura3,2)-1
      
      if(abertura3(i,j) == 1)
         
      im_erosao3  = [abertura3(i-1,j-1),abertura3(i-1,j),abertura3(i-1,j+1);...
                    abertura3(i,j-1),abertura3(i,j),abertura3(i,j+1);...
                    abertura3(i+1,j-1),abertura3(i+1,j),abertura3(i+1,j+1)]; 
                  
                  if((sum(sum(im_erosao3==matriz)))!=5)
               
                  erosao3(i,j)=0;
               end
            end
         end
      end
   
figure('NAME','Imagem Erodida 3');
imshow(erosao3)


%ABERTURA--4--------------------------------------------------

abertura4 = imopen (erosao3,matriz);
figure('NAME','ABERTURA 4'),imshow(abertura4);

%EROSAO--4----------------------------------------------------

erosao4 = abertura4;

for i=2:size(abertura4,1)-1
 for j=2:size(abertura4,2)-1
      
      if(abertura4(i,j) == 1)
         
      im_erosao4  = [abertura4(i-1,j-1),abertura4(i-1,j),abertura4(i-1,j+1);...
                    abertura4(i,j-1),abertura4(i,j),abertura4(i,j+1);...
                    abertura4(i+1,j-1),abertura4(i+1,j),abertura4(i+1,j+1)]; 
                  
                  if((sum(sum(im_erosao4==matriz)))!=5)
               
                  erosao4(i,j)=0;
               end
            end
         end
      end
   
figure('NAME','Imagem Erodida 4');
imshow(erosao4)


%ABERTURA-5---------------------------------------------------

abertura5 = imopen (erosao3, matriz);
figure('NAME','ABERTURA 5'),imshow(abertura5)


%EROSAO--5----------------------------------------------------

erosao5 = abertura5;

for i=2:size(abertura5,1)-1
 for j=2:size(abertura5,2)-1
      
      if(abertura5(i,j) == 1)
         
      im_erosao5  = [abertura5(i-1,j-1),abertura5(i-1,j),abertura5(i-1,j+1);...
                    abertura5(i,j-1),abertura5(i,j),abertura5(i,j+1);...
                    abertura5(i+1,j-1),abertura5(i+1,j),abertura5(i+1,j+1)]; 
                  
                  if((sum(sum(im_erosao5==matriz)))!=5)
               
                  erosao5(i,j)=0;
               end
            end
         end
      end
   
figure('NAME','Imagem Erodida 5');
imshow(erosao5)


%ABERTURA-6---------------------------------------------------

abertura6 = imopen (erosao5, matriz);
figure('NAME','ABERTURA 6'),imshow(abertura6)


%EROSAO--6----------------------------------------------------

erosao6 = abertura6;

for i=2:size(abertura6,1)-1
 for j=2:size(abertura6,2)-1
      
      if(abertura6(i,j) == 1)
         
      im_erosao6  = [abertura6(i-1,j-1),abertura6(i-1,j),abertura6(i-1,j+1);...
                    abertura6(i,j-1),abertura6(i,j),abertura6(i,j+1);...
                    abertura6(i+1,j-1),abertura6(i+1,j),abertura6(i+1,j+1)]; 
                  
                  if((sum(sum(im_erosao6==matriz)))!=5)
               
                  erosao6(i,j)=0;
               end
            end
         end
      end
   
figure('NAME','Imagem Erodida 6');
imshow(erosao6)


%ABERTURA-7---------------------------------------------------

abertura7 = imopen (erosao6, matriz);
figure('NAME','ABERTURA 7'),imshow(abertura7)


%EROSAO--7----------------------------------------------------

erosao7 = abertura7;

for i=2:size(abertura7,1)-1
 for j=2:size(abertura7,2)-1
      
      if(abertura7(i,j) == 1)
         
      im_erosao7  = [abertura7(i-1,j-1),abertura7(i-1,j),abertura7(i-1,j+1);...
                    abertura7(i,j-1),abertura7(i,j),abertura7(i,j+1);...
                    abertura7(i+1,j-1),abertura7(i+1,j),abertura7(i+1,j+1)]; 
                  
                  if((sum(sum(im_erosao7==matriz)))!=5)
               
                  erosao7(i,j)=0;
               end
            end
         end
      end
   
figure('NAME','Imagem Erodida 7');
imshow(erosao7)


%ABERTURA-8---------------------------------------------------

abertura8 = imopen (erosao7, matriz);
figure('NAME','ABERTURA 8'),imshow(abertura8)


%EROSAO---8---------------------------------------------------

erosao8 = abertura8;

for i=2:size(abertura8,1)-1
 for j=2:size(abertura8,2)-1
      
      if(abertura8(i,j) == 1)
         
      im_erosao8  = [abertura8(i-1,j-1),abertura8(i-1,j),abertura8(i-1,j+1);...
                    abertura8(i,j-1),abertura8(i,j),abertura8(i,j+1);...
                    abertura8(i+1,j-1),abertura8(i+1,j),abertura8(i+1,j+1)]; 
                  
                  if((sum(sum(im_erosao8==matriz)))!=5)
               
                  erosao8(i,j)=0;
               end
            end
         end
      end
   
figure('NAME','Imagem Erodida 8');
imshow(erosao8)


%ABERTURA--9--------------------------------------------------

abertura9 = imopen (erosao8, matriz);
figure('NAME','ABERTURA 9'),imshow(abertura9)

%EROSAO--9----------------------------------------------------

erosao9 = abertura9;

for i=2:size(abertura9,1)-1
 for j=2:size(abertura9,2)-1
      
      if(abertura9(i,j) == 1)
         
      im_erosao9  = [abertura9(i-1,j-1),abertura9(i-1,j),abertura9(i-1,j+1);...
                    abertura9(i,j-1),abertura9(i,j),abertura9(i,j+1);...
                    abertura9(i+1,j-1),abertura9(i+1,j),abertura9(i+1,j+1)]; 
                  
                  if((sum(sum(im_erosao9==matriz)))!=5)
               
                  erosao9(i,j)=0;
               end
            end
         end
      end
   
figure('NAME','Imagem Erodida 9');
imshow(erosao9)


%ABERTURA--10--------------------------------------------------

abertura10 = imopen (erosao9, matriz);
figure('NAME','ABERTURA 10'),imshow(abertura10)


%EROSAO--10----------------------------------------------------

erosao10 = abertura10;

for i=2:size(abertura10,1)-1
 for j=2:size(abertura10,2)-1
      
      if(abertura10(i,j) == 1)
         
     im_erosao10 = [abertura10(i-1,j-1),abertura10(i-1,j),abertura10(i-1,j+1);...
                    abertura10(i,j-1),abertura10(i,j),abertura10(i,j+1);...
                    abertura10(i+1,j-1),abertura10(i+1,j),abertura10(i+1,j+1)]; 
                  
                  if((sum(sum(im_erosao10==matriz)))!=5)
               
                  erosao10(i,j)=0;
               end
            end
         end
      end
   
figure('NAME','Imagem Erodida 10');
imshow(erosao10)


%ABERTURA--11--------------------------------------------------

abertura11 = imopen (erosao10, matriz);
figure('NAME','ABERTURA 11'),imshow(abertura11)


%EROSAO--11----------------------------------------------------

erosao11 = abertura11;

for i=2:size(abertura11,1)-1
 for j=2:size(abertura11,2)-1
      
      if(abertura11(i,j) == 1)
         
     im_erosao11 = [abertura11(i-1,j-1),abertura11(i-1,j),abertura11(i-1,j+1);...
                    abertura11(i,j-1),abertura11(i,j),abertura11(i,j+1);...
                    abertura11(i+1,j-1),abertura11(i+1,j),abertura11(i+1,j+1)]; 
                  
                  if((sum(sum(im_erosao11==matriz)))!=5)
               
                  erosao11(i,j)=0;
               end
            end
         end
      end
   
figure('NAME','Imagem Erodida 11');
imshow(erosao11)


%ABERTURA--12--------------------------------------------------

abertura12 = imopen (erosao11, matriz);
figure('NAME','ABERTURA 12'),imshow(abertura12)


%EROSAO--12----------------------------------------------------

erosao12 = abertura12;

for i=2:size(abertura12,1)-1
 for j=2:size(abertura12,2)-1
      
      if(abertura12(i,j) == 1)
         
     im_erosao12 = [abertura12(i-1,j-1),abertura12(i-1,j),abertura12(i-1,j+1);...
                    abertura12(i,j-1),abertura12(i,j),abertura12(i,j+1);...
                    abertura12(i+1,j-1),abertura12(i+1,j),abertura12(i+1,j+1)]; 
                  
                  if((sum(sum(im_erosao12==matriz)))!=5)
               
                  erosao12(i,j)=0;
               end
            end
         end
      end
   
figure('NAME','Imagem Erodida 12');
imshow(erosao12)


%ABERTURA--13--------------------------------------------------

abertura13 = imopen (erosao12, matriz);
figure('NAME','ABERTURA 13'),imshow(abertura13)


%ROTULAÇAO-----------------------------------------------------

[L, NUM] = bwlabel(abertura13);

figure('NAME','Imagem Rotulada');
imshow(L,[]);
colormap(jet), colorbar;
%DESCRITOR-DE-COR----------------------------------------------