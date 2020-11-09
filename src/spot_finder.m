[x, y, value] = map(10000, 17780);
countMat = value;
spy(countMat, 'o', 1);
print('-dpng', "../figures/taiwan_map_10000x17780");

scenicSpotCount = 10;

% In order to sort our matrix, we first flatten it.
[index, value] = sort(countMat(:), 1, 'descend');

% Then, using the ind2sub method, we get the first 10 values of our sorted 
% flat matrix into separate row and column vectors.
[row, col] = ind2sub(size(countMat), value(1:scenicSpotCount));

% After finding the scenic spots and their rows and columns
% we can get the number of photos in that area from our index vector.
photo_count = index(1:scenicSpotCount);

scenicPoint = [row, col];

hold on

% Using the scatter method, we mark our scenic spots.
scatter(scenicPoint(:,2), scenicPoint(:,1), 'filled');

% Using the text method, we write how many photos contain scenic spots.
text(col + 10, row, num2str(photo_count))

hold off

grid minor
print('-dpng', "../figures/taiwan_top10_scenic_spots");