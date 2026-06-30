%% Module 5 Lab 3 - Devesh Parekh

clc
clear

%% Question 1

imgOri = imread('Lena128.bmp'); % read in image to imgOri variable
hFig = figure(1); set(hFig, 'position', [100 100 400 350]) % set the position and size of our figure

subplot(3,3,1); imshow(imgOri), ; title('An 8-bit grayscale image'); % display the original image in subplot 1 

for k= 1 : 8
    subplot(3,3,10-k);
     X= bitget(imgOri,k);
     imshow(X, 'DisplayRange', [0,1])
     title(['BitPlane'])
end
truesize

%% Question 2: 
img1= imread('Lena512.bmp');
hFig = figure(2); set(hFig, 'position', [100 100 400 350])
subplot(2,2,1); imshow(img1), ; title('Original 512 bmp');
for qualityFactor_vector = [100:-10:10];
    filesize_vector = zeros(size(qualityFactor_vector));
    imwrite(img1, 'Lena512.jpg','Quality' ,90 )
    subplot(2,2,2);imshow('Lena512.jpg'), title('90% Quality')
    imwrite(img1, 'Lena512.jpg','Quality' ,50 )
    subplot(2,2,3);imshow('Lena512.jpg'), title('50% Quality')
    imwrite(img1, 'Lena512.jpg','Quality' ,10 )
    subplot(2,2,4);imshow('Lena512.jpg'),title('10% Quality')
end

%% Question 3
 %  The images seem to get worse in quality as the quality factor gets
 %  smaller and smaller

 %% Question 4
figure(3);
 stem(qualityFactor_vector, filesize_vector);

xlabel('quality factor (%)'); ylabel('filesize (bytes)'); title('filesize vs. image quality plot');

%% Question 5
% for jpeg, The quality of the jpeg is determined by the file size
%% Question 6

% The image can be hidden in bit planes 0 through 4

%% Question 7

% for 90%, bitplane 3 is the most optimal

% for 50%, bitplane 7

% for 10%, bitplane 4

%% Question 8
% no i dont think so. Using a different image wont make a difference since
% you can just choose the same bitplanes to hide the images.

%% Question 12 from part 5
img_boat = imread('boat.tiff');
img_host = img_boat;
img_umdMark = rgb2gray(imread('UMD_mark_Athletic.tiff')); 
img_toBeEmbedded = imresize(img_umdMark, 1/2, 'bicubic'); % reduce image size by 1/2 in both height and width

figure(109); imshow(img_host); title('host image');
figure(110); imshow(img_toBeEmbedded); title('image to be embedded');


