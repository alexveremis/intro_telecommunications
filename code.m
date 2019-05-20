clear all 
close all 

%%% ������� �������: 03115063

%1o �������
%�
%(i)
A=2; %������ �� V
fm=9000; %��������� �� Hz
T=1/fm; %�������� �� sec
fs1=20*fm; %��������� �������������� fs1
Ts1 = 1/fs1;%�������� ��������������
t1=0:Ts1:4*T; %������� ���������� ��� 4 ��������� �� fs1 ���������
%��������������
d=0:T:3*T;
y1=4*pulstran(t1-0.5*T,d,'tripuls',T)-2; %���������������� ��� ��������� ��������� ����� 
subplot(4,1,1); %��� �� ����������� �� �����������
plot(t1,y1,'.');
stem(t1,y1);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('fs1 = 20fm');
grid on;
%(ii)
fs2=80*fm;
Ts2=1/fs2;
t2=0:Ts2:4*T; %������� ���������� ��� 4 ��������� �� fs1 ���������
%��������������
y2=4*pulstran(t2-0.5*T,d,'tripuls',T)-2;
subplot(4,1,2);
plot(t2,y2,'.');
stem(t2,y2);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('fs2 = 80fm');
grid on;
%% (iii)
subplot (4,1,3);
plot(t1,y1,'.');
hold on; 
plot(t2,y2,'o');
grid on;
xlabel ('t (sec)');
ylabel ('A (V)');
title ('y1 �� fs1, y2 �� fs2');
legend ('y1','y2');
hold off;
%% �
fs3=5*fm;
Ts3=1/fs3;
t3=0:Ts3:4*T; %������� ���������� ��� 4 ��������� �� fs1 ���������
%��������������
y3=4*pulstran(t3-0.5*T,d,'tripuls',T)-2;
subplot(4,1,4);
plot(t3,y3,'.');
stem(t3,y3);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('fs3 = 5fm');
grid on;
%% �
%(i)--a(i)
A=1; %������ �� V
fm=9000; %��������� �� Hz
T=1/fm; %�������� �� sec
fs1=20*fm; %��������� �������������� fs1
Ts1 = 1/fs1;
t1=0:Ts1:4*T; %������� ���������� ��� 4 ��������� �� fs1 ���������
%��������������
z1= A* sin(2*pi*9000*t1);
figure ();
subplot(4,1,1);
plot(t1,z1,'.');
stem(t1,z1);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('fs1 = 20fm');
grid on;
%(ii)
fs2=80*fm;
Ts2 = 1/fs2;
t2=0:Ts2:4*T; %������� ���������� ��� 4 ��������� �� fs1 ���������
%��������������
z2= A* sin(2*pi*9000*t2);
subplot(4,1,2);
plot(t2,z2,'.');
stem(t2,z2);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('fs2 = 80fm');
grid on;
%(iii)
subplot (4,1,3);
plot(t1,z1,'.');
hold on; 
plot(t2,z2,'o');
grid on;
xlabel ('t (sec)');
ylabel ('A (V)');
title ('z1 �� fs1, z2 �� fs2');
legend ('z1','z2');
hold off;
%b
fs3=5*fm;
Ts3 = 1/fs3;
t3=0:Ts3:4*T; %������� ���������� ��� 4 ��������� �� fs1 ���������
%��������������
z3= A* sin(2*pi*9000*t3);
subplot(4,1,4);
plot(t3,z3,'.');
stem(t3,z3);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('fs3 = 5fm');
grid on;
%� (ii)--(a(i))
A=1;
fm=9000;
T=1/fm;
L=1000;
fs1=20*fm;
Tq1=1/fs1;
tmax=2/(2*fm + L); %������� ���������� ��� 1 �������
%tmax ��������� ��� ������� ���� �������
tq1=0:Tq1:tmax;
q1 = A*sin(2*pi*fm * tq1)+ A*sin(2*pi*(fm+L)*tq1); %���� ���� �� ������������� �� fs1=20fm
figure ();
subplot(4,1,1);
plot(tq1,q1,'.');
stem(tq1,q1);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('fs1 = 20fm');
grid on;
%(a(ii))
fs2=80*fm;
Tq2=1/fs2;
tq2=0:Tq2:tmax;
q2 = A*sin(2*pi*fm * tq2)+ A*sin(2*pi*(fm+L)*tq2); %���� ���� �� ������������� �� fs2=80fm
subplot(4,1,2);
plot(tq2,q2,'.');
stem(tq2,q2);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('fs2 = 80fm');
grid on;
%(a(iii))
subplot (4,1,3);
plot(tq1,q1,'.');
hold on; 
plot(tq2,q2,'o');
grid on;
xlabel ('t (sec)');
ylabel ('A (V)');
title ('q1 �� fs1, q2 �� fs2');
legend ('q1','q2');
hold off;
%� --(b)
fs3=5*fm;
Tq3=1/fs3;
tq3=0:Tq3:tmax;
q3 = A*sin(2*pi*fm * tq3)+ A*sin(2*pi*(fm+L)*tq3); %���� ���� �� ������������� �� fs3=5fm
subplot(4,1,4);
plot(tq3,q3,'.');
stem(tq3,q3);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('fs3 = 5fm');
grid on;

