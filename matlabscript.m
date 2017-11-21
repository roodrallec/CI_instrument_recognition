%---A script which imports a wav file, applies a hamming window, performs a
%fft (to convert from time to frequency domain), applies gaussian windows
%to the isolated harmonics, inverts the gaussian filtered components, plots
%a log-linear plot of the decay constant for each harmonic

Sfileloc='./audio_samples/middle.wav'; %file location
[Adata,Fs]=audioread(Sfileloc);   %wav file read into data and sample freq
T=1/Fs;     %Time period
L=length(Adata);    %number of samples
t=(0:L-1)*T;        %time             
f = (0:L-1)*(Fs/L); %frequency domain
ham=hamming(L,'periodic');  %hamming window, size of number of samples
windata=Adata.*ham;     %applying the hamming window
spect=fft(windata);     %fast fourier transform to convert to freq domain
plot(f,abs(spect));          %plotting spectrogram in frequency domain
