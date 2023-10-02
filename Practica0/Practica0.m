%% Ejercicio 1. Matrices y vectores
clear all
close all

% 1. Crear matrices
A = [1,2;3,4;5,6;7,8];
v = [14;16;18;20];
% 2.Obtenga y visualice una matriz B concatenando la matriz A y el vector v.
%B = cat(2, A, v);
B = [A,v];
disp('B = ');
disp(B);

% 3. Obtenga y visualice un vector fila resultado de concatenar las filas de la matriz B
nfilas = size(B,1);
V = [];
for i=1:nfilas
    fila = B(i,:); %: todos los elementos de esa fila
    V=[V,fila];
end

disp('V=');
disp(V);

%Forma rápida
V2 = B'; % TRASPUESTA DE B
V2 = V2(:)';
disp('V2=');
disp(V2);

% 4. Obtenga y visualice un vector columna resultado de concatenar las columnas de la matriz B.
C = B(:);
disp('C=');
disp(C);


%%  Ejercicio 2. Matrices y vectores.
clear all
close all
% Realice un script de Matlab que permita desarrollar una serie de operaciones con una matriz
% 1. El script ha de generar una matriz, cuadrada y aleatoria de tamaño indicado por el usuario. En la línea de comandos se ha de visualizar el mensaje: "Indique el tamaño de la matriz".

n = input('Indique el tamaño de la matriz: ');
A = rand(n);

% 2. A partir de la matriz construida, el script deberá calcular y presentar por pantalla los siguientes datos:
% a) Matriz generada
disp("matriz A: ")
disp(A)

% b) Una segunda matriz formada por las columnas impares de la matriz inicial
B=A(:,1:2:n);
disp('B= ');
disp(B);

% c) El valor de los elementos de la diagonal de la matriz generada
C = diag(A);
disp('C= ');
disp(C);

% d) Valor máximo, mínimo, medio y varianza de cada fila. Estos valores se han de representar gráficamente, indicando en el eje de abscisas el número de fila

vector_max = [];
vector_min = [];
vector_mean = [];
vector_var = [];

for i = 1:n
    fila = A(i,:);
    maximo = max(fila);
    minimo= min(fila);
    media= mean(fila);
    varianza = var(fila);

    vector_max = [vector_max,maximo];
    vector_min = [vector_min,minimo];
    vector_mean = [vector_mean,media];
    vector_var = [vector_var,varianza];
end
 
figure(1)
plot(vector_max,'ro')
figure(2)
plot(vector_min,'b*')
figure(3)
plot(vector_mean,'g+')
figure(4)
plot(vector_var,'m*')
hold off;
xlabel('numero de fila')
ylabel('valor')
title('max, min,var de las filas de A')
legend({'Maximo','Minimo','Media','Varianza'})

%% Ejercicio 3. Matrices y vectores.
clear all
close all
% Programe un script en Matlab que permita realizar una serie de operaciones con dos matrices (A y B) que se introducirán por teclado. Para ello:
% 1. Solicite al usuario las dimensiones de las matrices en formato [filas cols], (si se introduce un único número, la matriz será cuadrada).
input_str = input('Ingrese las dimensiones de la matriz en formato [filas cols]: ', 's');

Dimensiones = str2num(input_str);

if length(Dimensiones) == 1
    Dimensiones = [Dimensiones Dimensiones];
end

% 2. Genere dos matrices (A y B) de las dimensiones elegidas. Para rellenar las matrices, escriba una
% función en Matlab (en un fichero diferente) que reciba como parámetro las dimensiones deseadas
% [filas cols], y devuelva la matriz rellena.
A = IntroducirMatriz(Dimensiones);
B = IntroducirMatriz(Dimensiones);

disp('A= ')
disp(A)
disp('B= ')
disp(B)
% 4. Calcule y muestre por pantalla:
% Calcular la transpuesta de A y B
if isequal(size(A), size(B))
    A_transpuesta = A';
    B_transpuesta = B';
else
    fprintf('No se puede calcular la transpuesta porque las dimensiones de A y B son diferentes.\n');
end

% Calcular la inversa de A y B
if isequal(size(A), size(B)) && size(A, 1) == size(A, 2)
    A_inversa = inv(A);
    B_inversa = inv(B);
