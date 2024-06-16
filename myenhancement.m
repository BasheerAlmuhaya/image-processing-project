function [outputArg1] = myenhancement(inputArg1)

I = inputArg1;
se = strel('disk',128);
background = imopen(I,se);
I2 = I - background;
I3 = imadjust(I2);

outputArg1 = I3;
end

