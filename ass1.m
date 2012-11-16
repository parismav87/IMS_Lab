function ass1()

image = imread('C:\Users\Robert\Desktop\UvA\Msc\IntelligentMultimediaSystems\Ass1\nemo1.jpg');

dimage = im2double(image);
dimagen = convertImage(dimage, 'rgb2rgbn');
dimageopp = convertImage(dimage, 'rgb2opp');
dimagenhsv = convertImage(dimage, 'rgb2hsv');
histo = makehist(dimage, 10, 3)

image_hist_RGB_3d('C:\Users\Robert\Desktop\UvA\Msc\IntelligentMultimediaSystems\Ass1\nemo1.jpg', 10, 0.3);
%axis([0 8 0 8 0 1000])
figure();
imshow(dimage);
