
% Indian video https://www.youtube.com/watch?v=z8xiSeyNezA
function bounding_boxes = detect_faces(orig_im,face_detector,resize_ratio)
%% Returns a vector of bounding boxes for potential faces in the image 'orig_im'
% 'ratio' is the scale at which we wish to downsample the image while
% finding the face
% face_detector = vision.CascadeObjectDetector;
orig_im = imresize(orig_im,resize_ratio);
bounding_boxes = uint16(step(face_detector,orig_im)/resize_ratio);

% b = insertObjectAnnotation(orig_im, 'rectangle', bounding_boxes*resize_ratio, 'Face');
% figure, imshow(b); title('Possible Faces');