% First Problem answer
rawdata = xlsread('D:\My work\M.Eng 1st sem\IDA\Assignment\Homework 3\breast-cancer-wisconsin.xlsx');
mydata = knnimpute(rawdata);
NewData = mydata(randperm(699),:);

%Second problem answer
TrainingData = NewData(1:500,:);
TestingData = NewData(501:699,:);

% Third problem answer
Features = TrainingData(:,2:10);
ClassLabels = TrainingData(:,11);
attribute_names={'Clump Thickness','Uniformity of Cell Size','Uniformity of Cell Shape','Marginal Adhesion','Single Epithelial Cell Size','Bare Nuclei','Bland Chromatin','Normal Nucleoli','Mitoses'};
training_decision_tree = fitctree(Features, ClassLabels,'PredictorNames',attribute_names,'MinLeafSize',25);
view(training_decision_tree,'Mode','graph');

% Fourth problem answer
Testing_Features = TestingData(:,2:10);
Testing_OriginalLabels = TestingData(:,11);
predict_labels = predict(training_decision_tree,Testing_Features);
order = [2,4];
[count ,order]= confusionmat(predict_labels,Testing_OriginalLabels,'order',order);
TPCount_25=count(1,1);
FPCount_25=count(1,2);
FNCount_25=count(2,1);
TNCount_25=count(2,2);
accuracy_25 = (TPCount_25+TNCount_25)/(TPCount_25+FPCount_25+FNCount_25+TNCount_25);
precision_25 = TPCount_25/(TPCount_25+FPCount_25);
recall_25 = TPCount_25/(TPCount_25+FNCount_25);
f1_metric = 2*((precision_25*recall_25)/(precision_25+recall_25));
% fprintf('Accuracy for decision tree is %f\nPrecision for decision tree is %f \nRecall for decision tree is %f \nF1 Score for decision tree is %f\n',accuracy_25,precision_25,recall_25,f1_metric);

% Fifth problem answer
SVM_model = fitcsvm(Features, ClassLabels,'Standardize',true,'KernelFunction','RBF','KernelScale','auto');
predicted_labels_SVM = predict(SVM_model,Testing_Features);
order = [2,4];
[SVM_test,order] = confusionmat(predicted_labels_SVM,Testing_OriginalLabels,'order',order);
TPCount_SVM=SVM_test(1,1);
FPCount_SVM=SVM_test(1,2);
FNCount_SVM=SVM_test(2,1);
TNCount_SVM=SVM_test(2,2);
accuracy_SVM = (TPCount_SVM+TNCount_SVM)/(TPCount_SVM+FPCount_SVM+FNCount_SVM+TNCount_SVM);
precision_SVM = TPCount_SVM/(TPCount_SVM+FPCount_SVM);
recall_SVM = TPCount_SVM/(TPCount_SVM+FNCount_SVM);
f1_metric_SVM = 2*((precision_SVM*recall_SVM)/(precision_SVM+recall_SVM));

% Seventh problem answer
cost_FP = 10;
cost_FN = 30;
misclassification_decision_tree = (FPCount_25*cost_FP)+(FNCount_25*cost_FN);
misclassification_SVM = (FPCount_SVM*cost_FP)+(FNCount_SVM*cost_FN);
    
% Eighth problem answer
for iRowCount= 1:199
    if(~(Testing_OriginalLabels(iRowCount) == predict_labels(iRowCount)))
        RowIndex=iRowCount;
        disp('Original Label is')
        disp(Testing_OriginalLabels(iRowCount))
        disp('Misclassified as')
        disp(predict_labels(iRowCount))
        break;
    end
end
disp('Misclassified row index is')
disp(RowIndex)
Training_features = TrainingData(:,2:10);

TestingData_features = TestingData(RowIndex,2:10);
[var3,nvar3]=knnsearch(Training_features,TestingData_features,'k',3,'distance','euclidean');
disp('Three nearest neighbors with their ID numbers are')
disp(TrainingData(var3,[1,11]));
disp('Mode of the class labels is')
disp(mode(TrainingData(var3,11)))
disp('Class label assigned with three nearest neighbors is')
if(mode(TrainingData(var3,11)== 2))
    disp('Benign')
elseif(mode(TrainingData(var3,11)== 4))
    disp('Malignant')
end

[var1,nvar1]=knnsearch(Training_features,TestingData_features,'k',1,'distance','euclidean');
disp('One nearest neighbors with their ID number is')
disp(TrainingData(var1,[1,11]));
disp('Class label assigned with one nearest neighbors is')
if(mode(TrainingData(var1,11)== 2))
    disp('Benign')
elseif(mode(TrainingData(var1,11)== 4))
    disp('Malignant')
end

[var5,nvar5]=knnsearch(Training_features,TestingData_features,'k',5,'distance','euclidean');
disp('Five nearest neighbors with their ID numbers are')
disp(TrainingData(var5,[1,11]));
disp('Mode of the class labels is')
disp(mode(TrainingData(var5,11)))
disp('Class label assigned with five nearest neighbors is')
if(mode(TrainingData(var5,11)== 2))
    disp('Benign')
elseif(mode(TrainingData(var5,11)== 4))
    disp('Malignant')
end

[var7,nvar7]=knnsearch(Training_features,TestingData_features,'k',7,'distance','euclidean');
disp('Seven nearest neighbors with their ID numbers are')
disp(TrainingData(var7,[1,11]));
disp('Mode of the class labels is')
disp(mode(TrainingData(var7,11)))
disp('Class label assigned with Seven nearest neighbors is')
if(mode(TrainingData(var7,11)== 2))
    disp('Benign')
elseif(mode(TrainingData(var7,11)== 4))
    disp('Malignant')
end