function dicomAndTiffCleaner()

%Do VivaCT
f = ftp('10.21.24.203','microct','mousebone4');
cDir = cd(f,'dk0:[MICROCT.DATA]');

%Delete DICOM and TIF in measurement dirs first
dirs = dir(f);
% progressbar()
for i = 1:length(dirs)
%     progressbar(i/length(dirs))
    if dirs(i).isdir == 1
        cd(f,dirs(i).name(1:length(dirs(i).name)-6));
        mDirs = dir(f);
        for j = 1:length(mDirs)
            if mDirs(j).isdir == 1
                clc
                cd(f,mDirs(j).name(1:length(mDirs(j).name)-6))
                filesDCM = dir(f,'*.DCM*');
                filesTIF = dir(f,'*.TIF*');
                for k = 1:length(filesDCM)
                    delete(f,filesDCM(k).name);
                end
                for k = 1:length(filesTIF)
                    delete(f,filesTIF(k).name);
                end
                cd(f,'..');
            end
        end
        cd(f,'..');
    end
end

%delete DICOM and TIF files in scratch directory
cd(f,'disk1:[MICROCT.SCRATCH]');
filesDCM = dir(f,'*.DCM*');
filesTIF = dir(f,'*.TIF*');
for k = 1:length(filesDCM)
    delete(f,filesDCM(k).name);
end
for k = 1:length(filesTIF)
    delete(f,filesTIF(k).name);
end
% 
% % tt=1;
% % while tt == 1
    
    %now do MicroCT
    f = ftp('10.21.24.204','microct','mousebone4');
    cDir = cd(f,'dk0:[MICROCT.DATA]');
    
    %Delete DICOM and TIF in measurement dirs first
    dirs = dir(f);
    for i = 1:length(dirs)
        clc
        i/length(dirs)
        if dirs(i).isdir == 1
            cd(f,dirs(i).name(1:length(dirs(i).name)-6));
            mDirs = dir(f);
            for j = 1:length(mDirs)
                if mDirs(j).isdir == 1
                    clc
                    cd(f,mDirs(j).name(1:length(mDirs(j).name)-6))
                    filesDCM = dir(f,'*.DCM*');
                    filesTIF = dir(f,'*.TIF*');
                    for k = 1:length(filesDCM)
                        delete(f,filesDCM(k).name);
                    end
                    for k = 1:length(filesTIF)
                        delete(f,filesTIF(k).name);
                    end
                    cd(f,'..');
                end
            end
            cd(f,'..');
        end
    end
    
    %delete DICOM and TIF files in scratch directory
    cd(f,'disk1:[MICROCT.SCRATCH]');
    filesDCM = dir(f,'*.DCM*');
    filesTIF = dir(f,'*.TIF*');
    for k = 1:length(filesDCM)
        delete(f,filesDCM(k).name);
    end
    for k = 1:length(filesTIF)
        delete(f,filesTIF(k).name);
    end
    
% end