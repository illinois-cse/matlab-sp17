clear all;

%# load data, and shuffle instances order
load fisheriris
ord = randperm(size(meas,1));
meas = meas(ord,:);
species = species(ord);

%# lets split into training/testing
training = meas(1:100,:);         %# 100 rows, each 4 features
testing = meas(101:150,:);        %# 50 rows
train_class = species(1:100);     %# three possible classes
test_class = species(101:150);

%# train model
nb = fitcnb(training, train_class);

%# prediction
y = nb.predict(testing);

%# confusion matrix
confusionmat(test_class,y)

