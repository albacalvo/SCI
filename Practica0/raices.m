function [solucion, reales, complejas] = raices(poli_1, poli_2)
    % Recoge los arrays con los que se crean los polinomios.
    p1 = poly2sym(poli_1);
    p2 = poly2sym(poli_2);
    
    % Solicita si la solución se aplica a uno de los polinomios o al producto
    fprintf('Elija el polinomio para encontrar las raíces:\n');
    fprintf('1. Polinomio 1\n');
    fprintf('2. Polinomio 2\n');
    fprintf('3. Producto de Polinomios\n');
    choice = input('Ingrese el número correspondiente al polinomio: ');

    switch choice
        case 1
            % Encuentra las raíces del Polinomio 1
            solucion = roots(poli_1);
        case 2
            % Encuentra las raíces del Polinomio 2
            solucion = roots(poli_2);
        case 3
            % Encuentra las raíces del producto de los polinomios
            prod_poli = p1 * p2;
            solucion = roots(sym2poly(prod_poli));
        otherwise
            error('Opción no válida.');
    end
    
    % Clasifica las raíces en reales y complejas
    reales = sum(imag(solucion) == 0);
    complejas = sum(imag(solucion) ~= 0);
    fprintf('Soluciones:\n')
    disp(solucion);
    % Representa en el plano complejo la ubicación de las raíces obtenidas
    figure;
    plot(real(solucion), imag(solucion), 'o');
    title('Raíces en el Plano Complejo');
    xlabel('Parte Real');
    ylabel('Parte Imaginaria');
    grid on;
end