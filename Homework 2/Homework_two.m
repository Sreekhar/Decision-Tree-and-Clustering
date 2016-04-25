% First Problem answer
data = xlsread('D:\My work\M.Eng 1st sem\IDA\Assignment\Homework 2\magic04.xlsx');
NewData = data(randperm(19020),:);
TrainingData = NewData(1:13020,:);
ValidationData = NewData(13021:16020,:);
TestData = NewData(16021:end,:);

%Second problem answer
Features = TrainingData(:,1:10);
ClassLabels = TrainingData(:,11);

% Third problem answer
% dtr_1200=fitctree(Features, ClassLabels, 'MinLeafSize', 1200);
% view(dtr_1200,'Mode','graph');
% 
% % Fourth problem answer
% TestFeatures_1200 = ValidationData(:,1:10);
% PredictLabels_1200 = predict(dtr_1200,TestFeatures_1200);
% OriginalLabels_1200 = ValidationData(:,11);
% TPCount_1200=0;
% FPCount_1200=0;
% FNCount_1200=0;
% TNCount_1200=0;
% 
% for i=1:3000
%     if(PredictLabels_1200(i) == 1 && OriginalLabels_1200(i) == 1)
%         TPCount_1200 = TPCount_1200+1;
%     elseif(PredictLabels_1200(i) == 1 && OriginalLabels_1200(i) == 0)
%         FPCount_1200=FPCount_1200+1;
%     elseif(PredictLabels_1200(i) == 0 && OriginalLabels_1200(i) == 1)
%         FNCount_1200=FNCount_1200+1;
%     elseif(PredictLabels_1200(i) == 0 && OriginalLabels_1200(i) == 0)
%         TNCount_1200=TNCount_1200+1;
%     end
% end
% 
% Accuracy_1200 = (TPCount_1200+TNCount_1200)/(TPCount_1200+TNCount_1200+FNCount_1200+FPCount_1200);
% Recall_1200 = TPCount_1200/(TPCount_1200+FNCount_1200);
% Precision_1200 = TPCount_1200/(TPCount_1200+FPCount_1200);

% Fifth problem 'a' bit answer
% dtr_1000=fitctree(Features, ClassLabels, 'MinLeafSize', 1000);
% view(dtr_1000,'Mode','graph');
% 
% % Fifth problem 'b' bit answer
% TestFeatures_Test_1000 = TestData(:,1:10);
% PredictLabels_Test_1000 = predict(dtr_1000,TestFeatures_Test_1000);
% OriginalLabels_Test_1000 = TestData(:,11);
% TPCount_Test_1000=0;
% FPCount_Test_1000=0;
% FNCount_Test_1000=0;
% TNCount_Test_1000=0;
% 
% for i=1:3000
%     if(PredictLabels_Test_1000(i) == 1 && OriginalLabels_Test_1000(i) == 1)
%         TPCount_Test_1000 = TPCount_Test_1000+1;
%     elseif(PredictLabels_Test_1000(i) == 1 && OriginalLabels_Test_1000(i) == 0)
%         FPCount_Test_1000=FPCount_Test_1000+1;
%     elseif(PredictLabels_Test_1000(i) == 0 && OriginalLabels_Test_1000(i) == 1)
%         FNCount_Test_1000=FNCount_Test_1000+1;
%     elseif(PredictLabels_Test_1000(i) == 0 && OriginalLabels_Test_1000(i) == 0)
%         TNCount_Test_1000=TNCount_Test_1000+1;
%     end
% end
% 
% Accuracy_Test_1000 = (TPCount_Test_1000+TNCount_Test_1000)/(TPCount_Test_1000+TNCount_Test_1000+FNCount_Test_1000+FPCount_Test_1000);
% Recall_Test_1000 = TPCount_Test_1000/(TPCount_Test_1000+FNCount_Test_1000);
% Precision_Test_1000 = TPCount_Test_1000/(TPCount_Test_1000+FPCount_Test_1000);
% 
% % Fifth problem 'c' bit answer
% TestFeatures_Val_1000 = ValidationData(:,1:10);
% PredictLabels_Val_1000 = predict(dtr_1000,TestFeatures_Val_1000);
% OriginalLabels_Val_1000 = ValidationData(:,11);
% TPCount_Val_1000=0;
% FPCount_Val_1000=0;
% FNCount_Val_1000=0;
% TNCount_Val_1000=0;
% 
% for i=1:3000
%     if(PredictLabels_Val_1000(i) == 1 && OriginalLabels_Val_1000(i) == 1)
%         TPCount_Val_1000 = TPCount_Val_1000+1;
%     elseif(PredictLabels_Val_1000(i) == 1 && OriginalLabels_Val_1000(i) == 0)
%         FPCount_Val_1000=FPCount_Val_1000+1;
%     elseif(PredictLabels_Val_1000(i) == 0 && OriginalLabels_Val_1000(i) == 1)
%         FNCount_Val_1000=FNCount_Val_1000+1;
%     elseif(PredictLabels_Val_1000(i) == 0 && OriginalLabels_Val_1000(i) == 0)
%         TNCount_Val_1000=TNCount_Val_1000+1;
%     end
% end
% 
% Accuracy_Val_1000 = (TPCount_Val_1000+TNCount_Val_1000)/(TPCount_Val_1000+TNCount_Val_1000+FNCount_Val_1000+FPCount_Val_1000);
% Recall_Val_1000 = TPCount_Val_1000/(TPCount_Val_1000+FNCount_Val_1000);
% Precision_Val_1000 = TPCount_Val_1000/(TPCount_Val_1000+FPCount_Val_1000);

