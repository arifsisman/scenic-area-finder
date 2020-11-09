[x, y, value] = map(10000, 17780);

p = plot(x, y, '.');
axis image
xlabel('Longitude');
ylabel('Latitude');
set(p , 'markersize', 2)
print('-dpng', "../figures/taiwan_lat_lon_map");

figure(2);

% ksdensity function is using for computing the probability density
% function for each data vector
[xpdf, xindex]= ksdensity(x);
[ypdf, yindex]= ksdensity(y);

% Creating the 2D grid of x and y vectors
[meshxindex, meshyindex] = meshgrid(xindex,yindex);
[xpdfx,ypdfy] = meshgrid(xpdf,ypdf);

% Calculating the combined pdf
pdfcombined = xpdfx.*ypdfy;

% Ploting the 3D mesh
mesh(meshxindex, meshyindex, pdfcombined)

print('-dpng', "../figures/taiwan_photo_densities");