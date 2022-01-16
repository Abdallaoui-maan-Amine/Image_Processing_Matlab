function [Resultat] = Filtre_Moyenneur(I,taille,nbr)
If1_n = I;
w=(1/(taille^2))*ones(taille,taille);
% figure;
for i = 1:nbr
    If1_n = imfilter(If1_n,w);
end
% imshow(If1_n);
% title(['Application du filtre moyenneur avec ',num2str(nbr),' répétition'])
Resultat=If1_n;
end

