%% Estimation de la DSP du bruit

close all;
clear all;

Nr = %%%%%%%%%%%%%%%%%%%%%%%%%%%1000; % nombre de réalisations         
Nfft = 2000; % résolution du spectre
L=size(sonar_passif(),1);  %nombre d'échantillons d'une réalisation
sigs = zeros(L, Nr);  %initialisation 

%% génération de réalisations du bruit
for u = 1:Nr
        sigs(:, u) = sonar_passif();
end


%% Estimation de la DSP
DSP = %%%%%%%%%%%%%%%%%%%%%%%%%%%sum(abs(fft(sigs, Nfft)).^2, 2)/L/Nr;  

freqs = %%%%%%%%%%%%%%%%%%%%%%%%%%%linspace(-1/2, 1/2, Nfft+1);    
freqs = %%%%%%%%%%%%%%%%%%%%%%%%%%%freqs(1 : end-1);  

plot(freqs, fftshift(DSP))
xlabel('Fréquence réduite')
ylabel('DSP')