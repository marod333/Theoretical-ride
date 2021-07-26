% RozkaldJazdyTablica
% Godzina, Minuta, Sekunda, DziesietnaSekundy, 10* [polozenie pojazdu, prad pojazdu]
clear
clc

global RozkaldJazdyTablica  wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad;
%% Utwotrzenie tablicy rozkladu jazdy
% wymiarRozklaJazdyTablicaNaNnaDrogaPrad = 1 to znaczy jedna kolumna NaN na
% drogê + jedna kolumna NaN na prad
wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad=5;
RozkaldJazdyTablica=UtworzRozklaJazdyTablicaNaN(wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad*2);

% Argumenty funkcji
% NazwaPlikuPrzejazdu_txt, godzynaPrzejazdu, minutaGprzejazdu, sekundaPrzejazdu
% NazwaPlikuPrzejazdu_txt przyklad: 'przejazd_ED74_W1-250_po_Matlabie_inter.txt', 

RozkaldJazdyTablica=WprowadzRezultatyPrzejazduTeoretycznegoDoRozladuJazdy('przejazd_ED74_W1-250_po_Matlabie_inter.txt', 0 , 0, 1);
RozkaldJazdyTablica=WprowadzRezultatyPrzejazduTeoretycznegoDoRozladuJazdy('przejazd_ED74_W1-250_po_Matlabie_inter.txt', 0 , 0, 10);


% Zamiana NaN na zero
RozkaldJazdyTablica(isnan(RozkaldJazdyTablica))=0;