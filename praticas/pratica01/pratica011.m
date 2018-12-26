pkg load image
clear all
close all

%Lê a imagem na variável fig e seta fig_degradee
fig = imread('C:\Users\Tuany Mariah\Desktop\lena.jpg');
fig_degradee = rgb2gray(fig_degradee)%comando que deixa a imagem cinza
%Mostra a figura original
figure, imshow(fig);



%Obtem a resolução da imagem em pixels carregados nas variáveis abaixo
xResolution = size(fig_degradee,1); % Número de linhas
yResolution = size(fig_degradee,2); % Número de Colunas

%idVariacao varia a intensidade, gerando o degradee. Iniciando seu valor em 0-Preto
%incrementando o fatorDeVariacao a cada iteração de y e zerando a cada iteração de x .
idVariacao=0;
%Fator de variação, calculado dividindo-se o máximo de intensidade pela resolução horizontal
fatorDeVariacao = 255/yResolution;

%Percorre as linhas da matriz de pixels
for x=1:xResolution 
    %Percorre as colunas da matriz de pixels
    for y=1:yResolution 
        % Define a intensidade do pixel atual como sendo idVariacao
        fig_degradee(x,y)=idVariacao;
        %Incrementa o fatorDeVariacao à variável idVariacao
        idVariacao=idVariacao-fatorDeVariacao;
    endfor;
    %zera idVariacao, para recomeçar a aplicação do degradee na linha seguinte
    idVariacao=0;
endfor;
%Mostra a figura com o degradee aplicado
figure, imshow(fig_degradee);
%Salva em disco a nova imagem
imwrite(fig_degradee, 'C:\Users\Tuany Mariah\Desktop\lena.jpg');