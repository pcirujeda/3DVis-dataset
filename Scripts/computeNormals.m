function [ nx, ny, nz ] = computeNormals( X, Y, Z, numNeighbours )
    
    % computeNormals - computes vertex normals for each one of set of
    % 3D coordinates
    %
    % [ nx, ny, nz ] = computeNormals( X, Y, Z, numNeighbours, verbose )
    %
    %    X - (1xN) vector 
    %    Y - (1xN) vector 
    %    Z - (1xN) vector
    %    numNeighbours - int specifying amount of neighbors for normal estimation
    %
    % Returns:
    %    nx - (1xN) vector
    %    ny - (1xN) vector
    %    nz - (1xN) vector
    %
    % Author   : Pol Cirujeda
    % Thanks   : Yashin Dicente Cid, Xavier Mateo

    % Copyright notice: You are free to modify, extend and distribute 
    %    this code granted that the author of the original code is 
    %    mentioned as the original author of the code.

    normalVectors = [];
    for i=1:size(X,1)
        studyPoint = [X(i),Y(i),Z(i)];
        proximityRegion = searchNearestNeighbours([X,Y,Z],studyPoint,numNeighbours);

        v = normnd(proximityRegion);
        normalVectors = [normalVectors v];     
    end
    
    nx = normalVectors(1,:);
    ny = normalVectors(2,:);
    nz = normalVectors(3,:);
end