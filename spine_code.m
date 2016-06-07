%First
I = imread('pout.tif');
imshow(I)
whos I
figure
imhist(I)
I2 = histeq(I);
figure
imshow(I2)
A = imread('C:\Users\Daniel\Pictures\Neck-X-ray p1.jpg');
imshow(A)
whos A
H = imread('rice.png');
imshow(H)
background = imopen(H,strel('disk',15));
figure
surf(double(background(1:8:end,1:8:end))),zlim([0 255]);
set(gca,'ydir','reverse');
H2 = H - background;
imshow(H2)
H3 = imadjust(H2);
imshow(H3);
level = graythresh(H3);
bw = im2bw(H3,level);
bw = bwareaopen(bw, 50);
imshow(bw)
cc = bwconncomp(bw, 4)
cc.NumObjects
grain = false(size(bw));
grain(cc.PixelIdxList{50}) = true;
imshow(grain);
labeled = labelmatrix(cc);
RGB_label = label2rgb(labeled, @spring, 'c', 'shuffle');
imshow(RGB_label)
graindata = regionprops(cc, 'basic')
graindata(50).Area
grain_areas = [graindata.Area];
[min_area, idx] = min(grain_areas)
grain = false(size(bw));
grain(cc.PixelIdxList{idx}) = true;
imshow(grain);
nbins = 20;
figure, hist(grain_areas, nbins)
title('Histogram of Rice Grain Area');
imshow(A)
whos A
figure
imhist(A)
A2 = histeq(A);
figure
imshow(A2)





