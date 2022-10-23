#fid = fopen ('C:\Users\victo\OneDrive\�rea de Trabalho\signal.csv', 'r')
divisor = 40;
Fs = 5e6 / divisor;
M = dlmread('Teste_rapido_final.csv',';',2,0);

tempo = decimate(M'(1, :)', divisor) ;
voltage = decimate(M'(2, :)', divisor) ;

M = 5;
voltageFiltrado = filter((1/M),ones(1,M),[1 zeros(1,M-1)], voltage);
#a = 0.5;
#m = 5;
#voltageFiltrado = ((1-a)/(1-avoltage^-1) )^m

#figure;
subplot(2, 1, 1);
[ax, h1, h2] = plotyy( tempo, voltage, tempo, voltageFiltrado );

set(ax(1),'YLim',[-10 10])
set(ax(2),'YLim',[-10 10])

#figure;
Nfft = length(tempo);
fvec = (-Nfft/2 : Nfft/2 - 1) * Fs / Nfft;
fvec = fvec';
Xreal = fftshift( fft(voltageFiltrado, Nfft) );

[a, b] = max( abs (Xreal) );

fvec(b)

subplot(2, 1, 2);
plot( fvec, 20*log10(abs(Xreal)) );
pause()

#subplot(3, 1, 3);
#figure;
#specgram(voltageFiltrado, 32, Fs)

#subplot (2, 1, 1)
#fplot (@sin, [-10, 10]);
#subplot (2, 1, 2)
#fplot (@cos, [-10, 10]);
#input()
