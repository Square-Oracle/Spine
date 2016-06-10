%1st thing: image enhancement
truecolor = imread('C:\Users\Daniel\Pictures\flowers.jpg');
%imshow(truecolor)
imtool(truecolor);
%stretch will make image seen better
stretched_truecolor = imadjust(truecolor, stretchlim(truecolor));
figure
imshow(stretched_truecolor)
title('Truecolor Composite after contrast stretch')
%2nd: Image Segmentation
I = imread('C:\Users\Daniel\Pictures\unnamed.jpg')
imshow(I)
Igray = rgb2gray(I);
imshow(Igray);
level = 0.28
Ithresh = im2bw(Igray, level);
imshowpair(I, Ithresh, 'montage');
%other stuff with color
Im=truecolor;
rmat=Im(:,:,1);
gmat=Im(:,:,2);
bmat=Im(:,:,3);
subplot(2,2,1), imshow(rmat);
title('Red Plane');
subplot(2,2,2), imshow(gmat);
title('Green Plane');
subplot(2,2,3), imshow(bmat);
title('Blue Plane');
subplot(2,2,4), imshow(truecolor);
title('Original Image');
%thresholding for black and white
levelr = 0.63;
levelg = 0.5;
levelb = 0.4;
i1=im2bw(rmat, levelr);
i2=im2bw(gmat, levelg);
i3=im2bw(bmat, levelb);
Isum = (i1&i2&i3);
%replotting for threshold image
subplot(2,2,1), imshow(i1);
title('Red Plane');
subplot(2,2,2), imshow(i2);
title('Green Plane');
subplot(2,2,3), imshow(i3);
title('Blue Plane');
subplot(2,2,4), imshow(Isum);
title('Sum of all the planes');
%complement image and fill in holes
Icomp = imcomplement(Isum);
Ifilled = imfill(Icomp, 'holes');
figure, imshow(Ifilled);



