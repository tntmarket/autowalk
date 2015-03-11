clear all; clc; close all;

data = csvread('Data/magnet1.csv');

t0 = 1.03; tend = 23.03;
t = (t0:0.01:tend)';
top = interp1(data(:,1)/1000, data(:,2), t);
bot = interp1(data(:,3)/1000, data(:,4), t);
states = [top'
          bot'];
states = states - deg2rad(60);

figure;
tcurrent = 0;
for state = states
   tcurrent = tcurrent + 0.01;
   [xs, ys] = jointcoords(state);
   clf;
   title(num2str(tcurrent));
   line(xs, ys, 'Marker', 'o');
   axis([-2 2 -3 1]);
   axis square;
   pause(0.01);
end

