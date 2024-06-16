function [train, test] = divide_dataset(feature_vectors, t)
train=[];
test=[];

classes =  unique(feature_vectors(:,end));
num_classes = length(classes); % number of classes

for i=1:num_classes
   data = feature_vectors(feature_vectors(:,end) == classes(i),:);
   N = size(data,1);
   N = round(N*t/100);
   train1 = data(1:N,:);
   test1 = data(N+1:end,:);
%     [train1, test1] = divideset(feature_vectors(feature_vectors(:,end) == classes(i),:), t);
    train=[train; train1];
    test=[test; test1];
end
