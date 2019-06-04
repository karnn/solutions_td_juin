
close all;

Ldsp = length(DSP);

if0 = abs(fft(impulse0, Ldsp)).^2;
if1 = abs(fft(impulse1, Ldsp)).^2;
if2 = abs(fft(impulse2, Ldsp)).^2;
if3 = abs(fft(impulse3, Ldsp)).^2;

%% variance du bruit dans l'intercorrélation

P0 = %%%%%%%%%%%%%%%%%%%%%%%%%%%sum(if0 .* DSP) / Ldsp  %%%%%%%%%%%%%%%%%%%%%
P1 = %%%%%%%%%%%%%%%%%%%%%%%%%%%sum(if1 .* DSP) / Ldsp  %%%%%%%%%%%%%%%%%%%%%
P2 = %%%%%%%%%%%%%%%%%%%%%%%%%%%sum(if2 .* DSP) / Ldsp  %%%%%%%%%%%%%%%%%%%%%
P3 = %%%%%%%%%%%%%%%%%%%%%%%%%%%sum(if3 .* DSP) / Ldsp  %%%%%%%%%%%%%%%%%%%%%

%% test des impulsions

tir0 = sonar(impulse0);
tir1 = sonar(impulse1);
tir2 = sonar(impulse2);
tir3 = sonar(impulse3);

correl0 = %%%%%%%%%%%%%%%%%%%%%%%%%%%xcorr(tir0, impulse0);   %%%%%%%%%%%%%%%%%%%%%
correl1 = %%%%%%%%%%%%%%%%%%%%%%%%%%%xcorr(tir1, impulse1);    %%%%%%%%%%%%%%%%%%%%%
correl2 = %%%%%%%%%%%%%%%%%%%%%%%%%%%xcorr(tir2, impulse2);   %%%%%%%%%%%%%%%%%%%%%
correl3 = %%%%%%%%%%%%%%%%%%%%%%%%%%%xcorr(tir3, impulse3);    %%%%%%%%%%%%%%%%%%%%%

T = %%%%%%%%%%%%%%%%%%%%%%%%%%%-Lsig+1:Lsig-1;   %%%%%%%%%%%%%%%%%%%%%

%% tracées

subplot(4, 2, 1)
plot(impulse0);
subplot(4, 2, 3)
plot(impulse1);
subplot(4, 2, 5)
plot(impulse2);
subplot(4, 2, 7)
plot(impulse3);

subplot(4, 2, 2)
plot(T, abs(correl0));
ylabel(sprintf('Var = %0.3f', P0))
hold on
[v, idx] = max(abs(correl0));
scatter(T(idx), v);

subplot(4, 2, 4)
plot(T, abs(correl1));
ylabel(sprintf('Var = %0.3f', P1))
hold on
[v, idx] = max(abs(correl1));
scatter(T(idx), v);

subplot(4, 2, 6)
plot(T, abs(correl2));
ylabel(sprintf('Var = %0.3f', P2))
hold on
[v, idx] = max(abs(correl2));
scatter(T(idx), v);

subplot(4, 2, 8)
plot(T, abs(correl3));
ylabel(sprintf('Var = %0.3f', P3))
hold on
[v, idx] = max(abs(correl3));
scatter(T(idx), v);