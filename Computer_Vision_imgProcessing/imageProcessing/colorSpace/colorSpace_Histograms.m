%% Module 5 Lab 1 - Devesh Parekh
clear


%% Question 1
img1=imread('Flower.bmp');
img1_r=img1(:,:,1);
img1_g=img1(:,:,2);
img1_b=img1(:,:,3);
img2=zeros(size(img1));
img2=uint8(img2);
figure(1), subplot(1,2,1),imshow(img2),title('Zero Defined Image');
img2(:,:,3)=img1_b;
subplot(1,2,2),imshow(img2),title('1 component: Blue');
img2(:,:,1)=img1_r;
img2(:,:,2)=img1_g;
subplot(1,2,2),imshow(img2),title('3 components rgb');

%% Question 2
% The bright or dark values on each color plane represent the intensity of
% the color in that pixel.
%% Question 3
img_hsv = rgb2hsv(img1);
% Size of img_hsv
disp(size(img_hsv));
%% Question 4
img_hue=img_hsv(:,:,1);
img_sat=img_hsv(:,:,2);
img_val=img_hsv(:,:,3);
figure(2);
subplot(2,2,1)
imshow(img1);
colorbar;

title("Original");
subplot(2,2,2);
imshow(img_hue);
colorbar;
title("Hue");
subplot(2,2,3);
imshow(img_sat);
colorbar;
title("Saturation");
subplot(2,2,4);
imshow(img_val);
colorbar;
title("Value");
%% Question 5
% We have encountered rgb and hsv.
%% Question 6
img3 = rgb2gray(img1);
% Size of img3

disp(size(img3));
   
%% Question 7
figure(6), imhist(img3);
xlabel("Gray Level");
ylabel("Frequency");
% The histogram shows the frequency occurrence of various gray levels in
% the image.
%% Question 8
img3_1=255-img3;
figure(7);
subplot(2,2,1);
imshow(img3);
colorbar;
title("Original");
subplot(2,2,3);
imhist(img3);

title("Original Histogram");
subplot(2,2,2);
imshow(img3_1);
colorbar;
title("Negative");
subplot(2,2,4);
imhist(img3_1);
title("Negative Histogram");
%% Question 9
t1=50;
t2=180;
img3_2=double(img3);
for i=1:size(img3,1)
    for j=1:size(img3,2)
%
        if (img3(i,j)>=t1) && (img3(i,j)<=t2)
            img3_2(i,j)=(img3_2(i,j)-t1)*255/(t2-t1);
%
        elseif (img3(i,j)<t1)

            img3_2(i,j)=0;
%
        elseif (img3(i,j)>t2)
            img3_2(i,j)=1;
        end
    end
end
img3_2=uint8(img3_2);
figure(8);
subplot(2,2,1)
imshow(img3);
colorbar;
title("Original");
subplot(2,2,2);
imshow(img3_2);
colorbar;
title("Contrast Clip and Stretch");
subplot(2,2,3);
imhist(img3);
title("Original Histogram");
subplot(2,2,4);
imhist(img3_2);
axis([0 250 0 15000]);
title("Histogram - Contrast Clipped");

%% Question 10
% There are two spikes at the left and right of the image because we set
% all values lower than t1 to 0, and all values higher than t2 to 1.
%% Question 11
% If t1=t2, then yes there would be dividing by 0. You could change the
% script by adding an if statement that checks if t1=t2.
img3_4 = histeq(img3);
figure(9);
subplot(2,2,1)
imshow(img3);
colorbar;
title("Original");
subplot(2,2,2);
imshow(img3_4);
colorbar;
title("Histogram Equalization");
subplot(2,2,3);

imhist(img3);
title("Original Histogram");
subplot(2,2,4);
imhist(img3_4);
title("Equalized Histogram");
% Compare all results
figure(10);
subplot(2,2,1)
imshow(img3);
colorbar;
title("Original");
subplot(2,2,2);
imshow(img3_1);
colorbar;
title("Negative");
subplot(2,2,3);
imshow(img3_2);
colorbar;
title("Contrast Clip and Stretch");
subplot(2,2,4);
imshow(img3_4);
colorbar;
title("Histogram Equalization");
% Compare Histogram results
figure(11);
subplot(3,1,1)
imhist(img3);
title("Original Histogram");
axis([0 250 0 800]);
subplot(3,1,2);
imhist(img3_2);
title("Contrast Clip and Stretch Histogram");
axis([0 250 0 15000]);
subplot(3,1,3);
imhist(img3_4);
title("Histogram Equalization Histogram");
axis([0 250 0 1500]);

%% Question 12
% Option i
sunflower=imread('Images\BlueBG.bmp');
sand=imread('Images\Sand.jpg');
sunflower_r=sunflower(:,:,1);
sunflower_g=sunflower(:,:,2);
sunflower_b=sunflower(:,:,3);
sunflower_final=sunflower;
[row,col]=size(sunflower_b);
for i=1:row
    for j=1:col
        if sunflower_b(i,j)>200
            sunflower_final(i,j,:)=sand(i,j,:);
        end
    end
end
figure(12);
imshow(sunflower_final);
title("Sunflower with Sand Background");

%% Question 13
% The background would be put on his shirt since it is recognized as being
% the same color as the greeclcnscreen. Yes, the special effects system would
% work, but the weatherman would appear as part of the background.

