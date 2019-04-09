function vec = plotBlochVec(ket, color)
    lambda = ket2bv(ket);
    
    vec = line([0 lambda(1)], [0 lambda(2)], [0 lambda(3)], ...
        'LineWidth', 2, 'Marker', 'o', 'Color', color);
end

function rho = ket2dm(ket)
    rho = ket * ket';
end

function lambda = ket2bv(ket)
    rho = ket2dm(ket);
    X = [0 1; 1 0]; Z = [1 0; 0 -1]; Y = 1i * X * Z;

    lambda = real([trace(X*rho), trace(Y*rho), trace(Z*rho)]);
end