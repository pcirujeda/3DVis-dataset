function TRdata = moveData(data, R, T)
    
    % moveData - applies a rotation and translation to a given data
    % structure
    %
    % Author   : Pol Cirujeda

    % Copyright notice: You are free to modify, extend and distribute 
    %    this code granted that the author of the original code is 
    %    mentioned as the original author of the code.

    dataXYZ  = [data.feats.X,  data.feats.Y,  data.feats.Z];
    dataNxyz = [data.feats.nx, data.feats.ny, data.feats.nz];
    
    RdataXYZ  = dataXYZ * R';
    RdataNxyz = dataNxyz * R';
    
    TRdataXYZ = RdataXYZ + repmat(T', [size(RdataXYZ,1),1]);
    
    TRdata = data;
    
    TRdata.feats.X = TRdataXYZ(:,1);
    TRdata.feats.Y = TRdataXYZ(:,2);
    TRdata.feats.Z = TRdataXYZ(:,3);
    
    TRdata.feats.nx = RdataNxyz(:,1);
    TRdata.feats.ny = RdataNxyz(:,2);
    TRdata.feats.nz = RdataNxyz(:,3);

end