function region = searchNearestNeighbours( coordinates, point, numNeighbours )
    
    % searchNearestNeighbours - easy peasy search of nearest neighbours to
    % a given point
    %
    %    coordinates - (NxM) matrix of search points
    %    point - (1xM) vector
    %    numNeighbours - int specifying amount of neighbors for normal estimation
    %
    % Returns:
    %    region - (numNeighbors x M) matrix
    %
    % Author   : Pol Cirujeda

    % Copyright notice: You are free to modify, extend and distribute 
    %    this code granted that the author of the original code is 
    %    mentioned as the original author of the code.

    dists = distance(point', coordinates');
    orderDists = sort(dists);
    region = coordinates(dists < orderDists(numNeighbours+1),:);

end