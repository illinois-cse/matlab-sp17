%class=knnclassfiy(sample, training, group)

%sample matrix - column of A should be same as column of B
A = [50, 60;
    7, 2;
    13, 12;
    100, 200];

B = [1, 0;
    200, 30;
    19, 10];

%group matrix = group matrix and class matrix are column vector
%number of row in B == number of row G
G = {'1st row';
    '2nd row';
    '3rd row'};
    

%function
class = knnclassify(A,B,G);

%Display
disp('Results: ');
disp(class);

%another
A1 = [50, 60;
    7, 2;
    13, 12;
    100, 200];

B1 = [1, 0;
    200, 30;
    19, 10];

%group matrix = group matrix and class matrix are column vector
%number of row in B == number of row G
G1 = {'1st row';
    '';
    '3rd row'};
    
%function
class1 = knnclassify(A1,B1,G1);

%Display
disp('Results: ');
disp(class1);

