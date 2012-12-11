function [y1 y2] = new_position(w,xi)

%     sumW = sum(sum(w));
%     y1=0;
%     y2=0;
%     
%     x1 = xi(:,:,1);
%     x2 = xi(:,:,2);
%     
%     x1 = x1(:);
%     x2 = x2(:);
%     
%     for i = 1: size(w)
%     y1 = x1(i)*w(i)/sumW;
%     y2 = x2(i)*w(i)/sumW;
%     end
    
y1=round(sum(xi(:,:,2) .* w)/sum(w));
y2=round(sum(xi(:,:,1) .* w)/sum(w));
    