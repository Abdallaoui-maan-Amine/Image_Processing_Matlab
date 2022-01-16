function [img] = Recadrage(I,Min,Max)
img=imadjust(I, stretchlim(I), [Min/255 Max/255] );
% figure;
% imhist(img);
end

