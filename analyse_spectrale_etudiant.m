close all
clear all


%--- parametre ---
f1 = 500;   A1 = 1;
f2 = 555;   A2 = 2;

Tobs=100e-3; %duréee d'observation
fe = 4e3;   % frequence d'echantillonnage
N = round(fe*Tobs); % nombre de points

s=%%%%%%%%%%%%%%%%%%%discrete_sinus(Tobs,fe,A1,f1,A2,f2);

%% zerospadding
S = %%%%%%%%%%%%%%%%%%%fft(s);
f = %%%%%%%%%%%%%%%%%%%[0:N-1]/N*fe;

p=100;
Nfft = N*p;
Sz = %%%%%%%%%%%%%%%%%%%fft(s, Nfft);
fz = %%%%%%%%%%%%%%%%%%%[0:Nfft-1]/Nfft*fe;

figure
plot(f, abs(S), '-or')
hold on
plot(fz, abs(Sz),'.-')
legend(['TF sans zeropadding', 'TF avec zeropadding (N''='  num2str(p)  'N)'])
title('Influence du zeropadding')
xlabel('Fréquence (Hz)')

%% duréee obs
Tlim=%%%%%%%%%%%%%%%%%%%1/(f2-f1);

Tobs=Tlim/4;
N = round(fe*Tobs); % nombre de points
s = %%%%%%%%%%%%%%%%%%%discrete_sinus(Tobs,fe,A1,f1,A2,f2);
S1=%%%%%%%%%%%%%%%%%%%fft(s,Nfft);
fz1 = %%%%%%%%%%%%%%%%%%%[0:Nfft-1]/Nfft*fe;

Tobs=Tlim;
N = round(fe*Tobs); % nombre de points
s = %%%%%%%%%%%%%%%%%%%discrete_sinus(Tobs,fe,A1,f1,A2,f2);
S2=%%%%%%%%%%%%%%%%%%%fft(s,Nfft);
fz2 = %%%%%%%%%%%%%%%%%%%[0:Nfft-1]/Nfft*fe;

Tobs=Tlim*4;
N = round(fe*Tobs); % nombre de points
s = %%%%%%%%%%%%%%%%%%%discrete_sinus(Tobs,fe,A1,f1,A2,f2);
S3=%%%%%%%%%%%%%%%%%%%fft(s,Nfft);
fz3 = %%%%%%%%%%%%%%%%%%%[0:Nfft-1]/Nfft*fe;

figure
plot(fz1(1:end/2),abs(S1(1:end/2)))
hold on
plot(fz2(1:end/2),abs(S2(1:end/2)))
plot(fz3(1:end/2),abs(S3(1:end/2)))
legend('T_{obs}=T_{lim}/4','T_{obs}=T_{lim}','T_{obs}=4T_{lim}')
title('Influence de T_{obs}')
xlabel('Fréquence (Hz)')

% frequence d'echantillonnage

% Tobs fixé
Tobs=100e-3; %duréee d'observation

fe = 1000;   % frequence d'echantillonnage
N = round(fe*Tobs); % nombre de points
s = %%%%%%%%%%%%%%%%%%%discrete_sinus(Tobs,fe,A1,f1,A2,f2);
S1=%%%%%%%%%%%%%%%%%%%fft(s,Nfft);
fz1 = %%%%%%%%%%%%%%%%%%%[0:Nfft-1]/Nfft*fe;

fe = 2000;
N = round(fe*Tobs); % nombre de points
s = %%%%%%%%%%%%%%%%%%%discrete_sinus(Tobs,fe,A1,f1,A2,f2);
S2=%%%%%%%%%%%%%%%%%%%fft(s,Nfft);
fz2 = %%%%%%%%%%%%%%%%%%%[0:Nfft-1]/Nfft*fe;

fe = 4000;
N = round(fe*Tobs); % nombre de points
s = %%%%%%%%%%%%%%%%%%%discrete_sinus(Tobs,fe,A1,f1,A2,f2);
S3=%%%%%%%%%%%%%%%%%%%fft(s,Nfft);
fz3 = %%%%%%%%%%%%%%%%%%%[0:Nfft-1]/Nfft*fe;

figure
plot(fz1(1:end/2),abs(S1(1:end/2)))
hold on
plot(fz2(1:end/2),abs(S2(1:end/2)))
plot(fz3(1:end/2),abs(S3(1:end/2)))
legend('f_e=1kHz','f_e=2kHz','f_e=4kHz')
title('Influence de f_e à t_{obs} fixé')
xlabel('Fréquence (Hz)')

