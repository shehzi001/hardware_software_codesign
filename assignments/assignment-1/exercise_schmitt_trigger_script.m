f1 = 1000;
f2 = 40;
t = 0:0.000001:1/40;

y = sin(2 * pi * f1 * t) + 5 * sin(2 * pi * f2 * t)

figure,
plot(t,y), grid on
figure,
schmitt_trigger(y, 0.0, 1.0)
