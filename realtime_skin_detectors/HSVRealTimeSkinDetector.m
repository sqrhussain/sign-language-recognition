function [] = HSVRealTimeSkinDetector()

for i = 1:1000

    snapshot = imread('http://192.168.1.6:8080/shot.jpg');
    snapshot = imresize(snapshot,[400 400]);
    bw = skinDetectorHSV(snapshot);
    bw = imclose(bw,strel('disk',5));
     subplot(1,2,1); subimage(snapshot); title('Original Image');
    subplot(1,2,2); subimage(im2double(snapshot).*repmat(bw,[1 1 3]));title('Skin');
    pause(.01);
end

end