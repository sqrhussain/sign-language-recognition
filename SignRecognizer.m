function  hsv = SignRecognizer()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

options.FramesAcquired = 10;
options.FrameGrabInterval = 40;

[h , vid] = initVideo( options );
start(vid);
hsv = [];
while(vid.FramesAcquired <= options.FramesAcquired )
    
    snapshot =  getdata(vid,1) ;
    flushdata(vid);

    hsv =  rgb2hsv(snapshot) ;
       
    tic
    info = processImage( hsv(:,:,3) );
    toc
    
    plotResults(h , snapshot ,info);

end
stop(vid);
%stop(imaqfind)
end


