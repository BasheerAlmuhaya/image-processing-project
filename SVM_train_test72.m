clear all;
close all;
clc;
load hog_feature_vectors1;

[Train_All, Test_All] = divide_dataset(hog_feature_vectors, 85);
Xtrain=Train_All(1:end,1:72);
Ytrain=Train_All(1:end,73);

testX=Test_All(1:end,1:72);
testClass=Test_All(1:end,73);


SVMModel2 = fitcsvm(Xtrain,Ytrain);

SVMPred2 = predict(SVMModel2,testX);

[SVMcon2, classorder] = confusionmat(testClass,SVMPred2);

SVMconper2 = bsxfun(@rdivide,SVMcon2,sum(SVMcon2,2)) * 100;

SVMAcc2 = (trace(SVMcon2)/sum(SVMcon2(:)));


fprintf('Testing SVM: Percentage Correct Classification : %f%%\n', 100*SVMAcc2);


svm1=SVMModel2;
save('svm1','svm1')



testClass=testClass-ones(numel(testClass),1);
testClass=logical(testClass);
SVMPred2=SVMPred2-ones(numel(SVMPred2),1);
SVMPred2=logical(SVMPred2);
plotconfusion(testClass', SVMPred2');




    