% Archivo IntroducirMatriz.m

function Matriz = IntroducirMatriz(Dimensiones)
% Para rellenar las matrices, escriba una
% función en Matlab (en un fichero diferente) que reciba como parámetro las dimensiones deseadas
% [filas cols], y devuelva la matriz rellena. 
% La función debe pedir datos al usuario para cada posición de la matriz. En caso de que el usuario
% escriba ‘r’, la matriz se rellenará de valores aleatorios
    filas = Dimensiones(1);
    cols = Dimensiones(2);
    
    Matriz = zeros(filas, cols);
    
    for i = 1:filas
        for j = 1:cols
            fprintf('Ingrese el valor para la posición (%d, %d): ', i, j);
            entrada = input('', 's');
            
            if strcmpi(entrada, 'r')
                % Rellenar con valores aleatorios
                Matriz(i, j) = rand();
            else
                Matriz(i, j) = str2num(entrada);
            end
        end
    end
end
