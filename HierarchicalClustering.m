% Hierachical Clustering

%% Random number generation for K clusters 
clc
clear all
close all
K = 3; % number of clusters 
N = 30; % number of points for each cluster, each cluster could have different observations 
mu = 0;
sigma = 0.2; 
center = [ [0, 1]; [1 0]; [-0.5 -0.5]]; % center points 
rng(0)
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


%% Hierarchical clustering method 
figure(2)
Y = pdist(X); % calculate distance between each samples 
squareform(Y);
Z = linkage(Y, 'average');
dendrogram(Z);

%% Hierachical clustering method for different data 

figure(3)
SIGMA = [0.1, 0.25, 0.75];
for i=1:length(SIGMA)
    rng(0)
    sampleValue = normrnd(mu, SIGMA(i), N*K, 2);
    X = sampleValue + [repmat(center(1, :), N, 1); repmat(center(2, :), N, 1); repmat(center(3, :), N, 1)];
    
    
    subplot(3, 2, (2*i-1));
    plot(center(:, 1), center(:, 2),'rx','MarkerSize',12, 'LineWidth',3);
    hold on;
    plot(X(1:N, 1), X(1:N, 2), 'ko');
    hold on 
    plot(X((N+1):2*N, 1), X((N+1):2*N, 2), 'mo');
    hold on 
    plot(X((2*N+1):3*N, 1), X((2*N+1):3*N, 2), 'bo');
    % legend('Cluster center', 'Cluster 1','Cluster 2','Cluster 3', 'Location','NE')
    hold off
    
    subplot(3, 2, 2*i);
    Y = pdist(X); % calculate distance between each samples 
    squareform(Y);
    Z = linkage(Y, 'average');
    dendrogram(Z);
end


