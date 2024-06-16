clear all;
close all;
clc;
feature_vectors=0;
num_feature_vectors=0;
all_Image = dir('C:\Users\user\Desktop\Homework\imageProcessing\dataset\*.jpg');
 m = numel(all_Image);
for i=1:m
    fileName = ['C:\Users\user\Desktop\Homework\imageProcessing\dataset\',all_Image(i).name];
    imageName = all_Image(i).name;
    disp([' Processing Image ',fileName]);
    img = imread(fileName);
    I = rgb2gray(img);
    I=imresize(I,[256,256]);
    I = myenhancement(I);
%    I = mysegmentation(I);
    
    [featureVector,hogVisualization] = extractHOGFeatures(I,'CellSize',[80 64]);
    [feature_vector,numfeature]=feature_extraction72(num_feature_vectors,I,feature_vectors,i,featureVector);
    feature_vectors=feature_vector;
    num_feature_vectors=numfeature;
end
hog_feature_vectors=feature_vector;
save('hog_feature_vectors1','hog_feature_vectors');

disp('done');
