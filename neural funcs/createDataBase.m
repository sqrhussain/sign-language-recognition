function createDataBase(seedPath , savePath)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

files=dir([seedPath, '*.jpg']);

ln = length(files);
%bias = (ln*360);
for k=1:ln
    im = imread(strcat(seedPath,files(k).name));
    for i=1:360        
        rotated = imrotate(im,i);
        imwrite(rotated,strcat(savePath ,'/hand (',int2str((k-1)*360 + i),').jpg'),'jpg');
        %{
        Vflipped = flipud(rotated);
        imwrite(Vflipped,strcat(savePath ,'/hand (',int2str(bias+(k-1)*360 + i),').jpg'),'jpg');
        Hflipped = fliplr(rotated);
        imwrite(Hflipped,strcat(savePath ,'/hand (',int2str(bias*2+(k-1)*360 + i),').jpg'),'jpg');
        HVflipped = fliplr(Vflipped);
        imwrite(HVflipped,strcat(savePath ,'/hand (',int2str(bias*3+(k-1)*360 + i),').jpg'),'jpg');
        %}
    end
end
end

