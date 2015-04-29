
%Here we generate the white noise seq of 1000 samples
v=wgn(1,1000,1); 
% here we use the AR(1) function to get process output    
%a=0.9;
x=filter(1,[1,-0.9],v);
w=linspace(0,(pi),1000); % freq axis points
H=(1-(0.9*exp(1i*w))); 
H=H.^-1;
Sy= var(x)*(abs(H).^2); %theoretical power spectrum
figure();
plot(w,Sy);
title('Theoretical Power Spectral Density');

%calculating periodogram
[Pxx,w] = periodogram(x);
figure();
%plot(w,Sy,'-',w,Pxx,':');
title('Periodogram PSD');


%Blackman Tukey estimate with M=10,20,50,100
Bt1=spa(x',10,w,120);
Bt2=spa(x',20,w,120);
Bt3=spa(x',50,w,120);
Bt4=spa(x',100,w,120);
figure();
plot(w,Sy,'-',w,Bt1,':');
title('Blackman Tukey Estimate for sub block size(M)=10');
figure();
plot(w,Sy,'-',w,Bt2,':');
title('Blackman Tukey Estimate for sub block size(M)=20');
figure();
plot(w,Sy,'-',w,Bt1,':');
title('Blackman Tukey Estimate for sub block size(M)=50');
figure();
plot(w,Sy,'-',w,Bt1,':');
title('Blackman Tukey Estimate for sub block size(M)=100');

plot(w,Bt1,'-',w,Bt2,':',w,Bt3,'-.',w,Bt4,'--');

%We see that as the segment length increases the resolution increases


%Welch estimate with M=10,20,50,100 using Hamming window
Wch1=spectrum.welch('Hamming',10,50);
Wch2=spectrum.welch('Hamming',20,50);
Wch3=spectrum.welch('Hamming',50,50);
Wch4=spectrum.welch('Hamming',100,50);
figure();
subplot(2,2,1);
psd(Wch1,x);
subplot(2,2,2);
psd(Wch2,x);
subplot(2,2,3);
psd(Wch3,x);
subplot(2,2,4);
psd(Wch4,x); 
%We see that as the segment length increases the resolution increases


%a=-0.9
% here we use the AR(1) function to get process output    
x=filter(1,[1,-0.9],v);
w=linspace(0,(pi),1000); % freq axis points
H=(1-(0.9*exp(1i*w))); 
H=H.^-1;
Sy= var(x)*(abs(H).^2); %theoretical power spectrum
figure();
plot(w,Sy);
title('Theoretical Power Spectral Density');

%calculating periodogram
[Pxx,w] = periodogram(x);
figure();
plot(w,Sy,'-',w,Pxx,':');
title('Periodogram PSD');


%Blackman Tukey estimate with M=10,20,50,100
Bt1=spa(x',10,w,120);
Bt2=spa(x',20,w,120);
Bt3=spa(x',50,w,120);
Bt4=spa(x',100,w,120);
figure();
plot(w,Sy,'-',w,Bt1,':');
title('Blackman Tukey Estimate for sub block size(M)=10');
figure();
plot(w,Sy,'-',w,Bt2,':');
title('Blackman Tukey Estimate for sub block size(M)=20');
figure();
plot(w,Sy,'-',w,Bt1,':');
title('Blackman Tukey Estimate for sub block size(M)=50');
figure();
plot(w,Sy,'-',w,Bt1,':');
title('Blackman Tukey Estimate for sub block size(M)=100');

plot(w,Bt1,'-',w,Bt2,':',w,Bt3,'-.',w,Bt4,'--');

%We see that as the segment length increases the resolution increases


%Welch estimate with M=10,20,50,100 using Hamming window
Wch1=spectrum.welch('Hamming',10,50);
Wch2=spectrum.welch('Hamming',20,50);
Wch3=spectrum.welch('Hamming',50,50);
Wch4=spectrum.welch('Hamming',100,50);
figure();
subplot(2,2,1);
psd(Wch1,x);
subplot(2,2,2);
psd(Wch2,x);
subplot(2,2,3);
psd(Wch3,x);
subplot(2,2,4);
psd(Wch4,x);
