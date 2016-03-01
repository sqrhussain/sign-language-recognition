function plotResults( h ,snapshot, info )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


    image( snapshot ,'Parent',h(1) );    
    image(info.binaryImage.*255,'Parent',h(3));
    image( label2rgb( info.labels ) ,'Parent',h(4));    
    image( rgb2hsv(snapshot) ,'Parent',h(2) ); 
    hold(h(1),'on'); 
    plot(h(1) ,info.fingerTips(:,2)+info.bounds(1) , info.fingerTips(:,1)+info.bounds(2) , 'b*'... 
    ,info.centroid(2)+info.bounds(1) , info.centroid(1)+info.bounds(2) , 'ro' );  
    axes(h(1));
    rectangle('position' , info.bounds , 'EdgeColor','r','LineWidth',2);
    hold(h(1),'off');
    
    title(h(1),'Orignial Snapshot');
    title(h(2),'HSV Colour System Convertion');
    title(h(3),'Binary Cropped Hand');
    title(h(4),'Detected Open Fingers');

end



%{
    annotation(h(1),'rectangle',info.bounds );
%}