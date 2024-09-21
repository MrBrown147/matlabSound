
clear;


Fs = 10000; %ЧД, Гц

t = 0:1/Fs:2-1/Fs; %Время, сек

f1 = 261.6; %частота сигнал, Гц
f2 = 0;%329.6;
f3 = 0;%440;

A = 10; %Амплитуда

noseLev = 0.5; %СКО шума

signal1 = A*cos(2*pi*f1*t);
signal2 = A*cos(2*pi*f2*t);
signal3 = A*cos(2*pi*f3*t);

nose = noseLev*randn(size(t));
signal = signal1 + signal2 + signal3;

result = signal + nose;

plot(t, result);
xlabel('Время (с)');
ylabel('Амплитуда');
title('Синусоидальный сигнал');
grid on;

result = result/max(abs(result));
%sound(signal,Fs);
%sound(nose, Fs);
%sound(signal1);
%sound(signal2);
sound(result,Fs);
filename = 'sound.wav';
audiowrite(filename, result,Fs);

