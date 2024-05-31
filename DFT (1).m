clc;
clear all;
close all;

img = imread("cameraman.tif");
img = double(img(1:50,1:50));
imshow(img)
title("Original Image");
tic
inbuilt=fft2(img);
tfft=toc;
inbuiltreal = uint8(abs(inbuilt));
imshow(inbuiltreal);
title("In-Built FFT function");
figure;

tic
imgF1 = ConventionalFourier(img);
tconventional=toc;
imgF1real = uint8(abs(imgF1));
imshow(imgF1real);
title("Conventional Fourier Transform Function");
figure;

tic
imgF2 = RowColumnFourier(img);
trowcolumn=toc;
imgF2real = uint8(abs(imgF2));
imshow(imgF2real);
title("Row Column Fourier Tranform Function");
figure;

tic
imgF3 = KernelFourier(img);
tkernel=toc;
imgF3real = uint8(abs(imgF3));
imshow(imgF3real);
title("Kernel Fourier Tranform Function");

function y = ConventionalFourier(img)
    imgdoubled = double(img);
    y = zeros(size(imgdoubled,1),size(imgdoubled,2));
    wn = @(i,j,u,v) exp(-1j*2*pi*(((i-1)*(u-1)/size(imgdoubled,1)) ...
        +((j-1)*(v-1)/size(imgdoubled,2))));

    for u=1:size(img,1)
        for v=1:size(img,2)
            sum=complex(0,0);
            for i=1:size(img,1)
                for j=1:size(img,2)
                    sum = sum+imgdoubled(i,j)*wn(i,j,u,v);
                end
            end
           y(u,v)=sum;
        end
    end

end

function y=RowColumnFourier(img)
    imgdoubled = double(img);
    yrow = zeros(size(imgdoubled,1),size(imgdoubled,2));
    yfinal = zeros(size(imgdoubled,1),size(imgdoubled,2));
    for i=1:size(imgdoubled,1)
        yrow(i,:)=ConventionalFourier(imgdoubled(i,:));
    end

    for j=1:size(yrow,2)
        yfinal(:,j)=ConventionalFourier(yrow(:,j));
    end
    y=yfinal;
end

function y = KernelFourier(img)
    imgdoubled = double(img);
    y = zeros(size(imgdoubled,1),size(imgdoubled,2));
    A = zeros(size(imgdoubled,1),size(imgdoubled,2));
    wndash = @(i,j) exp(-1j*2*pi*(((i-1)*(j-1)/size(imgdoubled,1))));
    
    for i=1:size(imgdoubled,1)
        for j=1:size(imgdoubled,2)
            A(i,j)=wndash(i,j);
        end
    end
    y=A*imgdoubled*A;
end