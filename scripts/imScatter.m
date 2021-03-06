function mapMat = imScatter(imSet,imCoords)

% function imScatter(imSet,imCoords)
%
% show images scatter-plotted accordng to coordinates
%
% imSet    - image data cell with numIms elements)
% imCoords - coordinate matrix of numIms x numDims
%
% note each image is square with width=height=sqrt(numPix)
% each image has pixel values between 0 and 1

% obtaining imCoords with:
% imcoords=mdscale(squareform(RDM),2);
map_size = 1000; img_size = 30;
n_imgs = size(imCoords,1);
imCoords = imCoords - repmat(min(imCoords),[n_imgs 1]);
imCoords = imCoords ./ repmat(max(imCoords),[n_imgs 1]);

imCoords = (map_size*imCoords)/(map_size+(img_size+1));

 mapMat=128*ones(map_size, map_size,3,'uint8');

 for k=1:size(imCoords,1),
   tempIm=imresize(squeeze(imSet{k}),[img_size img_size]);
   if (size(tempIm,3)~=3), tempIm=repmat(tempIm,[1 1 3]); end;
   mapMat(round((imCoords(k,1))*1000+1)+[0:29], ...
          round((imCoords(k,2))*1000+1)+[0:29],:)=tempIm;
 end;
