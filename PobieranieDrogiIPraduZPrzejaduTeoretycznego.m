function [TablicaRezultatowDrogaPradPrzejazduTeoretycznego] = PobieranieDrogiIPraduZPrzejaduTeoretycznego(plik)
%Program pobiera plik - txt, który jest wynikkiem przejazdu teoretycznego
%Nastêpnie wyprowadza tablice kolumnow¹ (droga, pr¹d) rezultatów przejazdu

fileID = fopen(plik);
tline = fgetl(fileID);
PelnaTablicaWynikowPrzejazdu = fscanf(fileID, '%g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g', [53 inf]);
PelnaTablicaWynikowPrzejazdu=PelnaTablicaWynikowPrzejazdu';
fclose(fileID);
TablicaRezultatowDrogaPradPrzejazduTeoretycznego = [PelnaTablicaWynikowPrzejazdu(:,4), PelnaTablicaWynikowPrzejazdu(:,48)];

end