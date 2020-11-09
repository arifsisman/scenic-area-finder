function [x, y, value] = map(width, height)
    contents = readmatrix('data/taiwanRawData.txt');

    x = contents(:,1);
    y = contents(:,2);

    %{
    Find the center points of each square along the x-axis and the y-axis. 
    Note that m and n are used to determine the size of each square.
    %}
    xCenter = linspace(min(x), max(x), width);
    yCenter = linspace(min(y), max(y), height);

    % Find the boundary of each square along the x-axis and the y-axis
    xBoundary = (xCenter(1:end-1)+xCenter(2:end))/2;
    yBoundary = (yCenter(1:end-1)+yCenter(2:end))/2;

    % Determine the interval of each photo's location along the x-axis
    xSquareIndex = rangeSearchBin(x, xBoundary);
    ySquareIndex = rangeSearchBin(y, yBoundary);

    valueTemp = zeros(width, height);

    for i = 1:length(xSquareIndex)
        valueTemp(xSquareIndex(i), ySquareIndex(i)) = valueTemp(xSquareIndex(i), ySquareIndex(i)) + 1;
    end

    value = rot90(sparse(valueTemp));
end