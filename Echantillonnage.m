function I_Echantillonne = Echantillonnage(I,n)
% n=80;
% img = rgb2gray(imread('cameraman.tif'));
a=size(I);
w=a(2);
h=a(1);
I_Echantillonne=zeros(100);
for i=1:n:h
    for j=1:n:w
        for k=0:n-1
            for l=0:n-1
                I_Echantillonne(i+k,j+l)=I(i,j);
 
            end
        end
    end
end
% subplot(1,2,1);
% imshow(uint8(I));title('Original Image');
% subplot(1,2,2);
% imshow(uint8(I_Echantillonne));title('Sampled Image');

end

