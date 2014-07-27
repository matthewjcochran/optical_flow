function PlotFlow(im1, im2, ux, uy, pts, vecScale)

[M, N] = size(im1);
[X, Y] = meshgrid(1:N, 1:M);
X = X(pts);
Y = Y(pts);
ux = -vecScale * ux(pts);
uy = -vecScale * uy(pts);

imshow((im1 + im2) / 2);
hold on;
quiver(X, Y, ux, uy, 0, 'color', 'cyan', 'linewidth', 2.5);
hold off;


