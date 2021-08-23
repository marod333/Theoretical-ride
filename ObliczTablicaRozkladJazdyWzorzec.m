% RozkaldJazdyTablica
% Godzina, Minuta, Sekunda, DziesietnaSekundy, 10* [polozenie pojazdu, prad pojazdu]
clear
clc

global RozkaldJazdyTablica  wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad liczbaPojazdow liczbaWpisanychPojazdow;
%% Utwotrzenie tablicy rozkladu jazdy
% wymiarRozklaJazdyTablicaNaNnaDrogaPrad = 1 to znaczy jedna kolumna NaN na
% drogê + jedna kolumna NaN na prad

wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad=5;
RozkaldJazdyTablica=UtworzRozklaJazdyTablicaNaN(wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad*2);

% Kontrola czy wszystkie pojazdy zosta³y wpisane do RozkaldJazdyTablica
liczbaPojazdow=0;
liczbaWpisanychPojazdow=0;
% Argumenty funkcji
% NazwaPlikuPrzejazdu_txt, godzynaPrzejazdu, minutaGprzejazdu, sekundaPrzejazdu
% NazwaPlikuPrzejazdu_txt przyklad: 'przejazd_ED74_W1-250_po_Matlabie_inter.txt', 
RozkaldJazdyTablica=WprowadzRezultatyPrzejazduTeoretycznegoDoRozladuJazdy('przejazd_ED74_W1-250_po_Matlabie_inter.txt', 0 , 0, 2);
RozkaldJazdyTablica=WprowadzRezultatyPrzejazduTeoretycznegoDoRozladuJazdy('przejazd_ED74_W1-250_po_Matlabie_inter.txt', 0 , 0, 1);
RozkaldJazdyTablica=WprowadzRezultatyPrzejazduTeoretycznegoDoRozladuJazdy('przejazd_ED74_W1-250_po_Matlabie_inter.txt', 0 , 0, 10);

RozkaldJazdyTablica=WprowadzRezultatyPrzejazduTeoretycznegoDoRozladuJazdy('przejazd_ED74_W1-250_po_Matlabie_inter.txt', 0 , 0, 1);
RozkaldJazdyTablica=WprowadzRezultatyPrzejazduTeoretycznegoDoRozladuJazdy('przejazd_ED74_W1-250_po_Matlabie_inter.txt', 23 , 59, 58);
RozkaldJazdyTablica=WprowadzRezultatyPrzejazduTeoretycznegoDoRozladuJazdy('przejazd_ED74_W1-250_po_Matlabie_inter.txt', 23 , 59, 59);
RozkaldJazdyTablica=WprowadzRezultatyPrzejazduTeoretycznegoDoRozladuJazdy('przejazd_ED74_W1-250_po_Matlabie_inter.txt', 23 , 59, 57);



% Zamiana NaN na zero
RozkaldJazdyTablica(isnan(RozkaldJazdyTablica))=0;

clear liczbaPojazdow liczbaWpisanychPojazdow
save RozkaldJazdyTablica