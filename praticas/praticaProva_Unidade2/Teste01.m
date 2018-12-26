clear all
close all
pkg load image

im = imread('C:\Users\Tuany Mariah\Google Drive\TADS\2018.1\Processamento Digital de Imagens\praticas\praticaProva_Unidade2\prv2.jpg');
figure('name', 'Imagem Original'), imshow(im);

fig = ones(size(im,1),size(im,2));
r = im(:,:,1);
%% pegando a cor amarela
for i = 1:size(im, 1)
  for j = 1:size(im, 2)
    if im(i,j,1) > 200 && im(i,j,2)>200 && im(i,j,3)<130
      fig(i,j)=1;
      elseif im(i,j,1) > 150 && im(i,j,2)<100 && im(i,j,3)>150
      fig(i,j)=1;
      else
      fig(i,j)=0;
    endif
  endfor
endfor
figure('name', 'Imagem Mascara'), imshow(fig);

%%construcao do elementro estruturante (EE)
B = [1 1 1; 1 1 1; 1 1 1];

figee = fig; 

for i=2:size(fig,1)-1
  for j=2:size(fig,2)-1
    if(fig(i,j)==1) 
      vizA = [fig(i-1,j-1) fig(i-1,j) fig(i-1,j+1);...
            fig(i,j-1) fig(i,j) fig(i,j+1);...
            fig(i+1,j-1) fig(i+1,j) fig(i+1,j+1)];
      if (sum(sum(vizA==B))!=9) 
        figee(i,j)=0;
      end    
    end
  end
end

figure('Name','Imagem Erodida')
imshow(figee)

imComBorda = fig - figee;

figure('Name','Imagem Final Com Borda')
imshow(imComBorda)
