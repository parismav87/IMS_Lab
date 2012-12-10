function [M,map] =  rghist(A,bins,kernel)

[X,Y,Z]=size(A);
R = A(:,:,1);
G = A(:,:,2);
B = A(:,:,3);


div = R+G+B;
r = R./(div+0.01);
g = G./(div+0.01);


step = 1/bins;
HIST = zeros(bins,bins);
map=zeros(X,Y,2);

for l = 1 : X
    for m = 1 : Y
        for i = 0 : bins-1
            if(r(l,m)>=step*i && r(l,m)<step*(i+1))
                for j = 0 : bins-1
                     if(g(l,m)>=step*j && g(l,m)<step*(j+1))
                           HIST(i+1,j+1) =  HIST(i+1,j+1)+kernel(l,m);
                           map(l,m,1) = i+1;
                           map(l,m,2) = j+1;
                     end
                end
                  
           end
        end
    end
end
M = HIST./sum(sum(HIST));
                
   

