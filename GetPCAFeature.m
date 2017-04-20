function [ features_pca ] = GetPCAFeature( features, information )

features_scale = zscore(features);
covMatrix = cov(features_scale);
[eigenVector eigenValue] = eig(covMatrix);
eigenValue = diag(eigenValue);
information = 0.8;
[sortedValue index] = sort(eigenValue, 'descend');
for i=1:length(sortedValue)
    if sum(sortedValue(1:i))/sum(sortedValue) > information
        eigenIDs = index(1:i);
        break;
    end
end
eigenValue_pca = eigenValue(eigenIDs);
eigenVector_pca = eigenVector(:, eigenIDs);
features_pca = features_scale*eigenVector_pca;

end

