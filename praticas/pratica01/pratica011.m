pkg load image
clear all
close all

%L� a imagem na vari�vel fig e seta fig_degradee
fig = imread('C:\Users\Tuany Mariah\Desktop\lena.jpg');
fig_degradee = rgb2gray(fig_degradee)%comando que deixa a imagem cinza
%Mostra a figura original
figure, imshow(fig);



%Obtem a resolu��o da imagem em pixels carregados nas vari�veis abaixo
xResolution = size(fig_degradee,1); % N�mero de linhas
yResolution = size(fig_degradee,2); % N�mero de Colunas

%idVariacao varia a intensidade, gerando o degradee. Iniciando seu valor em 0-Preto
%incrementando o fatorDeVariacao a cada itera��o de y e zerando a cada itera��o de x .
idVariacao=0;
%Fator de varia��o, calculado dividindo-se o m�ximo de intensidade pela resolu��o horizontal
fatorDeVariacao = 255/yResolution;

%Percorre as linhas da matriz de pixels
for x=1:xResolution 
    %Percorre as colunas da matriz de pixels
    for y=1:yResolution 
        % Define a intensidade do pixel atual como sendo idVariacao
        fig_degradee(x,y)=idVariacao;
        %Incrementa o fatorDeVariacao � vari�vel idVariacao
        idVariacao=idVariacao-fatorDeVariacao;
    endfor;
    %zera idVariacao, para recome�ar a aplica��o do degradee na linha seguinte
    idVariacao=0;
endfor;
%Mostra a figura com o degradee aplicado
figure, imshow(fig_degradee);
%Salva em disco a nova imagem
imwrite(fig_degradee, 'C:\Users\Tuany Mariah\Desktop\lena.jpg');