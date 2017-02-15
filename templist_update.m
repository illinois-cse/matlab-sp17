cList = linspace(0, 200, 101);
fList = TempC2F(cList);

fileID = fopen('templist1.txt', 'w');
fprintf(fileID, 'Tc Tf\n');

tList = [cList; fList];
fprintf(fileID, '%f %f\n', tList);
fclose(fileID);

tData = importdata('templist1.txt');
plot(tData.data(:,1), tData.data(:,2));