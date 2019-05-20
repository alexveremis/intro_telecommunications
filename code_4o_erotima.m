clear all 
close all 
%% 4o erotima
%% i
Fs=44100;
[y,Fs] = audioread('C:\Users\Alex3\Desktop\ΤΗΛΕΠΙΚΟΙΝΩΝΙΕΣ\soundfile1_lab2.wav');
subplot(1,1,1);
plot(y);
xlabel ('t');
ylabel ('Amplitude');
title ('Waveform of soundfile1_lab2.wav signal ');
%% ii
%κβαντιστής
struct.mode = 'fixed'; 
struct.roundmode = 'ceil'; 
struct.overflowmode = 'saturate'; 
struct.format = [7 0]; 
q = quantizer(struct); 
u=quantize(q, y);
figure();
subplot (1,1,1);
stairs(u);
xlabel ('t (sec)');
ylabel ('Επίπεδα κβαντισμού (Gray Binary Coding)');
title ('Κβάντιση');



%% iii
symbols_qpsk=zeros(size(length(u)/2 +1));

j=1;
for i=1:2:length(u)-1
if (u(i)==1) && (u(i+1)==1)
    symbols_qpsk(j)=45;
elseif (u(i)==1) && (u(i+1)==0)
    symbols_qpsk(j)=315;
elseif (u(i)==0) && (u(i+1)==0)
    symbols_qpsk(j)=225;
else
    symbols_qpsk(j)=135;
end
j=j+1;
end

%% d

qpskModulator = comm.QPSKModulator;
qpskDemodulator = comm.QPSKDemodulator;
%παράγω θόρυβο awgn
channel4 = comm.AWGNChannel('EbNo',4,'BitsPerSymbol',2);
channel14 = comm.AWGNChannel('EbNo',14,'BitsPerSymbol',2);
txSig= step(qpskModulator,u);
% προσθέτω θόρυβο  awgn στο σήμα

rxSig4 = step(channel4,txSig);
rxSig14 = step(channel14,txSig);
%% e
% Demodulate το θορυβώδες σήμα       

rxData4 = step(qpskDemodulator,rxSig4);
rxData14 = step(qpskDemodulator,rxSig14);
%τα διάγραμματα των αστερισμών:

%constellationDiagram=comm.ConstellationDiagram;
%r1=step(constellationDiagram,rxData15);
c= [-1-1i 1-1i -1+1i 1+1i ];
modData1 = genqammod(rxData4,c);
h = scatterplot(modData1);
hold on
scatterplot(c,[],[],'r*',h)
grid
hold off
modData2 = genqammod(rxData14,c);
h = scatterplot(modData2);
hold on
scatterplot(c,[],[],'r*',h)
grid
hold off


%% prin to z
%υπολογισμός ber
errorRate = comm.ErrorRate;
errorStats = step(errorRate,u,rxData4); 
ber4=errorStats(1);
errorStats = step(errorRate,u,rxData14); 
ber14=errorStats(1);
display (ber4);
display (ber14);

%% z
audiowrite('newaudio4.wav',  rxData4, Fs,'BitsPerSample',8);
audiowrite('newaudio14.wav',  rxData14, Fs,'BitsPerSample',8);