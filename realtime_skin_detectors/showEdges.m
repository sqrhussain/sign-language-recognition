function [] = showEdges
for i = 1:500
    im = imread('http://192.168.1.6:8080/shot.jpg');
    f = fspecial('average',3);
    im = imfilter(im,f);
    ycbcr = rgb2ycbcr(im);
    gray = rgb2gray(im);
    %gray = .5*ycbcr(:,:,2) + ycbcr(:,:,3)*.5;
    
    e = edge(gray,'canny',[.015,.25]);
    e = imdilate(e,strel('disk',2));
    label = bwlabel(~e);
    subimage(label2rgb(label));
    
    pause(.01);
end
end