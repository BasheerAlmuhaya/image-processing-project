%svmquadratic
clear all;
close all;
clc;
load hog_feature_vectors1;

[Train_All, Test_All] = divide_dataset(hog_feature_vectors, 85);
Xtrain=Train_All(1:end,1:72);
Ytrain=Train_All(1:end,73);

testX=Test_All(1:end,1:72);
testClass=Test_All(1:end,73);

% Train a classifier
% This code specifies all the classifier options and trains the classifier.
classificationSVM = fitcsvm(...
    Xtrain, ...
    Ytrain, ...
    'KernelFunction', 'polynomial', ...
    'PolynomialOrder', 2, ...
    'KernelScale', 'auto', ...
    'BoxConstraint', 1, ...
    'Standardize', true, ...
    'ClassNames', [1; 2]);

SVMPred = predict(classificationSVM,testX);

[SVMcon, classorder] = confusionmat(testClass,SVMPred);

SVMconper2 = bsxfun(@rdivide,SVMcon,sum(SVMcon,2)) * 100;

SVMAcc = (trace(SVMcon)/sum(SVMcon(:)));


fprintf('Testing SVM: Percentage Correct Classification : %f%%\n', 100*SVMAcc);


svm4=classificationSVM;
save('svm4','svm4')



testClass=testClass-ones(numel(testClass),1);
testClass=logical(testClass);
SVMPred=SVMPred-ones(numel(SVMPred),1);
SVMPred=logical(SVMPred);
plotconfusion(testClass', SVMPred');
