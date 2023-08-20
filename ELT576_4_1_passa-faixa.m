# Exercicio 1

# Criando o sinal de interesse
close all, clc, clear;
pkg load signal;
fs = 2048;
t = 0:1/fs:5;
s = sin(2*pi*262*t);

# Desenhando sinal de interesse
figure;
subplot(2, 1, 1)
stem(t,s);
axis([0 0.024 -30 30]);
title('Sinal de interesse', 'fontsize', 12);
xlabel('Tempo (s)', 'fontsize', 12)

# Adicionando ruído ao sinal de interesse
ruido = load('ruido.txt');
x = s + ruido;
subplot(2,1,2)
stem(t,x);
axis([0 0.024 -30 30]);
title('Sinal + ruído', 'fontsize', 12);
xlabel('Tempo (s)', 'fontsize', 12)

# Montando espectograma do sinal
nfft = 1024;
overlap = .5;
[spectra,freq] = pwelch(x,nfft,overlap,nfft,fs,'half','db');
figure;plot(freq,spectra)
title('Espectro do sinal + ruído', 'fontsize', 12);
xlabel('Frequência (Hz)', 'fontsize', 12)
axis tight;

# Criação do filtro passa faixa do tipo Butterworth
# Frequências do filtro são ponderadas por metade do valor da frequencia de amostragem
f1 = 260;
f2 = 264;
n = 4;
[B, A] = butter (n, [f1/(fs/2) f2/(fs/2)]);
figure;
freqz(B,A,nfft,fs);

# Aplicando o filtro aos dados
y = filtfilt(B,A,x);

# Desenhando sinal filtrado
figure;plot(t,y);
axis([0 0.04 -30 30]);
title('Sinal de interesse recuperado', 'fontsize', 12);
xlabel('Tempo (s)', 'fontsize', 12)