% N fixé
N = 400; % nombre de points

fe = 1000;   % frequence d'echantillonnage
Tobs=%%%%%%%%%%%%%%%%%%%N/fe     %duréee d'observation
s = %%%%%%%%%%%%%%%%%%%discrete_sinus(Tobs,fe,A1,f1,A2,f2);
S1=%%%%%%%%%%%%%%%%%%%fft(s,Nfft);
fz1 = %%%%%%%%%%%%%%%%%%%[0:Nfft-1]/Nfft*fe;

fe = 2000;
Tobs=%%%%%%%%%%%%%%%%%%%N/fe     %duréee d'observation
s = %%%%%%%%%%%%%%%%%%%discrete_sinus(Tobs,fe,A1,f1,A2,f2);
S2=%%%%%%%%%%%%%%%%%%%fft(s,Nfft);
fz2 = %%%%%%%%%%%%%%%%%%%[0:Nfft-1]/Nfft*fe;

fe = 4000;
Tobs=%%%%%%%%%%%%%%%%%%%N/fe     %duréee d'observation
s = %%%%%%%%%%%%%%%%%%%discrete_sinus(Tobs,fe,A1,f1,A2,f2);
S3=%%%%%%%%%%%%%%%%%%%fft(s,Nfft);
fz3 = %%%%%%%%%%%%%%%%%%%[0:Nfft-1]/Nfft*fe;

figure
plot(fz1(1:end/2),abs(S1(1:end/2)))
hold on
plot(fz2(1:end/2),abs(S2(1:end/2)))
plot(fz3(1:end/2),abs(S3(1:end/2)))
legend('f_e=1kHz','f_e=2kHz','f_e=4kHz')
title('Influence de f_e à N fixé')
xlabel('Fréquence (Hz)')

%% Choix de la fenêtre pondération
A1=1;
A2=10;
Tobs=100e-3; %duréee d'observation
fe=4e3;
N = round(fe*Tobs); % nombre de points

% rectangle
s = %%%%%%%%%%%%%%%%%%%discrete_sinus(Tobs,fe,A1,f1,A2,f2);
W0=%%%%%%%%%%%%%%%%%%%N;
S1=%%%%%%%%%%%%%%%%%%%fft(s,Nfft)/W0;
fz1 = %%%%%%%%%%%%%%%%%%%[0:Nfft-1]/Nfft*fe;


%hamming
w=hamming(N);
W0=%%%%%%%%%%%%%%%%%%%N;
S2=%%%%%%%%%%%%%%%%%%%fft(s.*w,Nfft)/W0;
fz2 = %%%%%%%%%%%%%%%%%%%[0:Nfft-1]/Nfft*fe;

%bartlett
w=bartlett(N);
W0=%%%%%%%%%%%%%%%%%%%N;
S3=%%%%%%%%%%%%%%%%%%%fft(s.*w,Nfft)/W0;
fz3 =%%%%%%%%%%%%%%%%%%% [0:Nfft-1]/Nfft*fe;

figure
plot(fz1(1:end/2),abs(S1(1:end/2)))
hold on
plot(fz2(1:end/2),abs(S2(1:end/2)))
plot(fz3(1:end/2),abs(S3(1:end/2)))
legend('Rectangle','Hamming','Bartlett')
title('Influence de la fenêtre de pondération')
xlabel('Fréquence (Hz)')

%% Signal inconnu

load DonneesSinus
N=length(Temps);
fe=%%%%%%%%%%%%%%%%%%%1/diff(Temps(1:2));

%--- plot signal---
figure
plot(Temps,SignalObserve)
title('Signal Observé')

% fenetre rectangulaire
Nfft = %%%%%%%%%%%%%%%%%%%N*50;
TransFourier = %%%%%%%%%%%%%%%%%%%fft(SignalObserve, Nfft);
Frequence = %%%%%%%%%%%%%%%%%%%[0:Nfft-1]/Nfft*fe;

figure
plot(Frequence, abs(TransFourier)/N)
[maxi,indice] = max(abs(TransFourier));
title('Fenetrage rectangulaire')


% fenetre de Hanning
TransFourier = %%%%%%%%%%%%%%%%%%%fft(SignalObserve.*hamming(length(SignalObserve)), Nfft);

figure, hold on, grid on
plot(Frequence, abs(TransFourier)/sum(hamming(length(SignalObserve))))
title('Fenetrage de Hamming')





