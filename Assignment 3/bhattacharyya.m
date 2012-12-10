function [d coef]=bhattacharyya(X1,X2)



Sx1 = X1(:);
Sx2 = X2(:);
coef=0;

for i=1:size(Sx1)
        coef = coef+sqrt(Sx1(i)*Sx2(i));
end

d = sqrt(1-coef);

end
