function UpdateDependencies()

userProfile = getenv('USERPROFILE');

cd(fullfile(userProfile,[\documents\matlab']);

repos = {'https://github.com/WashUMRC/ImagingLogging',...
    'https://github.com/WashUMRC/ThreePointBendingAnalisys',...
    'https://github.com/WashUMRC/DiskTowerBackup',...
    'https://github.com/WashUMRC/CTDataRetrieval',...
    'https://github.com/WashUMRC/DICOMManagement',...
    'https://github.com/WashUMRC/CalibrationVerification',...
    'https://github.com/WashUMRC/StrainGageProcessing',...
    'https://github.com/WashUMRC/GeneralFileManagement',...
    'https://github.com/WashUMRC/ContouringGUI'};

a = exist('C:\Program Files\Git\bin\git.exe');
if a ~= 2
  oFN = websave('git.exe','https://github.com/git-for-windows/git/releases/download/v2.18.0.windows.1/Git-2.18.0-64-bit.exe');
  system(oFN);
  system(['del ' oFN]);
end

for i = 1:length(repos)
    slashes = strfind(repos{i},'/');
    pathstr = repos{i}(slashes(end)+1:end);
    fullPathstr = fullfile(pwd,pathstr);
    sysLine = ['git clone ' repos{i} ' ' fullPathstr];
    sysOut = system(sysLine);
    if sysOut ~= 0
        sysLine = ['git pull ' repos{i} ' ' fullPathstr];
        sysOut = system(sysLine);
    end
end

addpath(genpath(pwd));
