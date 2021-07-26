function [RozkaldJazdyTablica] = WprowadzRezultatyPrzejazduTeoretycznegoDoRozladuJazdy(NazwaPlikuPrzejazdu_txt, godzynaPrzejazdu, minutaGprzejazdu, sekundaPrzejazdu)

global RozkaldJazdyTablica wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad;
% Argumenty funkcji 
% NazwaPlikuPrzejazdu_txt, godzynaPrzejazdu, minutaGprzejazdu, sekundaPrzejazdu
% NazwaPlikuPrzejazdu_txt przyklad: 'przejazd_ED74_W1-250_po_Matlabie_inter.txt', 

DziesietnaSekundyPrzejazdu = 0;

KomorkaGodzinyPrzejazdu=find(godzynaPrzejazdu==RozkaldJazdyTablica(:,1) & minutaGprzejazdu==RozkaldJazdyTablica(:,2) & sekundaPrzejazdu==RozkaldJazdyTablica(:,3) & DziesietnaSekundyPrzejazdu==RozkaldJazdyTablica(:,4));

%%wpisanie do tablicy rozkladu jazdy przejazdu
TablicaDrogaPradRezultatPrzejazdu = PobieranieDrogiIPraduZPrzejaduTeoretycznego(NazwaPlikuPrzejazdu_txt);
dlugoscPrzejazdu=size(TablicaDrogaPradRezultatPrzejazdu,1);
kontrolaWpisaniaPrzejazduwRozkladJazdy=0;
    for dwukrotnoscKolumnyUzupelnianiaNaN = 0:wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad-1 
        % Jeœli z if = 1, wtedy uzupelniaj tablice
        kontrolaWpisaniaPrzejazduwRozkladJazdy=kontrolaWpisaniaPrzejazduwRozkladJazdy+1;
        if all(all(isnan(RozkaldJazdyTablica(KomorkaGodzinyPrzejazdu:dlugoscPrzejazdu+KomorkaGodzinyPrzejazdu+1,5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN))))==1
            RozkaldJazdyTablica(KomorkaGodzinyPrzejazdu,5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN)=0;
            RozkaldJazdyTablica(KomorkaGodzinyPrzejazdu+1:dlugoscPrzejazdu+KomorkaGodzinyPrzejazdu,5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN)=TablicaDrogaPradRezultatPrzejazdu;
            RozkaldJazdyTablica(dlugoscPrzejazdu+KomorkaGodzinyPrzejazdu+1,5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN)=0;
            break
        end
        if kontrolaWpisaniaPrzejazduwRozkladJazdy==wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad-1 & all(all(isnan(RozkaldJazdyTablica(KomorkaGodzinyPrzejazdu:dlugoscPrzejazdu+KomorkaGodzinyPrzejazdu+1,5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN))))==0
           disp('za mala wartosc stalelej wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad,')
           disp('powieksz ja gdyz przejazd ')
           disp(NazwaPlikuPrzejazdu_txt)
           disp("nie zostal wpisany w rozklad jazdy"); 
        end
    end
end