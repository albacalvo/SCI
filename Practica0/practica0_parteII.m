% PARTE 2
clear all
close all
%% Ejercicio 1. Transformadas de señales
% 1. Obtenga la transformada z de la siguiente función
syms k a z

% Definimos la funcion f(k)
f_k = 2 + 5*k + k^2;

% Hacemos la transformada de f(k) que será F(z)
F_z = ztrans(f_k);

% Represente gráficamente las señales original y transformada.
% Como solo tiene 1 variable usamos ezplot:
ezplot(f_k);
ezplot(F_z);

% 2. Obtenga la transformada z de la siguiente función
% Definimos la funcion g(k)
g_k = sin(k)*exp(1)^((-a)*k);

% Calculamos la transformada de g(k)
F_z_2 = ztrans(g_k);

% Como tiene dos variables usamos ezsurf para representarlo
ezsurf(g_k)
ezsurf(F_z_2)

% 3. Dada la siguiente función de transferencia discreta:
T_z =(0.4*z^2)/(z^3-z^2+0.1*z+0.02);

% Obtenga y represente la respuesta al impulso del sistema.
num = [0.4];                % Coeficientes del numerador
den = [1 (-1) 0.1 0.02];    % Coeficientes del denominador

ts = 1;
transfer_t = tf(num,den,ts);
impulse_response = impulse(transfer_t);

% Representar la respuesta al impulso
stem(impulse_response);
xlabel('N'); % N representa el número de muestras
ylabel('Amplitud');
title('Respuesta al Impulso');
grid on;


% Obtenga y represente la respuesta del sistema ante una entrada escalón.
step = step(transfer_t);
stem(step);
xlabel('N'); % N representa el número de muestras
ylabel('Amplitud');
title('Respuesta al Impulso');
grid on;
