function x=discrete_sinus(Tobs,fe,A1,f1,A2,f2)
%
% x=discrete_sinus(Tobs,fe,a1,f1,a2,f2);
%
% Create a sum of two discrete sinus at frequency f1 (Hz) and f2 (Hz), of amplitudes
% A1 and A2 sampled at fe (Hz) and with an observation windows of length
% Tobs (s)

% Number of samples
N= round(fe*Tobs); 

% time sample
Temps = [0:N-1]/fe; Temps = Temps(:);

%signal
x = A1*sin(2*pi*f1*Temps) + A2*sin(2*pi*f2*Temps) ;