% Sixth problem 'a' bit answer
% dtr_20=fitctree(Features, ClassLabels, 'MinLeafSize', 20);
% view(dtr_20,'Mode','graph');
% 
% % Sixth problem 'b' bit answer
% TestFeatures_Test_20 = TestData(:,1:10);
% PredictLabels_Test_20 = predict(dtr_20,TestFeatures_Test_20);
% OriginalLabels_Test_20 = TestData(:,11);
% TPCount_Test_20=0;
% FPCount_Test_20=0;
% FNCount_Test_20=0;
% TNCount_Test_20=0;
% 
% for i=1:3000
%     if(PredictLabels_Test_20(i) == 1 && OriginalLabels_Test_20(i) == 1)
%         TPCount_Test_20 = TPCount_Test_20+1;
%     elseif(PredictLabels_Test_20(i) == 1 && OriginalLabels_Test_20(i) == 0)
%         FPCount_Test_20=FPCount_Test_20+1;
%     elseif(PredictLabels_Test_20(i) == 0 && OriginalLabels_Test_20(i) == 1)
%         FNCount_Test_20=FNCount_Test_20+1;
%     elseif(PredictLabels_Test_20(i) == 0 && OriginalLabels_Test_20(i) == 0)
%         TNCount_Test_20=TNCount_Test_20+1;
%     end
% end
% 
% Accuracy_Test_20 = (TPCount_Test_20+TNCount_Test_20)/(TPCount_Test_20+TNCount_Test_20+FNCount_Test_20+FPCount_Test_20);
% Recall_Test_20 = TPCount_Test_20/(TPCount_Test_20+FNCount_Test_20);
% Precision_Test_20 = TPCount_Test_20/(TPCount_Test_20+FPCount_Test_20);
% 
% % Fifth problem 'c' bit answer
% TestFeatures_Val_20 = ValidationData(:,1:10);
% PredictLabels_Val_20 = predict(dtr_20,TestFeatures_Val_20);
% OriginalLabels_Val_20 = ValidationData(:,11);
% TPCount_Val_20=0;
% FPCount_Val_20=0;
% FNCount_Val_20=0;
% TNCount_Val_20=0;
% 
% for i=1:3000
%     if(PredictLabels_Val_20(i) == 1 && OriginalLabels_Val_20(i) == 1)
%         TPCount_Val_20 = TPCount_Val_20+1;
%     elseif(PredictLabels_Val_20(i) == 1 && OriginalLabels_Val_20(i) == 0)
%         FPCount_Val_20=FPCount_Val_20+1;
%     elseif(PredictLabels_Val_20(i) == 0 && OriginalLabels_Val_20(i) == 1)
%         FNCount_Val_20=FNCount_Val_20+1;
%     elseif(PredictLabels_Val_20(i) == 0 && OriginalLabels_Val_20(i) == 0)
%         TNCount_Val_20=TNCount_Val_20+1;
%     end
% end
% 
% Accuracy_Val_20 = (TPCount_Val_20+TNCount_Val_20)/(TPCount_Val_20+TNCount_Val_20+FNCount_Val_20+FPCount_Val_20);
% Recall_Val_20 = TPCount_Val_20/(TPCount_Val_20+FNCount_Val_20);
% Precision_Val_20 = TPCount_Val_20/(TPCount_Val_20+FPCount_Val_20);

