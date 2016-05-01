function bounding_box = elect_face(bboxes,rgb)
% selects the box which contains the closest values to known YCbCr means
[n, ~] = size(bboxes);
if n == 1 % don't bother yourself
    bounding_box = bboxes(1,:);
    return;
end
best = 1;
bdis = inf;
ycbcr = rgb2ycbcr(rgb); cb = double(ycbcr(:,:,2)); cr = double(ycbcr(:,:,3));

% hard-coded mean Cb,Cr skin values
dist = sqrt((102-cb).^2 + (153-cr).^2);

for i = 1:n
    d = imcrop(dist,bboxes(i,:));
    md = median(median(d));
    if(md<bdis)
        bdis = md;
        best = i;
    end
end

bounding_box = bboxes(best,:);
end
