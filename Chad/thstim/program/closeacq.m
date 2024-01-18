cd(OriginalCD)

if exist('previewwin','var')
    close(previewwin)
    delete(vid)
end
if exist('AC','var')
    delete(AC)
end

clearvars