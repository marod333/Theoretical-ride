function [TablicaRezultatowDrogaPradPrzejazduTeoretycznego] = PobieranieDrogiIPraduZPrzejaduTeoretycznego(plik)
%Program pobiera plik - txt, kt�ry jest wynikkiem przejazdu teoretycznego
%Nast�pnie wyprowadza tablice kolumnow� (droga, pr�d) rezultat�w przejazdu

fileID = fopen(plik);
tline = fgetl(fileID);
PelnaTablicaWynikowPrzejazdu = fscanf(fileID, '%g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g', [53 inf]);
PelnaTablicaWynikowPrzejazdu=PelnaTablicaWynikowPrzejazdu';
fclose(fileID);
TablicaRezultatowDrogaPradPrzejazduTeoretycznego = [PelnaTablicaWynikowPrzejazdu(:,4), PelnaTablicaWynikowPrzejazdu(:,48)];

end