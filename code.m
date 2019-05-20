clear all 
close all 

%%% Αριθμός Μητρώου: 03115063

%1o ερώτημα
%α
%(i)
A=2; %πλάτος σε V
fm=9000; %συχνότητα σε Hz
T=1/fm; %περίοδος σε sec
fs1=20*fm; %συχνότητα δειγματοληψίας fs1
Ts1 = 1/fs1;%περίοδος δειγματοληψίας
t1=0:Ts1:4*T; %θέλουμε παρουσίαση για 4 περιόδους με fs1 συχνότητα
%δειγματοληψίας
d=0:T:3*T;
y1=4*pulstran(t1-0.5*T,d,'tripuls',T)-2; %δειγματοληπτούμε τον τριγωνικό περιοδικό παλμό 
subplot(4,1,1); %για να εμφανίσουμε τα διαγραμματα
plot(t1,y1,'.');
stem(t1,y1);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('fs1 = 20fm');
grid on;
%(ii)
fs2=80*fm;
Ts2=1/fs2;
t2=0:Ts2:4*T; %θέλουμε παρουσίαση για 4 περιόδους με fs1 συχνότητα
%δειγματοληψίας
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
title ('y1 με fs1, y2 με fs2');
legend ('y1','y2');
hold off;
%% β
fs3=5*fm;
Ts3=1/fs3;
t3=0:Ts3:4*T; %θέλουμε παρουσίαση για 4 περιόδους με fs1 συχνότητα
%δειγματοληψίας
y3=4*pulstran(t3-0.5*T,d,'tripuls',T)-2;
subplot(4,1,4);
plot(t3,y3,'.');
stem(t3,y3);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('fs3 = 5fm');
grid on;
%% γ
%(i)--a(i)
A=1; %πλάτος σε V
fm=9000; %συχνότητα σε Hz
T=1/fm; %περίοδος σε sec
fs1=20*fm; %συχνότητα δειγματοληψίας fs1
Ts1 = 1/fs1;
t1=0:Ts1:4*T; %θέλουμε παρουσίαση για 4 περιόδους με fs1 συχνότητα
%δειγματοληψίας
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
t2=0:Ts2:4*T; %θέλουμε παρουσίαση για 4 περιόδους με fs1 συχνότητα
%δειγματοληψίας
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
title ('z1 με fs1, z2 με fs2');
legend ('z1','z2');
hold off;
%b
fs3=5*fm;
Ts3 = 1/fs3;
t3=0:Ts3:4*T; %θέλουμε παρουσίαση για 4 περιόδους με fs1 συχνότητα
%δειγματοληψίας
z3= A* sin(2*pi*9000*t3);
subplot(4,1,4);
plot(t3,z3,'.');
stem(t3,z3);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('fs3 = 5fm');
grid on;
%γ (ii)--(a(i))
A=1;
fm=9000;
T=1/fm;
L=1000;
fs1=20*fm;
Tq1=1/fs1;
tmax=2/(2*fm + L); %θέλουμε παρουσίαση για 1 περίοδο
%tmax εξηγείται πως βρέθηκε στην αναφορά
tq1=0:Tq1:tmax;
q1 = A*sin(2*pi*fm * tq1)+ A*sin(2*pi*(fm+L)*tq1); %σήμα μετά τη δειγματοληψία με fs1=20fm
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
q2 = A*sin(2*pi*fm * tq2)+ A*sin(2*pi*(fm+L)*tq2); %σήμα μετά τη δειγματοληψία με fs2=80fm
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
title ('q1 με fs1, q2 με fs2');
legend ('q1','q2');
hold off;
%γ --(b)
fs3=5*fm;
Tq3=1/fs3;
tq3=0:Tq3:tmax;
q3 = A*sin(2*pi*fm * tq3)+ A*sin(2*pi*(fm+L)*tq3); %σήμα μετά τη δειγματοληψία με fs3=5fm
subplot(4,1,4);
plot(tq3,q3,'.');
stem(tq3,q3);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('fs3 = 5fm');
grid on;

