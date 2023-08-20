# Desafio #3

# Carregar a imagem texto.jpg

T = imread('texto.jpg');

# Imprimir a imagem

figure(1)
imshow(T, [0 255])

# Criando kernel, filtro de Laplace

F = [1, 1, 1; 1, 1, 1; 1, 1, 1]/9;

# Applicando o filtro na imagem

Ty = conv2(T, F, "same");

# Imprimindo a imagem filtrada

figure(2)
imshow(Ty, [0 255])


