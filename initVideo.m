function [ h , vid ] = initVideo( options )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

addpath('circular cut');
addpath('neural funcs');
vid = videoinput('winvideo',1,'MJPG_1280x1024');
set(vid,'TriggerRepeat',Inf);
vid.FrameGrabInterval = options.FrameGrabInterval;
set(vid,'ReturnedColorSpace','rgb');
set(vid,'FramesPerTrigger', 1000);
%set(gcf, 'Units', 'Normalized', 'Position',[0.8 0.8 1 1]);
%live = subplot(1,1,1);title(live,'Online video Steaming');figure;

set(gcf, 'Units', 'Normalized', 'Position',[0 0 1 1]);
h = [];
h(1) = subplot(2,2,1);
h(2) = subplot(2,2,2);
h(3) = subplot(2,2,3);
h(4) = subplot(2,2,4);
               
%vidRes = vid.VideoResolution;  
%hImage = image( zeros(vidRes(2), vidRes(1), vid.NumberOfBands),'Parent' , live); 
%preview(vid,hImage)
pause(3);

end







%{
    'MJPG_1280x1024'    'MJPG_1280x720'    'MJPG_1280x800'    'MJPG_160x120'    'MJPG_176x144'    'MJPG_320x240'
    'MJPG_640x480'    'YUY2_1280x1024'    'YUY2_1280x720'    'YUY2_1280x800'    'YUY2_160x120'    'YUY2_176x144'
    'YUY2_320x240'    'YUY2_640x480'
%}
