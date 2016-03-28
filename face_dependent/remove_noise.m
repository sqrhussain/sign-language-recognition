function res = remove_noise(bw)
bw = imdilate(bw,strel('disk',5));
bw = bwmorph(bw,'majority',5);
bw = imopen(bw,strel('disk',5));
bw = bwfill(bw,'holes');
res = bw;
end