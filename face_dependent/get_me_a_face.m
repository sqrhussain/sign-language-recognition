function [face_region, orig_facebox] = get_me_a_face(rgb,face_detector,ratio)
%% Obvoius
% if confused about how to get a face_detector:
%     face_detector = vision.CascadeObjectDetector;
if nargin < 3
    ratio = 1;
end
filter = fspecial('gaussian',5);
rgb = imfilter(rgb,filter);
    bboxes = detect_faces(rgb,face_detector,ratio);
    if size(bboxes,1)*size(bboxes,2) == 0
        error('No face found');
    end
    orig_facebox = elect_face(bboxes);
    facebox = orig_facebox;
    facebox = shrink_face_box(facebox);
    
    % get face image
    face_region = imcrop(rgb,facebox);
    
end
