clc;
clear all;
close all;

%This code is for making a  histogram for the image

% I = imread('lena.jpg');
I = imread('cameraman.tif');
% ch = 0;
% row = 0;
% col = 0;
% 
% A = size(I);
% b = size(A);
% if b(2) == 2
%     ch = 1;
% else
%     ch = A(3);
% end

mat_cnt = zeros(1, 256);
% row = A(1);
% col = A(2);

[row,col,ch]=size(I);

for r = 1:row
    for c = 1:col
        for chan = 1:ch
            mat_cnt(I(r, c, chan) + 1) = mat_cnt(I(r, c, chan) + 1) + 1;
        end
    end
end

x=0:1:255;

bar(x,mat_cnt);
title('Custom Function');
% MATLAB's imhist for comparison
figure;
imhist(I);
title('Built-in imhist()');
