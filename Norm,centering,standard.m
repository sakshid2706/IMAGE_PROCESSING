clc;
clear all;
close all;

% This code performs Pixel Normalization, Pixel centering and pixel
% standardisation

%  I=imread('Copy_A.png');
% disp(I2);
I=imread('lena.jpg');
I_d=double(I);
I2 = im2double(I);


A=size(I);
b=size(A);
if b(2)==2
    ch=1;
else
    ch=A(3);
   
end

row=A(1);
col=A(2);

%Pixel normalization
maxi=double(max(max(max(I_d))));
mini=double(min(min(min(I_d))));
% disp(mini);
% disp(maxi);


I_new = double(zeros(row,col,ch));

for r = 1:row
    for c = 1:col
        for chan=1:ch
               I_new(r,c,chan)=(I_d(r,c,chan)-mini)/255;
             
        end
    end
end

%Pixel centering
B=double(mean2(I_d));
I_new_center = zeros(row,col,ch);

for r = 1:row
    for c = 1:col
        for chan=1:ch
               I_new_center(r,c,chan)=I_d(r,c,chan)-B;
        end
    end
end
C=double(mean2(I_new_center));
disp("Mean new= ");
disp(C);


%Pixel Standardization
S=std2(I_d);
I_new_stad = zeros(row,col,ch);
for r = 1:row
    for c = 1:col
        for chan=1:ch
               I_new_stad(r,c,chan)=(I_d(r,c,chan)-B)/S;
        end
    end
end

disp("new_mean= ");
disp(mean2(I_new_stad));
disp("new_std_dev= ");
disp(std2(I_new_stad));
