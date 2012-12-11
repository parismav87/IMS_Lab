function [ M ] = kernel_mask(w, h)
% initialise M
    M = zeros(h, w);
    
    % calculate M using Epanechnikov
    cd = pi; % Epanechnikov param
    d = 2; % Epanechnikov param
    
    [X, Y] = ndgrid(-1 : 2/(h-1) : 1, -1 : 2/(w-1) : 1);
    
    M = epanechnikov( sqrt(X.^2 + Y.^2), cd, d );
    
    Msum = sum(sum(M));
    M = M * (1/Msum);
end