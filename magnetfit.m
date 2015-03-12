clear all; clc; close all;

fitmodel = 'fourier2';

data = csvread('Data/magnet1.csv');

t0 = 2; tend = 23;
ts = (t0:0.1:tend)';
angle_top = interp1(data(:,1)/1000, data(:,2), ts);
angle_bot = interp1(data(:,3)/1000, data(:,4), ts);
angle_knee = angle_top-angle_bot;
ts = ts - t0;

start = 33; stop = 53;
ts_slice = ts(start:stop);
angle_knee_slice = angle_knee(start:stop);

predicted = fit(ts_slice, angle_knee_slice, fitmodel);

figure; hold on;
plot(ts, angle_knee, '--');
plot(ts_slice, angle_knee_slice, 'Color', [0 0.5 0]);
plot(predicted);
legend('everything', 'slice', 'predicted');
xlim([0 tend-t0]);

window = 20;
forecast = 0.2;
predictions = zeros(length(ts),1);
for i = (window+1):length(ts)
   t = ts(i);
   fitted = fit(ts(i-window:i), angle_knee(i-window:i), fitmodel);
   predictions(i) = fitted(t+forecast);
end
predictions(predictions < 0) = 0;

figure;
plot( ...
   ts, angle_knee, ...
   ts+forecast, predictions ...
);
legend('actual', 'predicted');
xlim([0 tend-t0]);
