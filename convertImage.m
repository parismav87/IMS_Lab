function conversion = convertImage(image, type)
conversion = zeros(size(image));
r = image(:,:,1);
g = image(:,:,2);
b = image(:,:,3);
total = r+g+b;

if strcmp( type, 'rgb2rgbn' )
    conversion(:,:,1) = r./total;
    conversion(:,:,2) = g./total;
    conversion(:,:,3) = b./total;
elseif strcmp( type, 'rgb2opp' )    
    conversion(:,:,1) = (r-g)/sqrt(2);
    conversion(:,:,2) = (r+g-2*b)/sqrt(6);
    conversion(:,:,3) = (r+g+b)/sqrt(3);
elseif strcmp( type, 'rgb2hsv' )
    conversion = rgb2hsv(image);   
end

conversion(isnan(conversion)) = 0;

