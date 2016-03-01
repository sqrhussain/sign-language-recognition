function [hands edges] = readHands(root , n , suff)

hands = [];

for i=1:n
im = imread( strcat(root,'/hand (',int2str(i),').',suff)) ;

im = imresize(im , [100 100]);

im = rgb2gray(im);

e = edge(im , 'canny' , 0.5);

hands = [ hands ; e ];
end

edges = hands;
hands = reshape(hands  , n , 10000);


