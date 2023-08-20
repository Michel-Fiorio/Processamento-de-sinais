# Semana 3 - Desafio 1

# Parte 1

close all

Fs = 8000;   # frequência de amostragem
L = 8000;    # Quantidade de amostras para dar 1 segundo de gráfico
t = 0:1/Fs:(L-1)/Fs;  # Criação do eixo tempo baseado na FS e L
x = 0.7*sin(2*pi*1500*t)+cos(2*pi*3000*t)+2*randn(1,L);  # calculando eixo x
figure
plot(t,x)

# Realizando a análise espectral com transformada de Fourier
X = fft(x);

# Criando a faixa de frequência da transformada.
# Ela é relacionada com a frequência de amostragem do sinal. A Fs deve ser maior que o dobro da maior frequÊncia do sinal.
# No caso, sabiamos que maior frequÊncia do sinal era 2000hz.
# Como a frequência de amostragem foi 8000hz, a largura do expectro é metade, [-4000, 4000] hz
freq = [-(L/2-1):L/2]*Fs/L;
# Como a fft é não-simétrica em relação ao eixo, temos que extrair a primeira metade dos pontos (parte inédita). A segunda metade é a repetição da primeira.
pfreq = [0:L/2]*Fs/L;

# imprimindo os 03 modos, espectro original (sem centralizar), centralizado com a função fftshift e apenas a parte inédita absoluta.
figure
#subplot(3,1,1), plot(freq,abs(X))
#subplot(3,1,2), plot(freq,abs(fftshift(X)))
#subplot(3,1,3),
plot(pfreq,abs(X(1:L/2+1)))
xlabel("Frequência", "fontsize", 14 )
ylabel("Magnitude", "fontsize", 14)

# Retornar um sinal do dominio da frequencia p/ dominio do tempo
xnew = real(ifft(X));
figure
plot(t,xnew)



# Parte 2

# Criação de um sinal y com aumento temporal do espectro de frequência
fs = 1000;    # frequência de amostragem
t = 0:1/fs:3;  # montagem do eixo tempo até 3 segundos
f0 = 150;     # frequência inicial
t1 = 3;       # tempo final
f1 = 450;     # frequência final
B = (f1-f0)/t1;
y = cos(2*pi*(f0*t+B/2*t.^2));

# Plotando a Análise de frequência do sinal
Y = abs(fft(y));
F = linspace(0,fs/2,round(length(y)/2)); # Aqui a criação do vetor do eixo das frequências. Divide-se por 2 devido a característica de não simetria da fft
figure
subplot(2,1,1)
plot(t,y)
xlabel('Tempo(s)', "fontsize", 14)
subplot(2,1,2)
plot(F,Y(1:round(length(y)/2)))
xlabel('Frequencia (Hz)', "fontsize", 14)
ylabel('Magnitude', "fontsize", 14)

# Plotando o espectograma

[S,F,T] = espectrograma(y,256,20,256,fs); % S => espectrograma, % F => vetor de frequencia, % T => vetor de tempo
figure
surf(T,F,10*log10(abs(S)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)', "fontsize", 14);
ylabel('Frequencia (Hz)', "fontsize", 14);

