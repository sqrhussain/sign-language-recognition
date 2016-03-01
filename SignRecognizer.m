function  hsv = SignRecognizer()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    addpath('./circular cut/');
    
    % options.FramesAcquired = 10;
    % options.FrameGrabInterval = 40;
    % 
    % [h , vid] = initVideo( options );
    % start(vid);
    hsv = [];
    for i = 1:10
        snapshot = imread('http://192.168.1.7:8080/shot.jpg');
        hsv =  rgb2hsv(snapshot) ;
         tic
        info = processImage(hsv(:,:,3));
        toc

        plotResults(h , snapshot ,info);
        pause(1);
    end
end




[h , vid] = initVideo( options );