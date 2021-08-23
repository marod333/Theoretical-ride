% Sprawdzone OK

function [RozkaldJazdyTablica] = WprowadzRezultatyPrzejazduTeoretycznegoDoRozladuJazdy(NazwaPlikuPrzejazdu_txt, godzynaPrzejazdu, minutaGprzejazdu, sekundaPrzejazdu)

global RozkaldJazdyTablica wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad liczbaPojazdow liczbaWpisanychPojazdow;
% Kontrola czy wszystkie pojazdy zosta³y wpisane do RozkaldJazdyTablica
liczbaPojazdow=liczbaPojazdow+1;

% Argumenty funkcji 
% NazwaPlikuPrzejazdu_txt, godzynaPrzejazdu, minutaGprzejazdu, sekundaPrzejazdu
% NazwaPlikuPrzejazdu_txt przyklad: 'przejazd_ED74_W1-250_po_Matlabie_inter.txt', 

DziesietnaSekundyPrzejazdu = 0;

KomorkaGodzinyPrzejazdu=find(godzynaPrzejazdu==RozkaldJazdyTablica(:,1) & minutaGprzejazdu==RozkaldJazdyTablica(:,2) & sekundaPrzejazdu==RozkaldJazdyTablica(:,3) & DziesietnaSekundyPrzejazdu==RozkaldJazdyTablica(:,4));

%%wpisanie do tablicy rozkladu jazdy przejazdu
TablicaDrogaPradRezultatPrzejazdu = PobieranieDrogiIPraduZPrzejaduTeoretycznego(NazwaPlikuPrzejazdu_txt);
dlugoscPrzejazdu=size(TablicaDrogaPradRezultatPrzejazdu,1);
% kontrolaWpisaniaPrzejazduwRozkladJazdy=0;
% kontrolaWpisaniaPrzejazduwRozkladJazdy_przekroczeniePolnocy=0;

liczbaWierszy_RozkaldJazdyTablica=size(RozkaldJazdyTablica,1);
    for dwukrotnoscKolumnyUzupelnianiaNaN = 0:wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad-1 
        % Jeœli z if = 1, wtedy uzupelniaj tablice
        if (dlugoscPrzejazdu+KomorkaGodzinyPrzejazdu+1)<=liczbaWierszy_RozkaldJazdyTablica
%             kontrolaWpisaniaPrzejazduwRozkladJazdy=kontrolaWpisaniaPrzejazduwRozkladJazdy+1;
            
            if (all(all(isnan(RozkaldJazdyTablica(KomorkaGodzinyPrzejazdu:dlugoscPrzejazdu+KomorkaGodzinyPrzejazdu+1,5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN)))))==1 
                
                RozkaldJazdyTablica(KomorkaGodzinyPrzejazdu,5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN)=0;
                RozkaldJazdyTablica(KomorkaGodzinyPrzejazdu+1:dlugoscPrzejazdu+KomorkaGodzinyPrzejazdu,5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN)=TablicaDrogaPradRezultatPrzejazdu;
                RozkaldJazdyTablica(dlugoscPrzejazdu+KomorkaGodzinyPrzejazdu+1,5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN)=0;
                liczbaWpisanychPojazdow=liczbaWpisanychPojazdow+1;
                break
            end
%           Sprawdzenie czy wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad jest nie
%           za ma³y, jeœli tak program prosi o powiêkszenie zmiennej: wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad
%             if dwukrotnoscKolumnyUzupelnianiaNaN==wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad-1 && all(all(isnan(RozkaldJazdyTablica(KomorkaGodzinyPrzejazdu:dlugoscPrzejazdu+KomorkaGodzinyPrzejazdu+1,5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN))))==0                                                                                      
%                disp('za mala wartosc stalej wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad,')
%                disp('powieksz ja gdyz przejazd ')
%                disp(NazwaPlikuPrzejazdu_txt)
%                disp("nie zostal wpisany w rozklad jazdy");
%                disp(" ");
%             end
        end
        
        if (dlugoscPrzejazdu+KomorkaGodzinyPrzejazdu+1)>liczbaWierszy_RozkaldJazdyTablica
           
