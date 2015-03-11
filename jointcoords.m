function [xs, ys] = jointcoords(jointangles)
   thighl = 1;
   calfl = 1;

   kneex = thighl*cos(jointangles(1));
   kneey = thighl*sin(jointangles(1));

   footx = kneex + calfl*cos(jointangles(2));
   footy = kneey + calfl*sin(jointangles(2));

   xs = [0 kneex footx];
   ys = [0 kneey footy];
end
