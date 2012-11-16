function hist = makehist(image, nbins, dim)

scale = nbins;
    

if dim == 2
    hist = zeros(nbins,nbins);%%we take nbins^dim bins
elseif dim == 3
    hist = zeros(nbins,nbins,nbins);%%we take nbins^dim bins
end

for i = 1:size(image, 1)%%loop through all x and y of image
    for j = 1:size(image, 2)
        rgb = image(i, j, :);%%take the rgb values of the point
        redbin = ceil(rgb(1)*scale); %%see in what bin these rgb values go
        greenbin = ceil(rgb(2)*scale);
        bluebin = ceil(rgb(3)*scale);
        if(redbin == 0)%%they cannot be 0
            redbin = 1;
        end
        if(greenbin == 0)
            greenbin = 1;
        end
        if(bluebin == 0)
            bluebin = 1;
        end
        if dim == 3
            hist(redbin,greenbin,bluebin) = hist(redbin, greenbin, bluebin) +1;%%add 1 to the calculated bin
        elseif dim == 2 
            hist(redbin,greenbin) = hist(redbin, greenbin) +1;%%add 1 to the calculated bin
        end
    end
end

