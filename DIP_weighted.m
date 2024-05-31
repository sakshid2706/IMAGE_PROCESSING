clc;
clear all;
close all;
%weighted addition of two kinds of images

image1 = imread('similarity_images7.jpg');
image2 = imread('similarity_images8.jpg');

% Set the range and step size for weights
weight1_range = 0:0.07:1;
weight2_range = 1 - weight1_range;

for i = 1:length(weight1_range)
    weight1 = weight1_range(i);
    weight2 = weight2_range(i);
    
    Img = uint8(weight1 * double(image1) + weight2 * double(image2));

    % Display the updated image
    imshow(Img);
    title(['Weight1: ' num2str(weight1) ', Weight2: ' num2str(weight2)]);
    drawnow;

    % Pause to control the animation speed
    pause(0.0001);
end
