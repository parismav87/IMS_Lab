clear all
close all
clc

%first frame, target will be applied
frames = dir('*.png');
firstFrame = frames(1).name;
T = imread(firstFrame);
T = im2double(T);
%define target
imshow(T);
%define the tracking rectangle
trackRectangle = getrect();
%acquire rectangle's coords and size
x = round(trackRectangle(1));
y = round(trackRectangle(2));
width = round(trackRectangle(3));
height = round(trackRectangle(4));
f(1) = getframe;



%size metrics must be even numbers
if (mod(width,2) ~= 0)
    width = width+1;
end

if (mod(height,2) ~= 0)
    height = height+1;
end

%calculate target centre
centrex = x + (width/2);
centrey = y + (height/2);

%obtain target
target = get_target(T, centrex, centrey, width, height);

%draw a rectangle on the target's current position
rectangle('Position',trackRectangle);

%kernel mask
kernelMask = kernel_mask(width+1, height+1);

%target histogram
[targetHist binPixels] = rghist(target,16,kernelMask);

trackRectangle = [centrex centrey width height];

y0Coords = get_coordinates3(width, height); 

%loop over all frames
for k = 2:length(frames)-1
    firstFrame = frames(k).name;
    T = imread(firstFrame);
    T = im2double(T);
    %initialize coefficients
    coef0=1;
    coef1=0;
    while (coef1<coef0)
        %choose next image's target
    nextImage = get_target(T, centrex, centrey, width, height);
        %find centre of the target
    targetCentre = [centrex centrey];
    [nextHist binPixels2] = rghist(nextImage,16,kernelMask);
    coef0 = bhattacharyya(targetHist,nextHist);
    weights = weight_extraction(nextHist, targetHist, binPixels2);
    
    [y1 y2] = new_position(weights,y0Coords);

    y=[y1 y2];
    y = [centrex centrey]+y;
    
    nextImage2 = get_target(T, y(1), y(2),width, height);
    [nextHist2 numPixels3] = rghist(nextImage2,16,kernelMask);
    coef1 = bhattacharyya(targetHist,nextHist2);
    
    if y==targetCentre
       break; 
    end
    centrex = y(1);
    centrey = y(2);


    end
    trackRectangle = [y(1) y(2) width height];
    imshow(T);
    rectangle('Position',[y(1)-width/2,y(2)-height/(2),width,height])
    
    f(k)=getframe;
end

movie(f)