else
    fprintf('No se puede calcular la inversa porque una de las matrices no es invertible (determinante igual a cero).\n');
end

% Calcular el determinante de A y B
if isequal(size(A), size(B)) && size(A, 1) == size(A, 2)
    determinante_A = det(A);
    determinante_B = det(B);
else
    fprintf('No se puede calcular el determinante porque las dimensiones de A y B son diferentes.\n');
end

% Calcular el rango de A y B
rango_A = rank(A);
rango_B = rank(B);

% Calcular el producto matricial de A y B
if size(A, 2) == size(B, 1)
    producto_matricial = A * B;
else
    fprintf('No se puede calcular el producto matricial porque las dimensiones de A y B no son compatibles.\n');
end

% Calcular el producto elemento a elemento de A y B
if isequal(size(A), size(B))
    producto_elemento_a_elemento = A .* B;
else
    fprintf('No se puede calcular el producto elemento a elemento porque las dimensiones de A y B son diferentes.\n');
end

% Verificar si es posible concatenar las filas y columnas
if isequal(size(A, 1), size(B, 1))
    % Concatenar filas
    vector_fila = [A(1, :), B(1, :)];
else
    fprintf('No se pueden concatenar las filas porque el número de filas en A y B es diferente.\n');
end

if isequal(size(A, 2), size(B, 2))
    % Concatenar columnas
    vector_columna = [A(:, 1); B(:, 1)];
else
    fprintf('No se pueden concatenar las columnas porque el número de columnas en A y B es diferente.\n');
end

% Mostrar resultados

if exist('A_transpuesta', 'var')
    disp('Transpuesta de A:');
    disp(A_transpuesta);
end

if exist('B_transpuesta', 'var')
    disp('Transpuesta de B:');
    disp(B_transpuesta);
end

if exist('A_inversa', 'var')
    disp('Inversa de A:');
    disp(A_inversa);
end

if exist('B_inversa', 'var')
    disp('Inversa de B:');
    disp(B_inversa);
end

if exist('determinante_A', 'var')
    disp('Determinante de A:');
    disp(determinante_A);
end

if exist('determinante_B', 'var')
    disp('Determinante de B:');
    disp(determinante_B);
end

if exist('rango_A', 'var')
    disp('Rango de A:');
    disp(rango_A);
end

if exist('rango_B', 'var')
    disp('Rango de B:');
    disp(rango_B);
end

if exist('producto_matricial', 'var')
    disp('Producto matricial de A y B:');
    disp(producto_matricial);
end

if exist('producto_elemento_a_elemento', 'var')
    disp('Producto elemento a elemento de A y B:');
    disp(producto_elemento_a_elemento);
end

if exist('vector_fila', 'var')
    disp('Vector fila concatenado:');
    disp(vector_fila);
end

if exist('vector_columna', 'var')
    disp('Vector columna concatenado:');
    disp(vector_columna);
end


%% Ejercicio 4. Tiempo de cómputo y representación gráfica
% Realice un script en Matlab que permita obtener y representar el tiempo consumido para el cálculo del
% rango y el determinante de una matriz en función de su tamaño (entre 1x1 y 25x25). Tenga en cuenta
% que:
% • La matriz se rellenará con valores aleatorios.
% • El tiempo necesario para cada operación debe obtenerse por separado.
% • Los tiempos de procesamiento para el cálculo del rango y del determinante se representarán en
% la misma gráfica, utilizando para ello diferentes colores.
% • Deben añadirse etiquetas a los ejes, y una leyenda indicando que representa cada línea. 


%% Ejercicio 5. Representación gráfica en 3D
clear all
close all

% Crear la rejilla uniforme de valores x,y:
vector_x = linspace(-5,5,20); %20 puntos de muestreo de -5 a 5
vector_y = linspace(-5,5,20);
[X,Y] = meshgrid(vector_x,vector_y);

%.* hace la multiplicación por cada elemento de la matriz
Z = Y.*sin(pi*X/10) + 5*cos((X.^2+Y.^2)/8)+cos(X+Y).*cos(3*X-Y);
%{figure(1)
mesh(X,Y,Z);

figure(2)
surf(X,Y,Z);

figure(3)
contourf(X,Y,Z);%}

% En la misma figura dibuje en la parte superior y centrada la gráfica de la superficie, en la parte
% inferior izquierda la gráfica de la superficie en forma de malla y en la parte inferior derecha la
% gráfica del contorno. Además, añada la barra de color al contorno.

