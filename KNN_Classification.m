clear all;
close all;
clc;

load hog_feature_vectors1;


% divide dataset into 70% train and 30% test
[Train_All, Test_All] = divide_dataset(hog_feature_vectors, 85);
% Training
% L1 Distance
L1_KNN_All = fitcknn(Train_All(:,1:72), Train_All(:,73),'Distance','minkowski','Exponent',1);

% L2 Distance
L2_KNN_All = fitcknn(Train_All(:,1:72), Train_All(:,73),'Distance','euclidean');

% Cosine Distance
Cosine_KNN_All = fitcknn(Train_All(:,1:72), Train_All(:,73),'Distance','cosine');
% Testing
Test_L1_KNN_All = predict(L1_KNN_All,Test_All(:,1:72));
Test_L2_KNN_All = predict(L2_KNN_All,Test_All(:,1:72));
Test_Cosine_KNN_All = predict(Cosine_KNN_All,Test_All(:,1:72));

L1_Accuracy_All = mean(Test_L1_KNN_All == Test_All(:,73))*100;
L2_Accuracy_All = mean(Test_L2_KNN_All == Test_All(:,73))*100;
Cosine_Accuracy_All = mean(Test_Cosine_KNN_All == Test_All(:,73))*100;

disp(['L1 Distance Accuracy All= ', num2str(L1_Accuracy_All), ' %']);
disp(['L2 Distance Accuracy All= ', num2str(L2_Accuracy_All), ' %']);
disp(['Cosine Distance Accuracy All= ', num2str(Cosine_Accuracy_All), ' %']);

target = ind2vec(Test_All(:,73)');
output = ind2vec(Test_Cosine_KNN_All');
plotconfusion(target, output);

save('L1_KNN_All','L1_KNN_All');
save('L2_KNN_All','L2_KNN_All');
save('Cosine_KNN_All','Cosine_KNN_All');


