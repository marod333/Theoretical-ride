function [RozkaldJazdyTablicaNaN] = UtworzRozklaJazdyTablicaNaN(liczbaKomumnNaN_wRozkladzieJazdy)
%Procedura Tworzy tablicê z godzinami rozkladu jazdy uzupelnion¹ NaN

%% Utwotrzenie tablicy rozkladu jazdy
liczbaGodin=23;
liczbaMinut=59;
liczbaSekund=59;
LiczbaDziesietnychSekundy=9;
liczbaKolumnWRozkladzieJazdy= 4+liczbaKomumnNaN_wRozkladzieJazdy; % 4 to liczbaGodin, liczbaMinut, liczbaSekund, LiczbaDziesietnychSekundy
% okresRozkaldJazdyTablica=[liczbaGodin,liczbaMinut,liczbaSekund,LiczbaDziesietnychSekundy];
RozkaldJazdyTablicaNaN = NaN(864000,14);
% RozkaldJazdyTablica=NaN(100,liczbaKolumnWRozkladzieJazdy)
iteracja = 1;
    for damaGodzyna = 0:liczbaGodin;
        for danaMinuta = 0:liczbaMinut;
            for danaSekunda = 0:liczbaSekund;
                for danaDziesietnaSekundy  = 0:LiczbaDziesietnychSekundy;
                    RozkaldJazdyTablicaNaN(iteracja,4)=danaDziesietnaSekundy;
                    RozkaldJazdyTablicaNaN(iteracja,3)=danaSekunda;
                    RozkaldJazdyTablicaNaN(iteracja,2)=danaMinuta;
                    RozkaldJazdyTablicaNaN(iteracja,1)=damaGodzyna;
                    iteracja = iteracja+1;
                end
            end
        end
    end
end