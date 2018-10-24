%FishEye Distortion Curve
%Use measurements from middle grid.jpg

North=[0 14.26 28.26 40.25 53.25 65.00 78.25 88.00 99.25 108.50 117.76];
South=[0 12.75 26.25 38.50 52.02 63.52 74.77 85.54 96.26 106.04 114.55];
East=[0 12.00 26.25 38.25 51.75 64.25 74.25 85.00 95.75 105.00 112.75];
West=[0 13.77 26.52 41.03 53.26 65.52 77.62 88.51 100.26 110.01 120.00];

AllPixels(1,:)=North;
AllPixels(2,:)=South;
AllPixels(3,:)=East;
AllPixels(4,:)=West;

for i=1:11
    PixelDistance(i)=mean(AllPixels(:,i));
end
realDistance=linspace(0,10,11);
plot(realDistance,PixelDistance,'b','linewidth',2);hold on;
plot(realDistance,PixelDistance,'b.','MarkerSize',20);
title('Fish Eye Distortion on Xybion','fontsize',20);
xlabel('Real distance (cm)','fontsize',15);
ylabel('Pixel distance (xybion pixels)','fontsize',15);
set(gca,'fontsize',12);