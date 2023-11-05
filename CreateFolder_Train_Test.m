outputFolderTrain = 'C:\Users\Dell\Desktop\Job_Freelance\Matlab\Minh_Process_Image_411\Train';
resetFolder(outputFolderTrain);
for i = 1:numel(TrainImages.Files)
    [~, filename, ext] = fileparts(TrainImages.Files{i});
    destination = fullfile(outputFolderTrain, [filename, ext]);
    copyfile(TrainImages.Files{i}, destination);
end
outputFolderTest = 'C:\Users\Dell\Desktop\Job_Freelance\Matlab\Minh_Process_Image_411\Test';
resetFolder(outputFolderTest);
for i = 1:numel(TestImages.Files)
    [~, filename, ext] = fileparts(TestImages.Files{i});
    destination = fullfile(outputFolderTest, [filename, ext]);
    copyfile(TestImages.Files{i}, destination);
end