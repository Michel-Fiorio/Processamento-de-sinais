# Exercicio 2

# Carregando e ouvindo o audio original

clear all, close all, clc;
pkg load signal
[Y, FS] = audioread ('bird2fil.wav');
soundsc(Y,FS)

# Calculando o espectro do sinal original
nfft = FS/2;
overlap = .5;
[spectra,freq] = pwelch(Y,nfft,overlap,nfft,FS,'half','db');
figure;plot(freq,spectra)
title('Espectro do sinal + ruído', 'fontsize', 12);
xlabel('Frequência (Hz)', 'fontsize', 12)

# Criação de um filtro passa baixa com frequência de corte 4000hz
fbaixa = 4000;
n = 4;
[B,A] = butter(n,fbaixa/(FS/2),'low');
figure; freqz(B,A,nfft,FS);

# Aplicando filtro passa baixa e ouvindo o audio
Ypb = filtfilt(B,A,Y);
[spectra,freq] = pwelch(Ypb,nfft,overlap,nfft,FS,'half','db');
figure;plot(freq,spectra)
title('Espectro do sinal após filtro passa baixa', 'fontsize', 12);
xlabel('Frequência (Hz)', 'fontsize', 12)
soundsc(Ypb,FS)

#Criação do filtro rejeita-faixa centrado em 5000hz
f1 = 4930;
f2 = 5070;
[B, A] = butter (n, [f1/(FS/2) f2/(FS/2)],'stop');
figure; freqz(B,A,nfft,FS);

# Aplicando o filtro rejeita faixa e ouvindo o audio
Ynotch = filtfilt(B,A,Y);
[spectra,freq] = pwelch(Ynotch,nfft,overlap,nfft,FS,'half','db');
figure;plot(freq,spectra)
title('Espectro do sinal após filtro rejeita faixa', 'fontsize', 12);
xlabel('Frequência (Hz)', 'fontsize', 12)
soundsc(Ynotch,FS)
