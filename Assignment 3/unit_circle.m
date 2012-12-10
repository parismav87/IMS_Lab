function [unit h w] = unit_circle (target_size)
    

    
    h = target_size(1);
    w = target_size(2);
    unit = zeros(h,w);
    mid_h = round(h/2);
    mid_w = round(w/2);
    
    for i=1:h
        for j=1:w
            unit(i,j) = sqrt((i-mid_h).^2+(j-mid_w).^2);
        end
    end
    
    
    unit = unit./max(max(unit));
    
    
    