function face_bbox = shrink_face_box(face_bbox)
% shrink box
face_bbox(1) = face_bbox(1) + face_bbox(3)/4;
face_bbox(2) = face_bbox(2) + face_bbox(4)/4;
face_bbox(3) = face_bbox(3) / 2;
face_bbox(4) = face_bbox(4) / 2;
end