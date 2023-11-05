%Chuong trinh nhan dang chu so bang cach su dung mang noron CNN

%Tao duong dan cho file Path
digitDatasetPath = 'C:\Users\Dell\Desktop\Job_Freelance\Matlab\Minh_Process_Image_411\DataSet' % Thay the file Path cua ban vao trong ''
%B2 Doc du lieu anh tu file Path- Khai bao du lieu hinh anh ban dau.
digitimages=imageDatastore(digitDatasetPath,'IncludeSubfolders',true,'labelSource','foldernames');
% Phan chia hinh anh trong file = 75%
%75% Images to train and 25% to test.
numTrainFiles=0.75; 
%Split 2 file with 75 percent.
[TrainImages,TestImages]=splitEachLabel(digitimages,numTrainFiles,'randomize',false);
%-----------------------Building Noron----------------------%
layers=[
imageInputLayer([28 28 1],'Name','Input')
%------------------------Layer1-----------------------------%
convolution2dLayer(3,8,'Padding',[1,1],'Name','Conv_1')
batchNormalizationLayer('Name','BN_1')
reluLayer('Name','Relu_1')
maxPooling2dLayer(2,'Stride',2,'Name','MaxPool_1')
%------------------------Layer2-----------------------------%
convolution2dLayer(3,16,'Padding','same','Name','Conv_2')
batchNormalizationLayer('Name','BN_2');
reluLayer('Name','Relu_2');
maxPooling2dLayer(2,'Stride',2,'Name','MaxPool_2');
%------------------------Layer3-----------------------------%
convolution2dLayer(3,32,'Padding','same','Name','Conv_3');
batchNormalizationLayer('Name','BN_3');
reluLayer('Name','Relu_3');
maxPooling2dLayer(2,'Stride',2,'Name','MaxPool_3');
%------------------------Layer4-----------------------------%
convolution2dLayer(3,64,'Padding','same','Name','Conv_4');
batchNormalizationLayer('Name','BN_4');
reluLayer('Name','Relu_4');
maxPooling2dLayer(2,'Stride',2,'Name','MaxPool_4');
%------------------------Layer5-----------------------------%
convolution2dLayer(3,128,'Padding','same','Name','Conv_5');
batchNormalizationLayer('Name','BN_5');
reluLayer('Name','Relu_5');

fullyConnectedLayer(10,'Name','FC');
softmaxLayer('Name','SoftMax');
classificationLayer('Name','Output Classification');
];
%-----------------Plotting Network Structure------------------%
lgraph = layerGraph(layers);
%----------------Training Options-----------------------------%
options=trainingOptions('sgdm','InitialLearnRate',0.01,'Maxepochs',4,'Shuffle','every-epoch','ValidationData',TestImages,'ValidationFrequency',30,'Verbose',false,'Plots','training-progress');
%----------------Network Training-----------------------------%
net = trainNetwork(TrainImages,layers,options);

Ypred = classify(net,TestImages); %Recognizing digits
YValidation = TestImages.Labels; %Getting Labels
accuracy = sum(Ypred == YValidation)/numel(YValidation); %Finding %age accuracy
plot(lgraph);