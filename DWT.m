clc;
clear all;
close all;

I=imread("cameraman.tif");
figure;
imshow(I);
I2=double(I);
title("Original Image");

%calling Function
Dwt2=twoLevelDwt(double(I2));
figure;
imshow(uint8(Dwt2));
title("Two level DWT");

function img=harr_row_lp(img)
img=xcorr2(img,[0.5 0.5]);
img=img(:,2:2:end);
end

function img=harr_row_hp(img)
img=xcorr2(img,[1 -1]);
img=img(:,2:2:end);
end

function img=harr_col_lp(img)
img=xcorr2(img,[0.5 0.5].');
img=img(2:2:end,:);
end

function img=harr_col_hp(img)
img=xcorr2(img,[1 -1].');
img=img(2:2:end,:);
end


function [ll,lh, hl,hh]=one_level_dwt(img)
img=double(img);
rlp=harr_row_lp(img);
ll=harr_col_lp(rlp);
lh=harr_col_hp(rlp);

rhp=harr_row_hp(img);
hl=harr_col_lp(rhp);
hh=harr_col_hp(rhp);
end

function final_img=twoLevelDwt(img)
img=double(img);
[ll,lh,hl,hh]=one_level_dwt(img);
[ll1,lh1,hl1,hh1]=one_level_dwt(ll);

i1=[ll1 lh1;hl1 hh1];
final_img=[i1 lh;hl hh];
end








