PrevPathName=PathName;
PathName=uigetdir(PrevPathName,'Select Folder to Save Data');
if PathName==0
    PathName=PrevPathName;
end