function w = weight_extraction(q,p,map)
    
[x y z] = size(map);
w = ones(x,y);
    for i=1:x
        for j=1:y
            if (p(map(i,j,1),map(i,j,2))~=0)
            w(i,j) = sqrt(q(map(i,j,1),map(i,j,2))/p(map(i,j,1),map(i,j,2)));
            end
        end
    end