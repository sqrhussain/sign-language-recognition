function res = skinDetectorHSV(rgb)
hsv = rgb2hsv(rgb);
res = double(hsv(:,:,3)>40/255 & (hsv(:,:,1)<=90/360 | hsv(:,:,1)>=288/360) & (1-hsv(:,:,2)>=.1 & 1-hsv(:,:,2)<=.68));
end