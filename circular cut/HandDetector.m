function [ handImage , bounds ] = HandDetector( grayImage )


binaryImage = im2bw(grayImage,graythresh(grayImage));
%binaryImage = grayImage < 150;
binaryImage = bwmorph(binaryImage,'majority',inf) ;


labeledImage = bwlabel(binaryImage);
measurements = regionprops(labeledImage, 'BoundingBox', 'Area');


% Let's extract the first biggest blob - that will be the hand.
allAreas = [measurements.Area];
[sortedAreas, sortingIndexes] = sort(allAreas, 'descend');
handIndex = sortingIndexes(1); 
% Use ismember() to extact the hand from the labeled image.
handImage = ismember(labeledImage, handIndex);
% Now binarize
handImage = handImage > 0;

handImage = imfill(handImage,'holes');

bounds = measurements(handIndex).BoundingBox;
handImage = imcrop(handImage, bounds);
%grayImage = imcrop(grayImage, bounds);


%{

% extract hand centroid
centroid = regionprops(handImage,grayImage,'WeightedCentroid');
cent(1) = centroid(1).WeightedCentroid(1);
cent(2) = centroid(1).WeightedCentroid(2);

handImageskel = bwmorph(handImage,'shrink',10);
conv = regionprops_edited(handImageskel,'ConvexHull');

c = conv.ConvexHull;
imshow(handImage)
hold on;
plot(cent(1), cent(2), 'r*');
ln = length(c)
for k = 1 : ln
    plot(c(k,1), c(k,2), 'bo');
end
hold off;
figure,imshow(handImageskel)
hold on;
plot(cent(1), cent(2), 'r*');

for k = 1 : ln
    plot(c(k,1), c(k,2), 'bo');
end
end

%}