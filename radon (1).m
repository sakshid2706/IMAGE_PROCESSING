clc;
clear all;
close all;

a=[1 2 3; 1 0 3; 1 2 6];
[h,w]=size(a);
y=zeros(h+2,w+2);
% 1 2 3
% 1 0 3
% 1 2 6

%filling the first column(0 degree)
j2=1;
i2=4;
for j=1:w
    sum=0;
    for i=1:h
        sum=sum+a(i,j);
    end
    y(i2,j2)=sum;
    i2=i2-1;
end
%filling the second column(45 degree)
j2=j2+1;
for i=1:h
    for j=1:w
        if (i==j) 
            y(j2+1,j2)=y(j2+1,j2)+a(i,j);
        elseif (j==i+1) 
            y(j2,j2)=y(j2,j2)+a(i,j);
        elseif(i==j+1)
            y(j2+2,j2)=y(j2+2,j2)+a(i,j);
        elseif(i==j+2)
            y(j2+3,j2)=y(j2+3,j2)+a(i,j);
        else 
            y(j2-1,j2)=y(j2-1,j2)+a(i,j);
        end
    end
end
        
        
            

%filling the third column(90)

j2=j2+1;
i2=2;
for i=1:h
    sum=0;
    for j=1:w
        sum=sum+a(i,j);
    end
    y(i2,j2)=sum;
    i2=i2+1;
end

%filling the foruth column(135)
j2=j2+1;
%j2=4
for i=1:h
    for j=1:w
        if (i+j==2)
            y(j2-3,j2)=y(j2-3,j2)+a(i,j);
        elseif (i+j==3)
            y(j2-2,j2)=y(j2-2,j2)+a(i,j);
        elseif (i+j==4)
            y(j2-1,j2)=y(j2-1,j2)+a(i,j);
        elseif (i+j==5)
            y(j2,j2)=y(j2,j2)+a(i,j);
        else 
            y(j2+1,j2)=y(j2+1,j2)+a(i,j);
        end
    end
end


%filling the fifth column (180 degree)
j2=5;
i2=4;
for j=1:w
    sum=0;
    for i=1:h
        sum=sum+a(i,j);
    end
    y(i2,j2)=sum;
    i2=i2-1;
end
disp(y)



