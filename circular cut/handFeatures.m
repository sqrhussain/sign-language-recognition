function features = handFeatures(cent,ftips)
ftips = sortrows(ftips);
featuresmat = bsxfun(@minus,ftips,cent);
featuresmat = featuresmat(:)';
features = zeros(1,10);
features (1:length(featuresmat)) = featuresmat;
end


