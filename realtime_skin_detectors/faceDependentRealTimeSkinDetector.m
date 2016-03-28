function [] = faceDependentRealTimeSkinDetector()
addpath('../face_dependent/');
face_detector =  vision.CascadeObjectDetector;

for i = 1:1000

    snapshot = imread('http://192.168.1.6:8080/shot.jpg');
    snapshot = imresize(snapshot,[400 400]);
    if mod(i-1,20) == 0
       [face_region,~] = get_me_a_face(snapshot,face_detector); 
    end
    tic
    bw = extract_skin(snapshot,face_region);
    toc
    bw = imclose(bw,strel('disk',5));
     subplot(1,3,1); subimage(snapshot); title('Original Image');
    subplot(1,3,2); subimage(im2double(snapshot).*repmat(bw,[1 1 3]));title('Skin');
    subplot(1,3,3); subimage(face_region);
    pause(.01);
end

end