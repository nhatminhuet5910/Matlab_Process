%Chuong trinh de check xem Noron Network
[filename,pathname]=uigetfile('*.*','Select the input Grayscale Image');
filewithpath=strcat(pathname,filename);
I=imread(filewithpath);
figure;
imshow(I);
%Classify the image 
label=classify(net,I);
title(['Recognized Digit is ' char(label)]);