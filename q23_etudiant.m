
% On estime la distance en moyennant plusieurs réalisations
% Le vrai retard (50 échantillons) peut alors être retrouvé.

close all;

Lsig = size(sonar0(),1);  %nombre d'�chantillons d'une r�alisation

Ntir = %%%%%%%%%%%%%%%%%%%%%%%%%%%26400; 

tirs = zeros(Lsig, Ntir);  %initialisation
correls = zeros(Lsig*2-1, Ntir);  %initialisation

for u = 1:Ntir
        tirs(:, u) = sonar0();
        correls(:, u) = %%%%%%%%%%%%%%%%%%%%%%%%%%%xcorr(tirs(:, u), impulse0);  
end

T = %%%%%%%%%%%%%%%%%%%%%%%%%%%-Lsig+1:Lsig-1;  

%estimation avec 1 r�alisation
subplot(4, 1, 1)
C = %%%%%%%%%%%%%%%%%%%%%%%%%%%mean(correls(:, 1:1), 2);  
plot(T, abs(C));
xlabel('Temps')
ylabel('I = 1');
hold on
[v, idx] = max(abs(C));
scatter(T(idx), v);

%estimation avec 2 r�alisations
subplot(4, 1, 2)
C = %%%%%%%%%%%%%%%%%%%%%%%%%%%mean(correls(:, 1:2), 2); 
plot(T, abs(C));
xlabel('Temps')
ylabel('I = 2');
hold on
[v, idx] = max(abs(C));
scatter(T(idx), v);

%estimation avec 4 r�alisations
subplot(4, 1, 3)
C = %%%%%%%%%%%%%%%%%%%%%%%%%%%mean(correls(:, 1:4), 2);   
plot(T, abs(C));
xlabel('Temps')
ylabel('I = 4');
hold on
[v, idx] = max(abs(C));
scatter(T(idx), v);

%estimation avec 8 r�alisations
subplot(4, 1, 4)
C = %%%%%%%%%%%%%%%%%%%%%%%%%%%mean(correls(:, 1:16), 2);   
plot(T, abs(C));
xlabel('Temps')
ylabel('I = 8');
hold on
[v, idx] = max(abs(C));
grid
scatter(T(idx), v);


%histogramme de delta estim� pour I r�alisations
clear delta
I=24;j=1;
for i=1:I:Ntir-I
    C = %%%%%%%%%%%%%%%%%%%%%%%%%%%mean(correls(:, i:i+I-1), 2); 
    [v, idx] = max(abs(C));
    delta(j) = %%%%%%%%%%%%%%%%%%%%%%%%%%%T(idx);  
    j=j+1;
end
figure
hist(delta)
xlabel('delta estim�')
title('histogramme de delta estim�')
iI=1;    
for I=8:4:24
    clear delta
    j=1;
    for i=1:I:Ntir-I
        C = %%%%%%%%%%%%%%%%%%%%%%%%%%%mean(correls(:, i:i+I-1), 2); 
        [v, idx] = max(abs(C));
        delta(j) = %%%%%%%%%%%%%%%%%%%%%%%%%%%T(idx);  
        j=j+1;
    end
    Nbfd=length(find(abs(delta-50)>50));
    probafd(iI)=Nbfd/length(delta);
    M(iI)=I;
    iI=iI+1;
end
figure
semilogy(M,probafd)
xlabel('nombre de r�alisations pour effectuer la moyenne')
ylabel('probabilit� de mauvaise estimation')

