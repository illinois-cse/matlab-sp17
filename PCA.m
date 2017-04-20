%% Introduction 
% Principle component analysis (PCA) is a well-applied way for dimension
% reduction. It takes a linear transformation of features of the
% original dataset to reduce dimension. The steps associated with PCA are: 
%
% 1. feature scaling  
%
% 2. get covariance matrix of the scaled features
%
% 3. calculate eigenvalues and eigenvectors of covariance matrix
%
% 4. choose eigenvalues and eigenvectors 
%
% 5. compute dimension-reduced data 

%% Data access and data description 
% *wine data* 
%
% Wine data are the 13 kinds of chemical tests for 3 different types of wine grown in the same region in Italy. 
% In this tutorial, we choose 2 types of wine instead of 3 for PCA
% analysis. 
% The 13 features of wine are:
% 1) Alcohol
% 2) Malic acid
% 3) Ash
% 4) Alcalinity of ash
% 5) Magnesium
% 6) Total phenols
% 7) Flavanoids
% 8) Nonavanoid phenols
% 9) Proanthocyanins
% 10) Color intensity
% 11) Hue
% 12) OD280/OD315 of diluted wines
% 13) Proline
%
% *data access*
clear all;
mydata = csvread('data_wine.csv', 1, 0);
features = mydata(:, 2:end);
labels = mydata(:, 1);
%% 
% The first 6 rows of the data are: 
mydata(1:6, 1:14)

%% Implementation in Matlab 
% *Step 1. * feature scaling: standardilization method 
% 
% $x'_i = \frac{x_i-\bar{x}}{\sigma_x}$
features_scale = zscore(features);
features_scale(1:6, :)
%%
% *Step 2. * get covariance matrix of the scaled features
covMatrix = cov(features_scale)

%%
% *Step 3. * calculate eigenvalues and eigenvectors of covariance matrix
[eigenVector eigenValue] = eig(covMatrix);
eigenValue = diag(eigenValue)
eigenVector

%%
% *Step 4. * choose eigenvalues and eigenvectors 
% Suppose we want to keep more than 80% of the previous information 

information = 0.8;
[sortedValue index] = sort(eigenValue, 'descend');
percValue=sortedValue/sum(sortedValue);
%cumPercValue=cumsum(sortedValue)/sum(sortedValue);

figure(1)
plot(cumsum(sortedValue)/sum(sortedValue), 'mo--', 'LineWidth', 2)
xlabel('Number of principal components')
ylabel('Percentage of information (%)')

for i=1:length(sortedValue)
    if sum(sortedValue(1:i))/sum(sortedValue) > information
        eigenIDs = index(1:i);
        break;
    end
end

eigenValue_pca = eigenValue(eigenIDs)
eigenVector_pca = eigenVector(:, eigenIDs)

%%
% 5. compute dimension-reduced data 
features_pca = features_scale*eigenVector_pca;

features_pca(1:6, :)
%%%%%%%%%%%
%%%%%%%%%%%
%%%%%%%%%%%
%%%%%%%%%%%
%% Example: iris data 
clear all
load fisheriris.mat
features = meas(:, 1:3);
labels = [repmat(1, 1, 50) repmat(2, 1, 50) repmat(3, 1, 50)]';
%% 
% plot original 3-D data 
figure(2)
scatter3(features(:, 1), features(:, 2), features(:, 3), 50, labels, 'filled')
xlabel('sepal length')
ylabel('sepal width')
zlabel('petal length')
title('Kinds of Iris')

%%
% perform PCA to reduce 3-D to 2-D, and plot the new 2-D data 
% features_scale = zscore(features);
% covMatrix = cov(features_scale);
% [eigenVector eigenValue] = eig(covMatrix);
% eigenValue = diag(eigenValue);

features_pca = GetPCAFeature(features, 0.8);
figure(3)
scatter(features_pca(:, 1), features_pca(:, 2), 50, labels, 'filled')
xlabel('PCA1')
ylabel('PCA2')
title('Types of fish')

