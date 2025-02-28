% aplicare filtrul medie
function R = filtru(J, m, n, w, m1, n1)
    % extinderea imaginii cu zero-uri cu cate m1-1 linii deasupra/sub imagine si cate n1-1 coloane la stanga/dreapta imaginii
    J_extins = zeros(m+m1-1, n+n1-1);
    J_extins((m1-1)/2+1:end-(m1-1)/2, (n1-1)/2+1:end-(n1-1)/2) = J;

    % calculul matricei rezultat al convoluției
    R = zeros(m, n);
    for x = 1:m
        for y = 1:n
            for s = 1:m1
                for t = 1:n1
                    R(x, y) = R(x, y) + w(s, t) * J_extins(x + s - 1, y + t - 1);
                end
            end
        end
    end
end

