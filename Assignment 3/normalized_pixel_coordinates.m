function x = normalized_pixel_coordinates(image)

    [x,y,z]=size(image);

    centerx=floor(x/2);
    centery=floor(y/2);
    
    
    for i=1:x
        x(i,:,1) = i-centerx;
        for j=1:y
            x(:,j,2) = j-centery;
        end
    end
    
    x(:,:,1) = x(:,:,1)/max(max(x(:,:,1))); 
    x(:,:,2) = x(:,:,2)/max(max(x(:,:,2)));
    