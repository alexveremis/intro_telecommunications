clear all 
close all 

%% d
%% i)
A=fopen('C:\Users\Alex3\Desktop\ΤΗΛΕΠΙΚΟΙΝΩΝΙΕΣ\christmas_carol_odd.txt','r');
binV=fscanf(A,'%c');
fclose(A); %διαβάζουμε το κατάλληλο αρχείο κειμένου
%binV= reshape(dec2bin('C:\Users\Alex3\Desktop\ΤΗΛΕΠΙΚΟΙΝΩΝΙΕΣ\christmas_carol_odd.txt', 8).'-'0',1,[]);
%binS = dec2bin('C:\Users\Alex3\Desktop\ΤΗΛΕΠΙΚΟΙΝΩΝΙΕΣ\christmas_carol_odd.txt',8);
%binS = binS';
%binS = binS(:)';
%binV = binS-48;
binV = reshape(dec2bin(binV, 8).'-'0',1,[]); %το μετατρέπουμε σε binary για να μπορούμε να το διαμορφώνουμε(αντίστοιχη εντολη της binascii-Python)
takeastext2=binV; 
B= dec2bin(binV, 8);
%% iii)
symbols_qpsk=zeros(size(length(takeastext2)/2));
allo4=zeros(size(100*length(takeastext2)/2));
fc=2; %fc=2Hz αφού Α περιττό.

j=1;
for i=1:2:length(takeastext2)
if (takeastext2(i)==1) && (takeastext2(i+1)==1)
    symbols_qpsk(j)=45;
elseif (takeastext2(i)==1) && (takeastext2(i+1)==0)
    symbols_qpsk(j)=315;
elseif (takeastext2(i)==0) && (takeastext2(i+1)==0)
    symbols_qpsk(j)=225;
else
    symbols_qpsk(j)=135;
end
j=j+1;
end
t=0:1/100: 1-1/100;
x2=cos(4*pi*fc*t);
x3=sin(4*pi*fc*t);
x4=cos(4*pi*fc*t + pi/4);
x5=sin(4*pi*fc*t + pi/4);


for i=1:length(takeastext2)/2
   for j=1:100
       if (symbols_qpsk(i)==45)
        allo4(j +(i-1)*100)=x2(j)*(-1); 
       elseif (symbols_qpsk(i)==135)
        allo4(j +(i-1)*100)=x3(j)*1; 
       elseif (symbols_qpsk(i)==225)
        allo4(j +(i-1)*100)=x2(j)*1; 
       elseif (symbols_qpsk(i)==315)
        allo4(j +(i-1)*100)=x3(j)*(-1); 
       end
    end
end
t=0:1/100:length(takeastext2)/2-1/100;
subplot(1,1,1);
plot(t,allo4);
xlabel ('t (sec)');
ylabel ('A (V)');
title ('QPSK Modulation');
%όμοια διαδικασία με προηγούμενο ερώτημα.
%% iv
%παράγουμε θόρυβο awgn και τον προσθετουμε στο σήμα  για δύο τιμές Eb/N0, 5 και 15dB
qpskModulator = comm.QPSKModulator;
qpskDemodulator = comm.QPSKDemodulator;

channel5 = comm.AWGNChannel('EbNo',5,'BitsPerSymbol',2);
channel15 = comm.AWGNChannel('EbNo',15,'BitsPerSymbol',2);%bits per symbol =2 λόγω qpsk modulator
txSig= step(qpskModulator,takeastext2');
% προσθέτω θόρυβο  awgn στο σήμα

rxSig5 = step(channel5,txSig);
rxSig15 = step(channel15,txSig);

%% v)
% Demodulate το θορυβώδες σήμα       

rxData5 = step(qpskDemodulator,rxSig5);
rxData15 = step(qpskDemodulator,rxSig15);
%τα διάγραμματα των αστερισμών:

%constellationDiagram=comm.ConstellationDiagram;
%r1=step(constellationDiagram,rxData15);
c= [-1-1i 1-1i -1+1i 1+1i ];
modData1 = genqammod(rxData5,c);
h = scatterplot(modData1);
hold on
scatterplot(c,[],[],'r*',h)
grid
hold off
modData2 = genqammod(rxData15,c);
h = scatterplot(modData2);
hold on
scatterplot(c,[],[],'r*',h)
grid
hold off

%% vi
errorRate = comm.ErrorRate;
errorStats = step(errorRate,takeastext2',rxData5); 
ber5=errorStats(1);
errorStats = step(errorRate,takeastext2',rxData15); 
ber15=errorStats(1);
display (ber5);
display (ber15);
%υπολογίζουμε  ber και το δείχνουμε στην οθόνη.
%% vii
%οπου υπάρχει 2 ή 3 βάζουμε μηδενικά ώστε να μπορέσει να γίνει η μετατροπή
%απο binary.Tα 2 και τα 3 τα προσέθεσε ο θόρυβος που βάλαμε
for i=1:length(rxData5)
   if(rxData5(i)~=0)&&(rxData5(i)~=1)
       rxData5(i)=0;
   end
end
for i=1:length(rxData5)
   if(rxData15(i)~=0)&&(rxData15(i)~=1)
       rxData15(i)=0;
   end
end

str5 = char(bin2dec(reshape(char(rxData5+'0'), 8,[]).'))';
str15 = char(bin2dec(reshape(char(rxData15+'0'), 8,[]).'))';
%μετατροπή απο binary se decimal και απο κει σε χαρακτήρες
%έπειτα εγγραφή σε αρχείο κειμένου .txt
AA = fopen('newtext5.txt','w');
fprintf(AA,'%s',str5);
fclose(AA);
AA = fopen('newtext15.txt','w');
fprintf(AA,'%c',str15);
fclose(AA);