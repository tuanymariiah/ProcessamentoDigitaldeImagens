function l = limiar(his)
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
  l = 0;
  for i=2:indicePico2
     if(his(i) < vale)
        vale = his(i); 
        l = i; 
    end
  end
endfunction