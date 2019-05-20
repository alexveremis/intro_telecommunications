clear all 
close all 
%% 2o �������

%% �
A=9; %������ �� V
r2 = randi(2,24,1);
r2=r2-1; %������ ��������� 24 bits ��� 0 ��� 1.
fc=2; %fc=2Hz ���� � �������.
ybpsk = zeros(size(24));
symbols_bpsk=zeros(size(24));
symbols_qpsk=zeros(size(12));
symbols_8psk=zeros(size(8));
needed_qpsk=zeros(size(12));

for i=1:24
if (r2(i)==1)
    ybpsk(i)=9 ;
    symbols_bpsk(i)=0;
else
    ybpsk(i)=-9;
    symbols_bpsk(i)=180;
end
end
t=0:1/100: 1-1/100;
x1=cos(2*pi*fc*t);% ������������ ��� ���������� ��� �� ��� �������� ���� ���������� ���� bpsk

allo3=zeros(size(2400));%���������� ������� ��� ��� ���������� ��� ������� ������� ���� bpsk
allo4=zeros(size(1200));%���������� ������� ��� ��� ���������� ��� ������� ������� ���� qpsk
allo5=zeros(size(800));%���������� ������� ��� ��� ���������� ��� ������� ������� ���� 8psk

for i=1:24
   for j=1:100
        allo3(j +(i-1)*100)=x1(j)*ybpsk(i); 
   end
end
%����� � ������� allo3 �������� ��� �� ������������ ���� ���� bpsk
t=0:1/100:24-1/100;
subplot(3,1,1);
plot(t,allo3);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('BPSK Modulation');


j=1;
for i=1:2:24
if (r2(i)==1) && (r2(i+1)==1)
    symbols_qpsk(j)=45;
elseif (r2(i)==1) && (r2(i+1)==0)
    symbols_qpsk(j)=315;
elseif (r2(i)==0) && (r2(i+1)==0)
    symbols_qpsk(j)=225;
else
    symbols_qpsk(j)=135;
end
j=j+1;
end

j=1;
for i=1:3:24
if (r2(i)==0) && (r2(i+1)==0) && (r2(i+2)==0)
    symbols_8psk(j)=0;
elseif (r2(i)==0) && (r2(i+1)==0) && (r2(i+2)==1)
    symbols_8psk(j)=45;
elseif    (r2(i)==0) && (r2(i+1)==1) && (r2(i+2)==1)
    symbols_8psk(j)=90;
elseif    (r2(i)==0) && (r2(i+1)==1) && (r2(i+2)==0)
    symbols_8psk(j)=135; 
elseif    (r2(i)==1) && (r2(i+1)==1) && (r2(i+2)==0)
    symbols_8psk(j)=180;  
elseif    (r2(i)==1) && (r2(i+1)==1) && (r2(i+2)==1)
    symbols_8psk(j)=225;  
elseif    (r2(i)==1) && (r2(i+1)==0) && (r2(i+2)==1)
    symbols_8psk(j)=270;  
elseif    (r2(i)==1) && (r2(i+1)==0) && (r2(i+2)==0)
    symbols_8psk(j)=315;  
end
j=j+1;
end
%������� �� ������� ��� ���������� ���  ���������� 8psk ���� ������ ��� ���
%��� ����� ������������
display(symbols_bpsk);%�������� ��� ����������� ��������� �������� ��� bpsk ����������.
display(symbols_qpsk);%�������� ��� ����������� ��������� �������� ��� qpsk ����������.
display(symbols_8psk);%�������� ��� ����������� ��������� �������� ��� 8psk ����������.

t=0:1/100: 1-1/100;
x2=cos(4*pi*fc*t);
x3=sin(4*pi*fc*t);
x4=cos(4*pi*fc*t + pi/4);
x5=sin(4*pi*fc*t + pi/4); %��������� ������� ��� ���������� ��� ��� ���������� ��� ������������� �������


for i=1:12
   for j=1:100
       if (symbols_qpsk(i)==45)
        allo4(j +(i-1)*100)=x2(j)*(-9); 
       elseif (symbols_qpsk(i)==135)
        allo4(j +(i-1)*100)=x3(j)*9; 
       elseif (symbols_qpsk(i)==225)
        allo4(j +(i-1)*100)=x2(j)*9; 
       elseif (symbols_qpsk(i)==315)
        allo4(j +(i-1)*100)=x3(j)*(-9); 
       end
    end
