function [f] = Logarithmique(I,cte)
i = double(I)/255; % Normalized Image
%cte = 5; % Constant
f = cte*log(1 + (i)); % Log Transform
%subplot(1,2,1),imshow(I),title('Original Image');
%subplot(1,2,2),imshow((f)),title('Log Transformation Image');
end

