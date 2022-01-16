function [f] = Puissance(I,gamma,cte)
I=rgb2gray(I);
I = im2double(I);
[m,n] = size(I);    %Pixcels values store in m,n(Row and col)
% gamma=2;
% cte=1;
for i=1:m   %access the row pixcels
    for j=1:n  %access the col pixcels
        f(i,j)= cte*(I(i,j)^gamma);   %Power Formula
    end
end
% subplot(1,2,1);
% imshow(I);
% title('Orignal image');
% subplot(1,2,2);
% imshow(f);
% title('power image');
end

