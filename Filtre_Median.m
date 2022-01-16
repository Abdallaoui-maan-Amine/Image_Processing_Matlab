function [Resultat] = Filtre_Median(I,taille,nbr)
I=rgb2gray(I);
If1_n = I;

% a={'medfilt2(If1_n,[',taille,' ',taille,']);'};
% disp(a)
for i = 1:nbr
    If1_n = medfilt2(I,[taille taille]);

end
% figure;
% imshow(If1_n);
% title(['Application du filtre Median de taille ',num2str(taille),'x',num2str(taille),' avec ',num2str(nbr),' répétition']);
Resultat=If1_n;
end

