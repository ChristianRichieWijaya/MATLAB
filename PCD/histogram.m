clear;
clc;

nk = [1120 3214 4850 3425 1995 784 541 455]
rk = 0:1:7;

bar(rk,nk);grid on;
hold on; plot(rk, nk); grid on;
hold on; stairs(rk, nk); grid on;