%% 2o ερώτημα
%a
fm=9000;
fs1=40*fm;
T=1/fm;
Ts1 = 1/fs1;%περίοδος δειγματοληψίας
t1=0:Ts1:4*T;
d=0:T:3*T;
y1=4*pulstran(t1-0.5*T,d,'tripuls',T)-2;
n=6; %αριθμός bits αφού λόγω Α.Μ. η fm βγαίνει περιττή (9kHz)
d=(2*2)/(2^n-1); %βήμα κβαντιστή
xq=d*floor(y1/d)+d/2; %εξίσωση mid-riser κβαντιστή
figure();
subplot (2,1,1);
plot(t1,xq,'o');
xlabel ('t (sec)');
ylabel ('Επίπεδα κβαντισμού (Gray Binary Coding)');
title ('Κβάντιση');
xlim([0 4*T]);
z = 0:1:2^n - 1;
zbin=dec2bin(z,n); %μετατροπή των αριθμών από 0 έως 2^n - 1 με βήμα 1 σε δυαδικούς των n bits 
set(gca,'YTick',-2:d:2); %χωρισμός του διαστήματος [-1,1] σε επίπεδα κβαντισμού με βάση το βήμα d
set(gca,'YTickLabel',zbin); %απεικόνιση των επιπέδων κβαντισμού στον κατακόρυφο άξονα ως δυαδικός αριθμός
%b
%i)
quant_error=xq-y1; %υπολογισμός σφάλματος κβάντισης
quant_error10=quant_error(1:10); %επιλογή σφαλμάτων κβάντισης 10 πρώτων δειγμάτων
variance10=var(quant_error10); %υπολογισμός διακύμανσης σφάλματος κβάντισης για τα 10 πρώτα δείγματα
s10=sqrt(variance10); %υπολογισμός τυπικής απόκλισης του σφάλματος κβάντισης για τα 10 πρώτα δείγματα
display (s10);
%ii)
quant_error20=quant_error(1:20); %επιλογή σφαλμάτων κβάντισης 20 πρώτων δειγμάτων
variance20=var(quant_error20); %υπολογισμός διακύμανσης σφάλματος κβάντισης για τα 20 πρώτα δείγματα
s20=sqrt(variance20); %υπολογισμός τυπικής απόκλισης του σφάλματος κβάντισης για τα 20 πρώτα δείγματα
display (s20);
%iii)
sig10=y1(1:10);  %επιλογή 10 πρώτων δειγμάτων σήματος
sig20=y1(1:20);  %επιλογή 20 πρώτων δειγμάτων σήματος
variancesig10=var(sig10); %υπολογισμός διακύμανσης σήματος για τα 10 πρώτα δείγματα
r1=variancesig10/variance10; %υπολογισμός SNR κβάντισης για τα 10 πρώτα δείγματα
SNR1=10*log10(r1);  %SNR1 σε decibel
display (SNR1);
variancesig20=var(sig20);  %υπολογισμός διακύμανσης σήματος για τα 20 πρώτα δείγματα
r2=variancesig20/variance20; %υπολογισμός SNR κβάντισης για τα 20 πρώτα δείγματα
SNR2=10*log10(r2);  %SNR2 σε decibel
display (SNR2);

%γ
for i=1:1:length(xq/4) %αντιστοίχηση δειγμάτων στα επίπεδα κβαντισμού .Διαιρούμε με 4 γιατί θέλουμε μόνο 1 περίοδο και όχι 4.
s=-1:d:1; %επίπεδα κβαντισμού (δεκαδικό)
for j=1:1:length(s)
    if (s(j)-(d/2))<xq(i) && xq(i)<(s(j)+(d/2))
        k(i)=j-1;
    end
end
end

kbin=dec2bin(k,n); %πίνακας με αριθμό γραμμών ίσο με length(xq/4) και αριθμό στηλών ίσο με n(bits), που περιέχει την αντιστοίχιση επιπέδων - δειγμάτων

kbin2=transpose(kbin);
stream=transpose(kbin2(:)); %ροή μετάδοσης από bits, πχ. [1 0 0 1 0 1 1 1 1 1 0 0 ...]
    
%% set volt
for i=1:1:length(stream)
if stream(i)=='1'
    pulse(i)=9;
elseif stream(i)=='0'
    pulse(i)=-9;
end
end

%% set time
step=0.001; %διάρκεια bit σε sec .Κάθε bit διαρκεί 1 msec
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

%3o ερώτημα
%a
figure ();
A=1;
fm=9000;
T=1/fm;
fs2=110*fm;
Ts2=1/fs2;
Tm=1/35; %4 περίοδοι του σήματος πληροφορίας m(t)
t = 0: Ts2 : 4*Tm; %χρόνος παρατήρησης (sec)
m = sin(2*pi*35*t); %σήμα πληροφορίας
z=sin(2*pi*9000*t);%φερόν σήμα
ka = 0.5; %δείκτης διαμόρφωσης
s = (1 + ka*m).* z; %διαμορφωμένο κατά AM σήμα, αφού Α=1
subplot(3,1,1);
plot (t, s);
grid on;
xlabel ('t (sec)');
ylabel ('A (V)');
title ('Διαμορφωμένο AM σήμα');
%b
%% Φωρατής Περιβάλλουσας
Vc(1) = 0; %αρχική τάση πυκνωτή
for i = 2:length(s)
 if s(i) > Vc(i-1) %η δίοδος άγει
 Vc(i) = s(i);
 else %η δίοδος δεν άγει
 Vc(i) = Vc(i-1) - 0.023*Vc(i-1);
 end
end
subplot(3,1,2);
plot (t, Vc);
grid on;
xlabel ('t (sec)');
ylabel ('A (V)');
title ('Έξοδος φωρατή περιβάλλουσας');

%% Βαθυπερατό φίλτρο
Vc=Vc-mean(Vc); %αφαίρεση DC συνιστώσας
wn=(2/fs2)*35; %συχνότητα αποκοπής του βαθυπερατού φίλτρου
b=fir1(200,wn,'low');
y=filter(b,0.2649,Vc);
subplot(3,1,3);
plot(t,y);
grid on;
xlabel ('t (sec)');
ylabel ('A (V)');
title ('Αποδιαμορφωμένο σήμα');