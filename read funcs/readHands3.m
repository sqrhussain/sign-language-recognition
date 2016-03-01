function [ hands ] = readHands3( root , n , suff , width )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

hands = [];
prec = 2;

wid = 100; 
if nargin == 4
    wid = width
end

for i=1:n
im = imread( strcat(root,'/hand (',int2str(i),').',suff)) ;

[m1,m2] = size(im);

im = rgb2gray(im);

im(im<15) = 255;

im = imresize(im , [m1/prec m2/prec]);

blob = HandDetector(im);

hand = imresize(blob , [wid wid]);

%hand = bwmorph(hand , 'close', inf);

hand = imfill(hand,'holes');

hand = reshape(hand , 1 , wid * wid);

hands = [ hands ; hand ];
end
