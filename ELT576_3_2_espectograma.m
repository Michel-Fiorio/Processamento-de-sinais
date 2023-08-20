# Semana 3 - Desafio 2

close all, clc;

# Carregar arquivo de audio lena.wav

lena = audioread("lena.wav");

fs = 44100;    # frequência de amostragem do audio

soundsc(lena, fs)

t = linspace(0, 16.0653, 708480);

plot(t, lena)
axis([0 16.07])
xlabel("Segundos (s)", "fontsize", 14)

# Plotando o espectograma

nwin = fs/100;
nolap = 0;
nfft = fs/4;

[S,F,T] = espectrograma(lena,nwin,nolap,nfft,fs); % S => espectrograma, % F => vetor de frequencia, % T => vetor de tempo
figure
surf(T,F,10*log10(abs(S)),'EdgeColor','none');
colormap("gray");
axis xy;
axis tight;
view(0,90);
xlabel('Tempo (s)');
ylabel('Frequencia (Hz)');
