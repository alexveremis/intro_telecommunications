clear all 
close all 

%%% ������� �������: 03115063
%% 1o �������
%% �
A=9; %������ �� V
r2 = randi(2,24,1);
r2=r2-1; %������ ��������� 24 bits ��� 0 ��� 1.
%% set volt
bpam=zeros(size(24));
for i=1:24
if r2(i)==1
    bpam(i)=9;
elseif r2(i)==0
    bpam(i)=-9;
end
end
%% set time
Tb=0.5; %�������� bit �� sec .���� bit ������� 0.5 sec
t2=0:Tb:24*Tb;
l=24;
bpam(l+1)=-9;
figure ();
subplot(1,1,1);
stairs(t2,bpam);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('B-PAM Amplitude 9 Volts');
xlim([0 ((length(bpam)*Tb)-Tb)]);
ylim([-10 10]);

%% b
M=2; %���� ������ 2-PAM  ����������
y = pammod(r2,M);
y=y*9;
subplot(1,1,1);
figure ();
scatterplot(y); %�� ��������� ����������

%% �
%������ EsN0=EbN0
%EsN0=10log10(0.5) +snr
%EsN0= -3.01 +snr
%��� EbN0=5dB ==> snr=5+3.01 = ������� 8 dB
%��� EbN0=15dB ==> snr=15+3.01 = ������� 18 dB
y1=awgn(bpam,8,'measured'); %���� snr = 5 dB
y2=awgn(bpam,18,'measured'); %���� snr = 15 dB
figure ();
subplot(3,1,1);
stairs(t2,y1);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('B-PAM Amplitude 9 Volts + Noise snr=5dB');
xlim([0 ((length(bpam)*Tb)-Tb)]);
ylim([-18 18]);
subplot(3,1,2);
stairs(t2,y2);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('B-PAM Amplitude 9 Volts + Noise snr=15dB');
xlim([0 ((length(bpam)*Tb)-Tb)]);
ylim([-18 18]);
subplot(3,1,3);
stairs(t2,bpam);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('B-PAM Amplitude 9 Volts');
xlim([0 ((length(bpam)*Tb)-Tb)]);
ylim([-10 10]);

%% �
%���� ��������� 3 �������������� �� ������ �������� ��������� ��� �������,
%��� ���� ��� ��������� ���� �� ������.
c= [9 9i];
figure ();
modData1 = genqammod(r2,c);
rxSig1 = awgn(modData1,8,'measured');
h = scatterplot(rxSig1);
hold on
scatterplot(c,[],[],'r*',h)
grid
hold off
figure ();
modData2 = genqammod(r2,c);
rxSig2 = awgn(modData2,18,'measured');
h = scatterplot(rxSig2);
hold on
scatterplot(c,[],[],'r*',h)
grid
hold off


%% �
dataIn=randi(2,1000000,1);
dataIn=dataIn-1;
dataSym = bi2de(dataIn);
M=2;
berEst = zeros(size(16));
for i=0:1:15
snrdB=3+i;

% QAM modulate using 'Gray' symbol mapping
txSig = qammod(dataSym,M);
        
% �������� ������  awgn ��� ����
rxSig = awgn(txSig,snrdB,'measured');
        
% Demodulate �� ��������� ����
rxSym = qamdemod(rxSig,M);
% ��������� �� bits �� ����������� �������.
dataOut = de2bi(rxSym,1);
        
% ��������� ��� ������ ��� error bits
nErrors = biterr(dataIn,dataOut);
        
% the safe number of bits for the testing
numBits = 1000000;

berEst(i+1) = nErrors/numBits;% ��������� �� ber.
end

EbN0=0:1:15;
figure ();
subplot(1,1,1);
plot(EbN0,berEst);
xlabel ('Eb/N0 (dB)');
ylabel ('P[error]');
title ('BER~Eb/N0');
xlim([0 17]);
ylim([0 0.023]);