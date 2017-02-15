cList = linspace(0, 200, 101);
fList = TempC2F(cList);

fileID = fopen('templist.txt', 'w');
fprintf(fileID, 'Tc Tf\n');

for i=1:101
fprintf(fileID, '%f %f\n', cList(i), fList(i));
end

fclose(fileID);