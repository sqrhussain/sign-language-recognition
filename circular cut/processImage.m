function [ info ] = processImage( snapshot )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


[ bw , bnds ] = HandDetector( snapshot );
[ lbs , n , cent ] = isolateFingers( bw );
pnts = fingertips( lbs , n , cent );

info.binaryImage = bw;
info.bounds = bnds;
info.labels = lbs;
info.numOfLabels = n ;
info.centroid = cent;
info.fingerTips = pnts;

end

