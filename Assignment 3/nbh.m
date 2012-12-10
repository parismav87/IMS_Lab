function nbharray = nbh(image,i,j,N)

    [imax,jmax,junk] = size(image);
    iind = ceil(i) + (-N:+N);
    jind = ceil(j) + (-N:+N);
    iind = max(min(iind,imax),1);
    jind = max(min(jind,jmax),1);
    
    nbharray = image(jind,iind,:);
end
    