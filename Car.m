function Car(step)

pkg load image

if (step == 1)
	file = "Car.gif";

	[im1, im2] = Gif2BWImages(file);
	subplot(1, 2, 1);
	imshow(im1);
	subplot(1, 2, 2);
	imshow(im2);
	save vars1.mat im1 im2;
end;


if (step == 2)
	winSize = 21;

	load vars1.mat
	[ux, uy, l1, l2] = LucasKanade(im1, im2, winSize);
	close;
	subplot(2, 2, 1);
	imshow(ux);
	subplot(2, 2, 2);
	imshow(uy);
	subplot(2, 2, 3);
	imshow(l1);
	subplot(2, 2, 4);
	imshow(l2);
	save vars2.mat im1 im2 ux uy l1 l2;
end;


if (step == 3)
	vecSpacing = 15;
	eigCutOff = 0.3e-6;
	vecScale = 7;

	load vars2.mat;
	pts = CalcValidPoints(l1, l2, vecSpacing, eigCutOff);
	close;
	PlotFlow(im1, im2, ux, uy, pts, vecScale)
	print(1, "plot.png")
end;



