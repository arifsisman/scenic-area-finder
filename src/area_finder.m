[x, y, value] = map(10000, 17780);
countMat = value;
spy(countMat, 'o', 1);
print('-dpng', "../figures/taiwan_map_10000x17780");

scenicSpotCount = 10;

[index, value] = sort(countMat(:), 1, 'descend');
[row, col] = ind2sub(size(countMat), value(1:scenicSpotCount));
photo_count = index(1:scenicSpotCount);

hold on

% For each scenic point, we put a single dot and text photo counts
scatter(col, row, 'filled');
text(col + 10, row, num2str(photo_count))

edges = 7;
range = 300;

% For each scenic point, we aim to find scenic area
% sp = Scenic point, ep = Edge point for scenic area
for s=1:scenicSpotCount
    sp_row = row(s);
    sp_col = col(s);
    
    % create sub_matrix from countMat with range sp_row ± range and sp_col ± range
    subMatrix = countMat(sp_row - range:sp_row + range, sp_col - range:sp_col + range);
    
    % sort and get the first 7 scenic area edge points from sub_matrix
    [~, sp_value] = sort(subMatrix(:), 1, 'descend');
    [ep_row, ep_col] = ind2sub(size(subMatrix), sp_value(1:edges));

    % create convex and plot edges of the area
    [k, ~] = convhull([ep_col ep_row]);
    plot(sp_col + ep_col(k) - range, sp_row + ep_row(k) - range, 'LineWidth', 2, 'Color', [0.92 0.7 0.12])
end

hold off

grid minor
print('-dpng', "../figures/taiwan_top10_scenic_areas");