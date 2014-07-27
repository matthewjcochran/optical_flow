function [ux, uy, l1, l2] = LucasKanade(im1, im2, winSize)

% rows and columns assuming im2 has same size
[M N] = size(im1);

ux = zeros(M, N);
uy = zeros(M, N);

l1 = zeros(M, N);
l2 = zeros(M, N);

[fx, fy, ft] = CalcDerivatives(im1, im2);

% Gaussian weight matrix
W = fspecial('gaussian', [winSize, winSize], winSize / 6);
W2 = diag(W(:))^2;

% window 'radius'
R = floor(winSize / 2);

for i = 1 + R:M - R
	for j = 1 + R:N - R
		fxWin = fx(i - R:i + R, j - R:j + R);
		fyWin = fy(i - R:i + R, j - R:j + R);
		ftWin = ft(i - R:i + R, j - R:j + R);

		A = [fxWin'(:) fyWin'(:)];
		b = -ftWin'(:);

		u = pinv(A' * W2 * A) * A' * W2 * b;
		ux(i, j) = u(1);
		uy(i, j) = u(2);

		l = eig(A' * W2 * A);
		l1(i, j) = l(1);
		l2(i, j) = l(2);
	end;
end;

ux(isnan(ux)) = 0;
uy(isnan(uy)) = 0;

		

