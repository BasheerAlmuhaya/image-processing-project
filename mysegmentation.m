function [outputArg1] = mysegmentation(inputArg1)

I = inputArg1;
%I = rgb2gray(I);
mask = zeros(size(I));
mask(25:end-25,25:end-25) = 1;
bw = activecontour(I,mask,300);
% bwc = imcomplement(bw);
% bwc = 255.*bwc;
se = strel('disk',5);
bw=imopen(bw,se);
Iadd = immultiply(I,bw);
% Iadd2 = imadd(double(I),bwc);
% Iadd2 = imsubtract(Iadd2,bwc);
%montage({I,mask,bw,Iadd});

outputArg1 = Iadd;
end

