clc
close all
 
Fs=8000; %Sampling Frequency
 
%% reading the Audio files 
x = auread('ausig.au');
N=length(x);
 
x=auread('ausig.au' , N);
z=auread('ausig2.au');
 
sound(x, Fs)
sound(z, Fs)

%% plotting signals
M=length(z);
slength = N/Fs;
fs=8000;
Ts=1/fs;
t = linspace(0, N/Fs, N); 
figure (1)
plot (t,x); xlabel('ausig.au'); ylabel('time [sec]');
figure (2)
plot (t,z); xlabel('ausig2.au'); ylabel('time [sec]');
figure (3)
subplot (3,1,1); plot (t,x);  xlabel('ausig.au'); ylabel('time [sec]');
subplot (3,1,2); plot (t,z);  xlabel('ausig2.au'); ylabel('time [sec]');
 
%% the impuse response and the convolution
a= 5000;
 
h=a*exp(-a*t(t>0)); %impulse responce
 
a=10000;
f=lsim(1,[1,a],z,t);
a=9000;
f=lsim(1,[1,a],f,t);
a=8000;
f=lsim(1,[1,a],f,t);
a=7500;
f=lsim(1,[1,a],f,t);
a=7000;
f=lsim(1,[1,a],f,t);
 
f=f*10^20; %Output signal amplification
B=length(f);
tt= linspace(0,N/Fs,B);
subplot (3,1,3); plot (tt,f*Fs/N); xlabel('ausig2.au after filter'); ylabel('time [sec]');
 
figure (4)
plot (tt,f*Fs/N); xlabel('ausig2.au after filter'); ylabel('time [sec]');
 
sound (f,Fs)
