function [ X ] = readHands4( root , n , suff )
X = [];
for i=1:n
im = imread( strcat(root,'/hand (',int2str(i),').',suff)) ;
[a b]= HandDetector(rgb2gray(im));
[bw,n,c]= isolateFingers(a);
pnts=fingertips(bw,n,c);
x = handFeatures(c,pnts);
X = [X ; x(1:10)];
end

