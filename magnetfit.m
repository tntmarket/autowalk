clear all; clc; close all;

data = csvread('Data/magnet1.csv');

t0 = 1.03; tend = 23.03;
t = (t0:0.01:tend)';
angle_top = interp1(data(:,1)/1000, data(:,2), t);
angle_bot = interp1(data(:,3)/1000, data(:,4), t);
angle_knee = angle_top-angle_bot;
t = t - t0;

angle_knee_original = angle_knee;

angle_knee(angle_knee < 0.15) = 0.15;

swinging = [0; diff(angle_knee)];
swinging(swinging < 0) = -1;
swinging(swinging > 0) = 1;


figure;
plot( ...
   t, angle_top, ...
   t, angle_bot, ...
   t, angle_knee, ...
   t, angle_knee_original ...
);
   % t, swinging ...
legend('top', 'bot', 'top-bot');
xlim([0 tend-t0]);

start = 700; stop = 790;
t = t(start:stop);
angle_knee = angle_knee(start:stop);
figure;
plot( ...
   t, angle_knee ...
);
