%% Estimation de la DSP du bruit

close all;
clear all;

Nr = %%%%%%%%%%%%%%%%%%%%%%%%%%%1000; % nombre de r�alisations         
Nfft = 2000; % r�solution du spectre
L=size(sonar_passif(),1);  %nombre d'�chantillons d'une r�alisation
sigs = zeros(L, Nr);  %initialisation 

%% g�n�ration de r�alisations du bruit
for u = 1:Nr
        sigs(:, u) = sonar_passif();
end


%% Estimation de la DSP
DSP = %%%%%%%%%%%%%%%%%%%%%%%%%%%sum(abs(fft(sigs, Nfft)).^2, 2)/L/Nr;  

freqs = %%%%%%%%%%%%%%%%%%%%%%%%%%%linspace(-1/2, 1/2, Nfft+1);    
freqs = %%%%%%%%%%%%%%%%%%%%%%%%%%%freqs(1 : end-1);  

plot(freqs, fftshift(DSP))
xlabel('Fr�quence r�duite')
ylabel('DSP')