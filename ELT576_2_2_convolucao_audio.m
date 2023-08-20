# Desafio #2

close all, clc, clear;

# Carregando arquivo de audio trumpet.mat

trompete = load("trumpet.mat");

#typeinfo(trompete)
#fieldnames(trompete)

# Segregando os campos frequência de amostragem(Fs) e sinal(y)

y = trompete.y;
Fs = trompete.Fs;

# Tocando o som original

soundsc(y, Fs, 16)

pause

# Criando resposta ao impulso quadrada

h2 = [ones(1,50)/50 zeros(1,20)];

# Convolução do sinal sonoro com a resposta ao impulso quadrada
y2 = conv(y, h2);

# Tocando o som convoluido

soundsc(y2,Fs, 16);

pause

# Imprimindo gráficos

figure(1)
subplot(3, 1, 1);
plot(y)
title ("Sinal sonoro original TRUMPET", "fontsize", 16);
subplot(3, 1, 2);
stem(h2)
title ("Resposta ao impulso do sistema", "fontsize", 16);
subplot(3,1,3);
plot(y2)
title ("Sinal sonoro TRUMPET após filtro", "fontsize", 16);

# Alterando resposta ao impulso quadrada. Aumentando o número de uns.

h3 = [ones(1,100)/50 zeros(1,20)];

# Convolução do sinal sonoro com a resposta ao impulso quadrada
y3 = conv(y, h3);

# Tocando o som convoluido

soundsc(y3,Fs,16);

pause

# Alterando resposta ao impulso quadrada. Aumentando o número de zeros.

h4 = [ones(1,50)/50 zeros(1,1000)];

# Convolução do sinal sonoro com a resposta ao impulso quadrada
y4 = conv(y, h4);

# Tocando o som convoluido

soundsc(y4,Fs,16);

# Imprimindo gráficos

figure(2)
subplot(3, 1, 1);
plot(y2)
title ("Sinal sonoro TRUMPET com resposta ao impulso quadrado", "fontsize", 16);
subplot(3, 1, 2);
plot(y3)
title ("Sinal sonoro TRUMPET com resposta ao impulso aumentando número de uns", "fontsize", 16);
subplot(3,1,3);
plot(y4)
title ("Sinal sonoro TRUMPET com resposta ao impulso aumentando número de zeros", "fontsize", 16);
