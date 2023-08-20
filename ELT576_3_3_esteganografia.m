# Semana 3 - Desafio 3

close all, clc;

# Carregando o arquivo whalecalls.mat2

baleias = load("whalecalls");

fieldnames(baleias)

Fs = baleias.fs;  # frequÊncia de amostragem 4000hz

calls1 = baleias.X1;  # matriz com 15 linhas, onde cada linha é um audio
calls2 = baleias.X2;  # matriz com 9 linhas, onde cada linha é um audio

# Ouvindo alguns audios
# Matriz 1
soundsc(calls1(1,:), Fs);
pause;
soundsc(calls1(7,:), Fs);
pause;
soundsc(calls1(14,:), Fs);
pause;
# Matriz 2
soundsc(calls2(3,:), Fs);
pause;
soundsc(calls2(5,:), Fs);
pause;
soundsc(calls2(9,:), Fs);

# Criando os espectrogramas da Matriz 1
figure;
for i = 1:4
  [S,F,T] = espectrograma(calls1(i,:),100,2,500,Fs);
  subplot(2,2,i);
  surf(T,F,10*log10(abs(S)),'EdgeColor','none');
  axis xy;
  axis tight;
  view(0,90);
  xlabel('Tempo (s)');
  ylabel('Frequencia (Hz)');
endfor

# Criando os espectrogramas da Matriz 2
figure;
for i = 1:4
  [S,F,T] = espectrograma(calls2(i,:),100,2,500,Fs);
  subplot(2,2,i);
  surf(T,F,10*log10(abs(S)),'EdgeColor','none');
  axis xy;
  axis tight;
  view(0,90);
  xlabel('Tempo (s)');
  ylabel('Frequencia (Hz)');
endfor

