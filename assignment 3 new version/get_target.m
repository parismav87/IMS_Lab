function target = get_target(I,c_x,c_y,w,h)
    

    h=h/2;
    w=w/2;
    iind = ceil(c_x) + (-w:+w);
    jind = ceil(c_y) + (-h:+h);
    target = I(jind,iind,:);