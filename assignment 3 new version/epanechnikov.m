function [ y ] = epanechnikov( x, d, cd )
if x > 1
        y = 0;
    else
        y = 0.5 * cd^(-1) * (d+2) * (1-x);
    
    y(y<0) = 0;
    
end