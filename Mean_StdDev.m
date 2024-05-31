clc;
clear all;
close all;


% This is the code snippet for finding the mean and standard deviation of
% the image
%for both black and white and coloured image

I=imread('lena.jpg');
I2=im2double(I);
B=mean2(I2);
disp("Actual mean= ");
disp(B*255);
disp("Actual standard deviation= ");
disp(std2(I));
ch=0;
row=0;
col=0;

% A=size(I2);
% b=size(A);
% if b(2)==2
%     ch=1;
% else
%     ch=A(3);
% 
% end

[row,col,ch]=size(I2);
disp(row);
disp(col);
disp(ch);
% row=A(1);
% col=A(2);


%Mean

m=MyMean(row,col,ch,I2);
disp("Calculated mean= ");
disp(m*255);
%Standard deviation
st=MyStandard(row,col,ch,I2,m);
disp("Calculated standard deviation= ");
disp(st*255);




function [mean]= MyMean(row,col,ch,Im)
s = 0;
for r = 1:row
    for c = 1:col
        for chan=1:ch
%             disp(chan)
            s=s+Im(r,c,chan);
        end
    end
end
mean=s/(row*col*ch);
end

function [stdDev]= MyStandard(row,col,ch,Im,me)
summ = 0;
for r = 1:row
    for c = 1:col
        for cha = 1:ch
        summ=summ+(Im(r,c,cha)-me)^2;
        end
    end
end
stdDev=sqrt(summ/(row*col*ch-1));
end