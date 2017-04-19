
clear all;
% generate some data (two classes of data points defined in two dimensions)
classA = bsxfun(@times,[1.5 1]',randn(2,100));
classB = 2+randn(2,100);

% visualize the data
figure; hold on;
h1 = scatter(classA(1,:),classA(2,:),'ko','filled');
h2 = scatter(classB(1,:),classB(2,:),'wo','filled');
set([h1 h2],'MarkerEdgeColor',[.5 .5 .5]);
legend([h1 h2],{'Class A' 'Class B'},'Location','NorthOutside');
xlabel('Dimension 1');
ylabel('Dimension 2');

X = [classA(1,:)' classA(2,:)';
     classB(1,:)' classB(2,:)'];
y = [zeros(size(classA,2),1); ones(size(classB,2),1)];

% prepare a grid of points to evaluate the model at
[xx,yy] = meshgrid(linspace(min(X(:,1)),max(X(:,1))),...
                 linspace(min(X(:,2)),max(X(:,2))));

xvals = linspace(min(X(:,1)),max(X(:,1)))
yvals = linspace(min(X(:,2)),max(X(:,2)))

gridX = [xx(:) yy(:)];


% perform linear discriminant analysis (here we use the MATLAB function
% classify.m; ideally, we would implement it from scratch so we really
% understand how it works!)
figure(1)
outputimageB = classify(gridX,X,y,'linear');
outputimageB = reshape(outputimageB,[length(yvals) length(xvals)]);
[d,hB] = contour(xvals,yvals,outputimageB)
set(hB,'LineWidth',3,'LineColor',[0 1 0]);  % make the line thick and green

