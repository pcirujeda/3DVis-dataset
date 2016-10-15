function data = loadOBJ( fileName, expandColorRange )
    
    % loadOBJ - loads an obj file
    %
    %    fileName - OBJ file
    %    expandColorRange:
    %       if 1 (by default), color values are normalized to [0-255] range
    %
    % Returns:
    %    data - object data structure
    %
    % Author   : Pol Cirujeda
    % Thanks   : Yashin Dicente Cid, Xavier Mateo

    % Copyright notice: You are free to modify, extend and distribute 
    %    this code granted that the author of the original code is 
    %    mentioned as the original author of the code.
 
    if ~exist('expandColorRange','var')
        expandColorRange = 1;
    end
    
    % Get 3D data    
    nx =[]; ny =[]; nz =[];
    X  =[]; Y  =[]; Z  =[];
    R  =[]; G  =[]; B  =[];
    
    fid = fopen(fileName,'r');
    
    s = textscan(fid,'%s','Delimiter','\n');
    s = s{1};
    
    for i=1:size(s,1)
        tline = s{i};
    
        if length(tline)<2    % white space or comment
            continue;            
        elseif strcmp(tline(1:2), 'vn') == 1    % normal vector
            temp = textscan (tline, '%s %f %f %f');
            nx = [nx; temp{2}];
            ny = [ny; temp{3}];
            nz = [nz; temp{4}];
        elseif strcmp(tline(1:2), 'v ') == 1    % vertex
            temp = textscan (tline, '%s %f %f %f %f %f %f'); 
            X = [X; temp{2}];
            Y = [Y; temp{3}];
            Z = [Z; temp{4}];
            R = [R; temp{5}];
            G = [G; temp{6}];
            B = [B; temp{7}];
        end            
    end
    fclose(fid); 

    dirBar = strfind(fileName, '/');
    
    % Accumulate features' struct
    data.sceneName = fileName(dirBar(end)+1:end);
    data.feats.X   = X;
    data.feats.Y   = Y;
    data.feats.Z   = Z;
    data.feats.nx  = nx;
    data.feats.ny  = ny;
    data.feats.nz  = nz;
    if expandColorRange
        data.feats.R = R*255;
        data.feats.G = G*255;
        data.feats.B = B*255;
    else
        data.feats.R = R;
        data.feats.G = G;
        data.feats.B = B;
    end
    
    data.feats.idx = (1:numel(data.feats.X))';
    
end