figure(1)
subplot()

% Deben añadirse etiquetas a los ejes, y un título a cada gráfica

%% Ejercicio 6. Sistemas lineales
clear all
close all
% Dados los siguientes sistemas lineales de 10 ecuaciones con 4 incógnitas (x1, x2, x3, x4)
% 1. Exprese el sistema de forma matricial en Matlab. Para ello, cree las matrices A y b.
A = [0,2,10,7;
    2,7,7,1;
    1,9,0,5;
    4,0,0,6;
    2,8,4,1;
    10,5,0,3;
    2,6,4,0;
    1,1,9,3;
    6,4,8,2;
    0,3,0,9];
resultados_A = [90;59;15;10;80;17;93;51;41;76];

b = [0.110,0,1,0;
    0,3.260,0,1;
    0.425,0,1,0;
    0,3.574,0,1;
    0.739,0,1,0;
    0,3.888,0,1;
    1.054,0,1,0;
    0,4.202,0,1;
    1.368,0,1,0;
    0,4.516,0,1];
resultados_b = [317;237;319;239;321;241;323;243;325;245];

% 2. Escriba un script en que permita:
%   a) Obtener el número de condición de la matriz A respecto a la inversión (numero que me dice si la matriz A es invertible, usar la funcion rcond(A)
condicion_A = cond(A);
fprintf('Número de condición de A: %f\n', condicion_A);

%   b) Resolver el sistema de ecuaciones para obtener la matriz x = [x1, x2, x3, x4]’.
x_A = linsolve(A, resultados_A);   %encuentra la solución para el vector x que satisface la ecuación A * x = resultados_A
x_b = linsolve(b, resultados_b);

%   c) Añadir ruido a la matriz b, sumándole un vector aleatorio de media 0 y desviación 1, y resuelva el sistema de ecuaciones resultante.
n = length(resultados_b);
ruido = randn(n, 1);  % Vector aleatorio con media 0 y desviación estándar 1
b_con_ruido = b * x_b + ruido;

% Resuelve el sistema
x_con_ruido = linsolve(b_con_ruido, resultados_b);
fprintf('Solución del sistema de ecuaciones (con ruido):\n');
disp(x_con_ruido);

%   d) Mostrar el resultado (con y sin ruido añadido) por pantalla.
fprintf('\nSolución del sistema de ecuaciones A (sin ruido):\n');
fprintf('x1 = %f\n', x_A(1));
fprintf('x2 = %f\n', x_A(2));
fprintf('x3 = %f\n', x_A(3));
fprintf('x4 = %f\n', x_A(4));

fprintf('\nSolución del sistema de ecuaciones b (sin ruido):\n');
fprintf('x1 = %f\n', x_b(1));
fprintf('x2 = %f\n', x_b(2));
fprintf('x3 = %f\n', x_b(3));
fprintf('x4 = %f\n', x_b(4));

fprintf('\nSolución del sistema de ecuaciones b (con ruido):\n');
fprintf('x1 = %f\n', x_con_ruido);
% Compare los resultados obtenidos en cada caso. 



%% Ejercicio 7. Polinomios
clear all
close all
% Realice una función de Matlab que permita obtener las raíces de un producto de polinomios y las
% clasifique en reales y complejas. Para ello ha de realizar los siguientes pasos:
% 1. Las entradas y salidas de la función son las que se especifican, según la siguiente sintaxis:
% [solución, reales, complejas]=raices(poli_1, poli_2)
% Ejemplo: [[-1+i, -1-i, -3], 1, 2]=raíces([1 2 2], [1 3])
% a) Recoge los arrays con los que se crean los polinomios.
% b) Solicita si la solución se aplica a uno de los polinomios o al producto: poli_1, poli_2, prod_poli.
% c) Devuelve las raíces del polinomio indicado y su clasificación (nº raíces reales y nº raíces complejas.
% d) Representa en el plano complejo la ubicación de las raíces obtenidas. 

% x^4 + 3x^3 + 2x^2 + x + 3
poli_1 = [1,3,2,1,3];

% -5x^4 + 4x^3 - 2x^2 + 6x - 1
poli_2 = [-5,4,-2,6,-1];

raices(poli_1,poli_2);