N = [1000,750,500,250,125,100,50,20,10,5];
dtr_20=fitctree(Features, ClassLabels, 'MinLeafSize', 20);
view(dtr_20,'Mode','graph');

% Sixth problem 'b' bit answer
TestFeatures_Test_20 = TestData(:,1:10);
PredictLabels_Test_20 = predict(dtr_20,TestFeatures_Test_20);
OriginalLabels_Test_20 = TestData(:,11);
TPCount_Test_20=0;
FPCount_Test_20=0;
FNCount_Test_20=0;
TNCount_Test_20=0;

for i=1:3000
    if(PredictLabels_Test_20(i) == 1 && OriginalLabels_Test_20(i) == 1)
        TPCount_Test_20 = TPCount_Test_20+1;
    elseif(PredictLabels_Test_20(i) == 1 && OriginalLabels_Test_20(i) == 0)
        FPCount_Test_20=FPCount_Test_20+1;
    elseif(PredictLabels_Test_20(i) == 0 && OriginalLabels_Test_20(i) == 1)
        FNCount_Test_20=FNCount_Test_20+1;
    elseif(PredictLabels_Test_20(i) == 0 && OriginalLabels_Test_20(i) == 0)
        TNCount_Test_20=TNCount_Test_20+1;
    end
end

Accuracy_Test_20 = (TPCount_Test_20+TNCount_Test_20)/(TPCount_Test_20+TNCount_Test_20+FNCount_Test_20+FPCount_Test_20);
Recall_Test_20 = TPCount_Test_20/(TPCount_Test_20+FNCount_Test_20);
Precision_Test_20 = TPCount_Test_20/(TPCount_Test_20+FPCount_Test_20);

% Fifth problem 'c' bit answer
TestFeatures_Val_20 = ValidationData(:,1:10);
PredictLabels_Val_20 = predict(dtr_20,TestFeatures_Val_20);
OriginalLabels_Val_20 = ValidationData(:,11);
TPCount_Val_20=0;
FPCount_Val_20=0;
FNCount_Val_20=0;
TNCount_Val_20=0;

for i=1:3000
    if(PredictLabels_Val_20(i) == 1 && OriginalLabels_Val_20(i) == 1)
        TPCount_Val_20 = TPCount_Val_20+1;
    elseif(PredictLabels_Val_20(i) == 1 && OriginalLabels_Val_20(i) == 0)
        FPCount_Val_20=FPCount_Val_20+1;
    elseif(PredictLabels_Val_20(i) == 0 && OriginalLabels_Val_20(i) == 1)
        FNCount_Val_20=FNCount_Val_20+1;
    elseif(PredictLabels_Val_20(i) == 0 && OriginalLabels_Val_20(i) == 0)
        TNCount_Val_20=TNCount_Val_20+1;
    end
end

Accuracy_Val_20 = (TPCount_Val_20+TNCount_Val_20)/(TPCount_Val_20+TNCount_Val_20+FNCount_Val_20+FPCount_Val_20);
Recall_Val_20 = TPCount_Val_20/(TPCount_Val_20+FNCount_Val_20);
Precision_Val_20 = TPCount_Val_20/(TPCount_Val_20+FPCount_Val_20);