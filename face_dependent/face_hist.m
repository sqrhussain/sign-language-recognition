function [face_region,cb_hist,cr_hist] = face_hist(face_region)
%% Returns the histogram (Cb,Cr) of the face
ycbcr = rgb2ycbcr(face_region);
cb = ycbcr(:,:,2);
cr = ycbcr(:,:,3);
cb_hist = imhist(cb);
cr_hist = imhist(cr);

end
