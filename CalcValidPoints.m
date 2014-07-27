function pts = CalcValidPoints(l1, l2, vecSpacing, eigCutOff)

[M N] = size(l1);

% space vectors for clarity
vecMask = zeros(M, N);
vecMask(1:vecSpacing:end, 1:vecSpacing:end) = 1;

% determine reliable vectors by eigenvalue test
eigMask = (l2 > l1) .* (l1 > eigCutOff);

% find points to plot
mask = vecMask .* eigMask;
pts = find(mask > 0);