%% 2o �������
%a
fm=9000;
fs1=40*fm;
T=1/fm;
Ts1 = 1/fs1;%�������� ��������������
t1=0:Ts1:4*T;
d=0:T:3*T;
y1=4*pulstran(t1-0.5*T,d,'tripuls',T)-2;
n=6; %������� bits ���� ���� �.�. � fm ������� ������� (9kHz)
d=(2*2)/(2^n-1); %���� ���������
xq=d*floor(y1/d)+d/2; %������� mid-riser ���������
figure();
subplot (2,1,1);
plot(t1,xq,'o');
xlabel ('t (sec)');
ylabel ('������� ���������� (Gray Binary Coding)');
title ('��������');
xlim([0 4*T]);
z = 0:1:2^n - 1;
zbin=dec2bin(z,n); %��������� ��� ������� ��� 0 ��� 2^n - 1 �� ���� 1 �� ��������� ��� n bits 
set(gca,'YTick',-2:d:2); %�������� ��� ����������� [-1,1] �� ������� ���������� �� ���� �� ���� d
set(gca,'YTickLabel',zbin); %���������� ��� �������� ���������� ���� ���������� ����� �� �������� �������
%b
%i)
quant_error=xq-y1; %����������� ��������� ���������
quant_error10=quant_error(1:10); %������� ��������� ��������� 10 ������ ���������
variance10=var(quant_error10); %����������� ����������� ��������� ��������� ��� �� 10 ����� ��������
s10=sqrt(variance10); %����������� ������� ��������� ��� ��������� ��������� ��� �� 10 ����� ��������
display (s10);
%ii)
quant_error20=quant_error(1:20); %������� ��������� ��������� 20 ������ ���������
variance20=var(quant_error20); %����������� ����������� ��������� ��������� ��� �� 20 ����� ��������
s20=sqrt(variance20); %����������� ������� ��������� ��� ��������� ��������� ��� �� 20 ����� ��������
display (s20);
%iii)
sig10=y1(1:10);  %������� 10 ������ ��������� �������
sig20=y1(1:20);  %������� 20 ������ ��������� �������
variancesig10=var(sig10); %����������� ����������� ������� ��� �� 10 ����� ��������
r1=variancesig10/variance10; %����������� SNR ��������� ��� �� 10 ����� ��������
SNR1=10*log10(r1);  %SNR1 �� decibel
display (SNR1);
variancesig20=var(sig20);  %����������� ����������� ������� ��� �� 20 ����� ��������
r2=variancesig20/variance20; %����������� SNR ��������� ��� �� 20 ����� ��������
SNR2=10*log10(r2);  %SNR2 �� decibel
display (SNR2);

%�
for i=1:1:length(xq/4) %������������ ��������� ��� ������� ���������� .��������� �� 4 ����� ������� ���� 1 ������� ��� ��� 4.
s=-1:d:1; %������� ���������� (��������)
for j=1:1:length(s)
    if (s(j)-(d/2))<xq(i) && xq(i)<(s(j)+(d/2))
        k(i)=j-1;
    end
end
end

kbin=dec2bin(k,n); %������� �� ������ ������� ��� �� length(xq/4) ��� ������ ������ ��� �� n(bits), ��� �������� ��� ������������ �������� - ���������

kbin2=transpose(kbin);
stream=transpose(kbin2(:)); %��� ��������� ��� bits, ��. [1 0 0 1 0 1 1 1 1 1 0 0 ...]
    
%% set volt
for i=1:1:length(stream)
if stream(i)=='1'
    pulse(i)=9;
elseif stream(i)=='0'
    pulse(i)=-9;
end
end

%% set time
step=0.001; %�������� bit �� sec .���� bit ������� 1 msec
t2=0:step:length(pulse)*step;
l=length(pulse);
pulse(l+1)=-9;
subplot(2,1,2);
stairs(t2,pulse);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('Bit stream (POLAR NRZ)');
xlim([0 ((length(pulse)*step)-step)]);
ylim([-9.5 9.5]);

%3o �������
%a
figure ();
A=1;
fm=9000;
T=1/fm;
fs2=110*fm;
Ts2=1/fs2;
Tm=1/35; %4 �������� ��� ������� ����������� m(t)
t = 0: Ts2 : 4*Tm; %������ ����������� (sec)
m = sin(2*pi*35*t); %���� �����������
z=sin(2*pi*9000*t);%����� ����
ka = 0.5; %������� �����������
s = (1 + ka*m).* z; %������������ ���� AM ����, ���� �=1
subplot(3,1,1);
plot (t, s);
grid on;
xlabel ('t (sec)');
ylabel ('A (V)');
title ('������������ AM ����');
%b
%% ������� �������������
Vc(1) = 0; %������ ���� �������
for i = 2:length(s)
 if s(i) > Vc(i-1) %� ������ ����
 Vc(i) = s(i);
 else %� ������ ��� ����
 Vc(i) = Vc(i-1) - 0.023*Vc(i-1);
 end
end
subplot(3,1,2);
plot (t, Vc);
grid on;
xlabel ('t (sec)');
ylabel ('A (V)');
title ('������ ������ �������������');

%% ���������� ������
Vc=Vc-mean(Vc); %�������� DC ����������
wn=(2/fs2)*35; %��������� �������� ��� ����������� �������
b=fir1(200,wn,'low');
y=filter(b,0.2649,Vc);
subplot(3,1,3);
plot(t,y);
grid on;
xlabel ('t (sec)');
ylabel ('A (V)');
title ('��������������� ����');