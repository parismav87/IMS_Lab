clear all
close all
clc

%read target image
pngFiles = dir('C:\Users\Sakis\Documents\MATLAB\multimedia systems\Assignment 2/frames/*.png');
filename = pngFiles(1).name;
I = imread(filename);
I=im2double(I);
imshow(I);
drawnow;
[x,y] = ginput(1);
I_target = nbh(I,x,y,20);
target_size = size(I_target);
close all;



%area of a unit circle
[unit height_target width_target] = unit_circle(target_size);

%target kernel
k_t = kernel(unit,2,pi, height_target, width_target);

%weighted histogramm
[hist_target map_target] = rghist(I_target,16,k_t);

 xi = normalized_pixel_coordinates(I_target);


for k = 2:length(pngFiles)
    filename = pngFiles(k).name;
    I = imread(filename);
    I=im2double(I);
    coefy0=1;
    coefy1=0;
    while (coefy1<coefy0)
    I_canditate = nbh(I,x,y,20);
    [hist_canditate map_canditate] = rghist(I_canditate,16,k_t);
    [d0 coefy0]=bhattacharyya(hist_target,hist_canditate);
    w = weight_extraction(hist_target,hist_canditate,map_canditate);
    [y1 y2] = new_position(w,xi);
    y1 = x+100*y1;
    y2 = y+100*y2;
    
    I_canditate1 = nbh(I,y1,y2,20);
    [hist_canditate1 map_canditate1] = rghist(I_canditate1,16,k_t);
    [d1 coefy1]=bhattacharyya(hist_target,hist_canditate1);
    
    x=y1;
    y=y2;
    
    
    end

    imshow(I);
    rectangle('Position',[x-20,y-20,40,40])
    
    f(k)=getframe;
    
end 
movie(f)
