clear all; clc; close all;

data = csvread('Data/magnet1.csv');

t0 = 1.03; tend = 23.03;
t = (t0:0.01:tend)';
angle_top = interp1(data(:,1)/1000, data(:,2), t);
angle_bot = interp1(data(:,3)/1000, data(:,4), t);
t = t - t0;

figure; hold on;
plot( ...
   t, angle_top, ...
   t, angle_bot, ...
   t, angle_top-angle_bot ...
);
legend('top', 'bot', 'top-bot');
xlim([0 tend-t0]);