%             kontrolaWpisaniaPrzejazduwRozkladJazdy_przekroczeniePolnocy=kontrolaWpisaniaPrzejazduwRozkladJazdy_przekroczeniePolnocy+1;
%              Sprawdzenie warunku czy mozna wpisac przejazd od polnocy (od 0h,0min,0sek,0dziesietnaSekundy) 
            if (all(all(isnan(RozkaldJazdyTablica(1:dlugoscPrzejazdu-(liczbaWierszy_RozkaldJazdyTablica-KomorkaGodzinyPrzejazdu+1),5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN)))))==1 ...
... %          Sprawdzenie warunku czy mozna wpisac przejazd do polnocy  
               && (all(all(isnan(RozkaldJazdyTablica(KomorkaGodzinyPrzejazdu:liczbaWierszy_RozkaldJazdyTablica,5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN)))))==1
%              uzupe³niaj przejazd od poczatku rozkladu jazdy Sprawdzone OK
               RozkaldJazdyTablica(1:dlugoscPrzejazdu-(liczbaWierszy_RozkaldJazdyTablica-KomorkaGodzinyPrzejazdu),5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN)=...
                                                                         TablicaDrogaPradRezultatPrzejazdu((liczbaWierszy_RozkaldJazdyTablica-KomorkaGodzinyPrzejazdu)+1:dlugoscPrzejazdu,:);
               RozkaldJazdyTablica(dlugoscPrzejazdu-(liczbaWierszy_RozkaldJazdyTablica-KomorkaGodzinyPrzejazdu)+1,5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN)=0;
%              uzupelniaj przejazd do polnocy  Sprawdzone OK
               RozkaldJazdyTablica(KomorkaGodzinyPrzejazdu,5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN)=0;
               RozkaldJazdyTablica(KomorkaGodzinyPrzejazdu+1:liczbaWierszy_RozkaldJazdyTablica,5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN)=...
                                                                         TablicaDrogaPradRezultatPrzejazdu(1:(liczbaWierszy_RozkaldJazdyTablica-KomorkaGodzinyPrzejazdu),:);
               liczbaWpisanychPojazdow=liczbaWpisanychPojazdow+1;
               break
                         
            end
            
% %           Sprawdzenie czy wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad jest nie
% %           za ma³y, jeœli tak program prosi o powiêkszenie zmiennej: wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad
%             if ... %Sprawdzenie pojazd rozpoczyna swoj przejazd przed polnoca a konczy go po
%                dwukrotnoscKolumnyUzupelnianiaNaN==wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad-1 &&...
% ... %          Sprawdzenie warunku czy mozna wpisac przejazd od polnocy (od 0h,0min,0sek,0dziesietnaSekundy)  
%                (all(all(isnan(RozkaldJazdyTablica(1:dlugoscPrzejazdu-(liczbaWierszy_RozkaldJazdyTablica-KomorkaGodzinyPrzejazdu+1),5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN)))))==0 &&...
% ... %          Sprawdzenie warunku czy mozna wpisac przejazd do polnocy  
%                (all(all(isnan(RozkaldJazdyTablica(KomorkaGodzinyPrzejazdu:liczbaWierszy_RozkaldJazdyTablica,5+2*dwukrotnoscKolumnyUzupelnianiaNaN:6+2*dwukrotnoscKolumnyUzupelnianiaNaN)))))==0
%                    
%            
%                disp('za mala wartosc stalej wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad,')
%                disp('powieksz ja gdyz przejazd ')
%                disp(NazwaPlikuPrzejazdu_txt)
%                disp("nie zostal wpisany w rozklad jazdy");
%                disp("sytuacja dotyczy przejazdu pojazdu, ktory konczy swoj przejazd po pó³nocy");
%                disp(" ");
%             end  
        end
    end
    
    if liczbaWpisanychPojazdow<liczbaPojazdow
       disp('za mala wartosc stalej wymiarTablicyRozkladuJazdy_NaNnaDrogaPrad,')
       disp('powieksz ja, gdyz przejazd ')
       disp([NazwaPlikuPrzejazdu_txt, ' godzynaPrzejazdu= ', num2str(godzynaPrzejazdu), ', minutaPrzejazdu= ', num2str(minutaGprzejazdu), ', sekundaPrzejazdu= ', num2str(sekundaPrzejazdu)])
       disp("nie zostal wpisany w rozklad jazdy")
       disp(" ");
       liczbaWpisanychPojazdow=liczbaWpisanychPojazdow+1;
    end
end