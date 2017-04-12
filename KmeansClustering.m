% Kmeans Clustering

%% Random number generation for K clusters 
clc
clear all
close all
K = 3; % number of clusters 
N = 50; % number of points for each cluster, each cluster could have different observations 
mu = 0;
sigma = 0.4; 
center = [ [0, 1]; [1 0]; [-0.5 -0.5]]; % center points 
rng('default')
sampleValue = normrnd(mu, sigma, N*K, 2);
X = sampleValue + [repmat(center(1, :), N, 1); repmat(center(2, :), N, 1); repmat(center(3, :), N, 1)];
% Y = [ones(N, 1); ones(N, 1)+1; ones(N, 1)+2 ];

figure(1)
plot(center(:, 1), center(:, 2),'rx','MarkerSize',12, 'LineWidth',3);
hold on;
plot(X(1:N, 1), X(1:N, 2), 'ko');
hold on 
plot(X((N+1):2*N, 1), X((N+1):2*N, 2), 'mo');
hold on 
plot(X((2*N+1):3*N, 1), X((2*N+1):3*N, 2), 'bo');
legend('Cluster center', 'Cluster 1','Cluster 2','Cluster 3',...
       'Location','NE')
hold off
clear mu sigma sampleValue 

%% Basics for clustering analysis 
% Clustering analysis is a type of unsupervised learning. 
% Methods of clustering analysis mainly include: K-means and hierarchical
% clustering. In this section, we will be introducing K-means method.
% Criteria to evaluate the performance of clustering include: Gap
% statistics and silhouette. 


%% K-means clustering method 
% matlab function: [idx, C, sumd, D] = kmeans(X, k, Name, Value)
% idx = cluster result for each observation
% C = center point for each cluster 
% sumd = the sum of point to center distances for each cluster 
% D =  distances from each point to every center 
figure(2)
subplot(2, 2, 1)
plot(center(:, 1), center(:, 2),'rx','MarkerSize',12, 'LineWidth',3);
hold on;
plot(X(1:N, 1), X(1:N, 2), 'ko');
hold on 
plot(X((N+1):2*N, 1), X((N+1):2*N, 2), 'mo');
hold on 
plot(X((2*N+1):3*N, 1), X((2*N+1):3*N, 2), 'bo');
legend('Cluster center', 'Cluster 1','Cluster 2','Cluster 3',...
       'Location','NE')
hold off
title('Original data')

subplot(2, 2, 2)
k = 2; % number of clusters 
idx = kmeans(X, k); % cluster the data to k groups 
gscatter(X(:,1),X(:,2),idx,...
    [0,0.5,0.5; 0.5,0,0.5],'..');
legend('Cluster 1','Cluster 2');
title( 'Cluster K = 2')

subplot(2, 2, 3)
k = 3; 
idx = kmeans(X, k); 
gscatter(X(:,1),X(:,2),idx,...
    [0,0.5,0.5; 0.5,0,0.5; 0.5,0.5,0],'..');
legend('Cluster 1','Cluster 2', 'Cluster 3');
title( 'Cluster K = 3')

subplot(2, 2, 4)
k = 4; 
idx = kmeans(X, k); 
gscatter(X(:,1),X(:,2),idx,...
    [0,0.75,0.5; 0.5,0,0.5; 0.5,0.5,0; 0.25, 0.2, 0.5],'..');
legend('Cluster 1','Cluster 2', 'Cluster 3', 'Cluster 4');
title( 'Cluster K = 4')



%% Find the best K: silhouette method 
K_candidate = 2:7;
s_value = zeros(1, length(K_candidate));
figure(3)
for i=1:length(K_candidate)
    subplot(3, 2, i)
    [cidx2,cmeans2] = kmeans(X, K_candidate(i), 'dist','sqeuclidean'); 
    [silh2, h] = silhouette(X, cidx2, 'sqeuclidean');
    s_value(i) = mean(silh2);
end

figure(4)
plot(K_candidate, s_value, 'ro--', 'LineWidth', 3)
xlabel('Number of clusters')
ylabel('Silhouette value')

[silhouette_largest, K_idx] = max(s_value);
K_best = K_candidate(K_idx)


%% Find the best K: Gap statistics method 
K_candidate = 2:7;
gapClustering = evalclusters(X,'kmeans','gap','KList',K_candidate)
figure(5);
plot(K_candidate, gapClustering.CriterionValues, 'mo--', 'LineWidth', 3)
xlabel('Number of clusters')
ylabel('Gap statistics value')

K_best = gapClustering.OptimalK 


%% Draw clustering boundary 
x1 = min(X(:,1)):0.01:max(X(:,1));
x2 = min(X(:,2)):0.01:max(X(:,2));
[x1G,x2G] = meshgrid(x1,x2);
XGrid = [x1G(:),x2G(:)];
idx2Region = kmeans(XGrid, 3, 'MaxIter',100, 'Distance', 'cosine');

figure(6);
gscatter(XGrid(:,1),XGrid(:,2),idx2Region,...
    [0,0.5,0.5; 0.5,0,0.5; 0.5,0.5,0],'..');
hold on;
plot(X(1:N, 1), X(1:N, 2), 'ko');
hold on 
plot(X((N+1):2*N, 1), X((N+1):2*N, 2), 'mo');
hold on 
plot(X((2*N+1):3*N, 1), X((2*N+1):3*N, 2), 'bo');
legend('Region 1','Region 2','Region 3', 'Cluster 3', 'Cluster 1', 'Cluster 2', 'Location','NE')
hold off; 
   


