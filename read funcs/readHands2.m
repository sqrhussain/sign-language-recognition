function [ hands,regions ] = readHands2( root , n , suff )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

hands = [];

for i=1:n
    im = imread( strcat(root,'/hand (',int2str(i),').',suff)) ;

    im = imresize(im , [200 200]);

    region = skinDetector( im );

    hands = [ hands ; region ];
end

regions = hands;
hands = reshape(hands  , n , 40000);

end