end
%����� � ������� allo4 �������� ��� �� ������������ ���� ���� qpsk

t=0:1/100:12-1/100;
subplot(3,1,2);
plot(t,allo4);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('QPSK Modulation');

for i=1:8
   for j=1:100
       if (symbols_8psk(i)==0)
        allo5(j +(i-1)*100)=x2(j)*(9); 
       elseif (symbols_8psk(i)==45)
        allo5(j +(i-1)*100)=x4(j)*9; 
       elseif (symbols_8psk(i)==90)
        allo5(j +(i-1)*100)=x3(j)*9; 
       elseif (symbols_8psk(i)==135)
        allo5(j +(i-1)*100)=x5(j)*(9); 
        elseif (symbols_8psk(i)==180)
        allo5(j +(i-1)*100)=x2(j)*(-9); 
       elseif (symbols_8psk(i)==225)
        allo5(j +(i-1)*100)=x4(j)*(-9); 
         elseif (symbols_8psk(i)==270)
        allo5(j +(i-1)*100)=x3(j)*(-9); 
       elseif (symbols_8psk(i)==315)
        allo5(j +(i-1)*100)=x5(j)*(-9); 
       end
    end
end
%����� � ������� allo5 �������� ��� �� ������������ ���� ���� 8psk

t=0:1/100:8-1/100;
subplot(3,1,3);
plot(t,allo5);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('8-PSK Modulation');

%% 3o �������
%% �
mod = comm.QPSKModulator('SymbolMapping','Gray');
constellation(mod);
% ������������� �� ��������� ���������� �� ��� ��������� ������������.
%% b
for i=1:12
    if(symbols_qpsk(i)==45)
    needed_qpsk(i)=3;
    elseif(symbols_qpsk(i)==135)
    needed_qpsk(i)=2;
    elseif(symbols_qpsk(i)==225)
    needed_qpsk(i)=0;
    elseif(symbols_qpsk(i)==315)
    needed_qpsk(i)=1;
    end
end
c= [-9-9i 9-9i -9+9i 9+9i ];
modData1 = genqammod(needed_qpsk,c);
rxSig1 = awgn(modData1,8,'measured');
figure();
subplot(1,1,1);
h = scatterplot(rxSig1);
hold on;
scatterplot(c,[],[],'r*',h);
grid on;
hold off;
modData2 = genqammod(needed_qpsk,c);
rxSig2 = awgn(modData2,18,'measured');
figure();
subplot(1,1,1);
h = scatterplot(rxSig2);
hold on;
scatterplot(c,[],[],'r*',h);
grid on;
hold off;
%������������� �� ��������� ���������� ��� 5,15 dB �� ��� ������ �������.
%������� �� �� ������� ��������� ��� ���� ������� ���������.
%% �

dataIn=randi(2,1000000,1);
dataIn=dataIn-1;%1 ����������� ������ bits 0 ��� 1
M=4;
berEst = zeros(size(16));
for i=0:1:15
snrdB=3+i;

qpskModulator = comm.QPSKModulator('BitInput',true);
qpskDemodulator = comm.QPSKDemodulator('BitOutput',true);

channel = comm.AWGNChannel('EbNo',i,'BitsPerSymbol',2);
errorRate = comm.ErrorRate;
txSig= step(qpskModulator,dataIn);
% �������� ������  awgn ��� ����

rxSig = step(channel,txSig);
% Demodulate-������������� �� ��������� ����       

rxData = step(qpskDemodulator,rxSig);

% ��������� ��� ������ ��� error rate
errorStats = step(errorRate,dataIn,rxData);  
% the safe number of bits for the testing
numBits = 500000;

berEst(i+1) =  errorStats(1) ;% ��������� �� ber.
end

EbN0=0:1:15;
figure();
subplot(1,1,1);
plot(EbN0,berEst);
xlabel ('Eb/N0 (dB)');
ylabel ('P[error]');
title ('BER~Eb/N0');
xlim([0 17]);
ylim([0 0.08]);



