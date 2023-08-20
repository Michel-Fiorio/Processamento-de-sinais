# Desafio #1

close all, clc;

# Criando vetor impulso que representa o sistema h

h = [1 zeros(1,20) 0.5 zeros(1,10)];
# Imprimindo gráfico
#stem(h)
#axis ([-1 35 0 1.5]);
#ylabel ("H");
#title ("Resposta ao impulso do sistema H");


# Criando o vetor entrada do sistema

x = [0 1:10 ones(1,5)*5 zeros(1,10)];
# Imprimindo gráfico
#stem(x)
#ylabel ("X");
#title ("Entrada do sistema");

# Convolução de x e h

y = conv(x, h);

# Imprimindo gráficos

subplot(3, 1, 1);
stem(x,"LineWidth",1)
axis ([-1 60]);
ylabel ("x", "fontsize", 14);
xlabel ("n", "fontsize", 14);
title ("Entrada do sistema x[n]", "fontsize", 16);

subplot(3, 1, 2)
stem(h,"LineWidth",1)
axis ([-1 60]);
ylabel ("h", "fontsize", 14);
xlabel ("n", "fontsize", 14);
title ("Resposta ao impulso do sistema h(n)", "fontsize", 16);

subplot(3,1,3)
stem(y,"LineWidth",1)
axis ([-1 60]);
ylabel ("y", "fontsize", 14);
xlabel ("n", "fontsize", 14);
title ("Saída do sistema y[n]", "fontsize", 16);
