function bw = extract_skin(rgb, face_rgb)
%% Returns skin regions in 'rgb' based on 'face_rgb' which contains the face cropped
% use it if you have the face in 'face_rgb'
    rgb = im2double(rgb);
% extract face information (mean and std)
    face_ycbcr = im2double(rgb2ycbcr(face_rgb));
    face_cb = face_ycbcr(:,:,2);
    face_cr = face_ycbcr(:,:,3);
    meancb = mean2(face_cb);
    meancr = mean2(face_cr);
% standard deviation as a threshold
    stdcbcr = mean2(sqrt((face_cb-meancb).^2+(face_cr-meancr).^2));

% get Cb, Cr of the image
    ycbcr = im2double(rgb2ycbcr(rgb));
    cb = ycbcr(:,:,2);
    cr = ycbcr(:,:,3);

% distance from face mean
    skin_mean_distance = sqrt((cb-meancb).^2+(cr-meancr).^2);
    bw = ~im2bw(skin_mean_distance,stdcbcr);

    bw = remove_noise(bw);
 end
