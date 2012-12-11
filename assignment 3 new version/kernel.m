function k = kernel(x,d,cd,h,w)

    k=zeros(h,w);
    
    if x(:,:)>1
        k(:,:)=0;
    else
    k(:,:) = (1/2)*(cd.^(-1))*(d+2)*(1-x(:,:));
    end
    
    

    

    

    