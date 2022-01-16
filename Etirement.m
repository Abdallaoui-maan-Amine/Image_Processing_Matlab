function [img] = Etirement(I,Min,Max)
I=double(I);
img=((I-Min)*255) / (Max-Min) ;
img=uint8(img) ;

% figure;
% imhist(img);
end

