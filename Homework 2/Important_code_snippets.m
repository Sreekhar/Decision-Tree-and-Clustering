% For precision, recall and accuracy
group = OriginalLabels;
grouphat = PredictLabels;
order = [1,0];
[c,order] = confusionmat(grouphat,group,'order',order);
count=0;
for i=1:3000
    if(grouphat(i) == 1 && group(i) == 0)
    count = count+1;
    end
end
e=c(1,1);
f=c(1,2);
g=c(2,1);
h=c(2,2);
accuracy = (e+f)/(e+f+g+h);
precision = e/(e+f);
recall = e/(e+g);

% Normal for loop with if condition
for i=1:13020
    if(Predicted_labels1000(i) == 1 && ClassLabels(i) == 1)
    tp_count = tp_count+1;
%     d.True_Positive_Count = tp_count; 
    elseif(Predicted_labels1000(i) == 1 && ClassLabels(i) == 0)
    fp_count=fp_count+1;
%     d.False_Positive_Count = fp_Count;
    elseif(Predicted_labels1000(i) == 0 && ClassLabels(i) == 1)
        fn_count=fn_count+1;
%         d.False_Negative_Count = fn_Count;
    elseif(Predicted_labels1000(i) == 0 && ClassLabels(i) == 0)
        tn_count=tn_count+1;
%         d.True_Negative_Count = tn_Count;
    
    end
end

% TP, TN, FN and FP
http://www.kdnuggets.com/faq/precision-recall.html