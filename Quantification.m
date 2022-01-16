function [Img_Quantifie,map] = Quantification(I,nbr_Niveau_gris)

[Img_Quantifie, map]= gray2ind(I, nbr_Niveau_gris);

% figure;
% subplot(121);imshow(I);axis off;
% title('Image Origine');
% subplot(122);imshow(I);axis off;
% title(['Image quantifier avec ',num2str(nbr_Niveau_gris),' niveaux de gris']);
end

