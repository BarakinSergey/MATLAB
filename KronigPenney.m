function [matrix] = KronigPenney(k_input, m_input, a_input, b_input, Uo_input, Em_input, h_input)

global k Uo h m a b Em

h = h_input;
a = a_input;
b = b_input;
Uo = Uo_input;
Em = Em_input; 
m = m_input;
f=@F;

final_matrix =[];
matrix_length = 0;

for ii = 1:length(k_input)
    k = k_input(ii);
    x =[];
    for jj = Uo+0.0001:0.1:Em
        x1 = fzero(f, jj);
        y = true;
        for kk = 1:length(x)
            if abs(x(kk) - x1) < 0.0001
                y = false;
            end
        end
        if (y) && (x1 < Em)
            x = [x ; x1];
        end
    end
    x = sort(x);
    if ii == 1
        final_matrix = x;
        matrix_length = length(x);
    else 
        if matrix_length < length(x)
            final_matrix = [final_matrix; NaN.*zeros(length(x)-matrix_length, ii-1)]; 
            matrix_length = length(x);
        else
            x = [x; NaN.*zeros(matrix_length - length(x), 1)];
        end
        
        final_matrix = [final_matrix, x];
    end
end

matrix = final_matrix;
end

%right part of equation
function fr = F(E)
global k Uo h m a b
mu = (2*m.*E/h.^2).^0.5;
lambda = (2*m.*(E-Uo)/h.^2).^0.5;
fr = cos(mu.*a).*cos(lambda.*b)-(mu.^2+lambda.^2)./(2*mu.*lambda).*sin(mu.*a).*sin(lambda.*b)-cos(k.*(a+b));
end