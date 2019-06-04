% Variance du terme de bruit dans l'autocorrelation

load impulses
h=impulse0;
plot(h)

H0 = %%%%%%%%%%%%%%%%%%%%%%%%%%%fft(h, Nfft);   

var_rb = %%%%%%%%%%%%%%%%%%%%%%%%%%%sum(abs(H0.^2).* DSP) / Nfft;   

sigma_rb = %%%%%%%%%%%%%%%%%%%%%%%%%%%sqrt(var_rb)  


