# Desafio #3

# Carregar a imagem lua.jpg

I = imread('lua.jpg');

# Imprimir a imagem

figure(1)
imshow(I, [0 255])

# Criando kernel, filtro de Laplace

F = [-1, -1, -1; -1, 8, -1; -1, -1, -1];

# Applicando o filtro na imagem

Iy = conv2(I, F, "same");

# Imprimindo a imagem filtrada

figure(2)
imshow(Iy, [0 255])

# Soma da imagem original com imagem convoluida

I1 = I + Iy;

# Imprimindo imagem somada

figure(3)
imshow(I1, [0 255])

