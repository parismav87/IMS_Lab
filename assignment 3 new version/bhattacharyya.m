function [coef]=bhattacharyya(X1,X2)
    
    coef = sum(sum(sqrt(X1.*X2)));
    
end
