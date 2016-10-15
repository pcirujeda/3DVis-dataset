function showData( data, colorLevels, pointSize )
    
    % showData - displays an obj data structure
    %
    %    data - data structure
    %    colorlevels - int for color palette width
    %    pointSize - int for point width
    %
    % Author   : Pol Cirujeda
    % Thanks   : Yashin Dicente Cid, Xavier Mateo

    % Copyright notice: You are free to modify, extend and distribute 
    %    this code granted that the author of the original code is 
    %    mentioned as the original author of the code.
 
    if ~exist('colorLevels','var')
        colorLevels = 128;
    end

    if ~exist('pointSize','var')
        pointSize = 10;
    end
    
    image(:,:,1) = data.feats.R;
    image(:,:,2) = data.feats.G;
    image(:,:,3) = data.feats.B;
    
    if max(image(:)) > 1
        image=image/255;
    end
    
    [newImage, imageMap] = rgb2ind(image, colorLevels);
    
    figure,
    hold on;
    for i=0:colorLevels-1
        indexs = find(newImage==i);
        if length(indexs>0)
            plot3(data.feats.X(indexs), data.feats.Y(indexs), data.feats.Z(indexs), '.', 'Color', imageMap(i+1,:), 'MarkerSize', pointSize);        
        end
    end
    axis image;

end