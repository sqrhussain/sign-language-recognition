function bw = face_dependent_skin(rgb,face_detector,ratio)
%% Returns the possible skin regions based on the face color
% Use it if you want to carry on the whole process (find the
% face and then find the skin)
% if confused about how to get a face_detector:
%     face_detector = vision.CascadeObjectDetector;

% get face region
[face_region,~] = get_me_a_face(rgb,face_detector,ratio);

% get skin regions
bw = extract_skin(rgb,face_region);

end
