clear 
clc


%% part 1
my_data = csvread('Data.csv', 1, 2);
plot(my_data(:,7));
figure(1);

%% part 2
%Question 1
load anesthesia.mat;
x= anesth_data;
t = (0:(length(anesth_data)-1))/250;
 plot(t,x);
xlabel('Time(s)');
ylabel('Data');
title('Data vs Time')
%  question 2 After about 1900 seconds there seems to be sudden changes in the amplitude.
% the points are: 2107.58  and 2379.28 seconds

%question 3: On the spectrogram when you zoom in to the previously
%identified points, there seems to be similar spikes at the same regions(also yellow indicating it has more magnitude
figure(2)
mtspecgram(x, 250, 0:40, 2);
xlabel('Time(s)');
ylabel('Frequency(Hz)');
title('Frequency vs Time')
% Question 4: Brain activity seems to slow down as the person is trying to sleep in the first segment. 
% Then brain activity is minimal as they lose conciousness when they're asleep in the second segment.
% In the third segment brain activity spikes as they are waking up

% audio = audioplayer(x, 2500);
% play(audio);
% Question 5

%Delta
PreD= bandpower(250, anesth_data(1:250*500), [0.1 4]);
UnConD= bandpower(250, anesth_data(250*500:250*1750), [0.1 4]);
AfterD= bandpower(250, anesth_data(250*1750:end), [0.1 4]);
% %Theta
PreTh= bandpower(250, anesth_data(1:250*500), [4 7])
UnconTh= bandpower(250, anesth_data(250*500:250*1750), [4 7])
AfterTh= bandpower(250, anesth_data(250*1750:end), [4 7])
% Alpha
PreAlpha= bandpower(250, anesth_data(1:250*500), [8 15])
UnconAlpha= bandpower(250, anesth_data(250*500:250*1750), [8 15])
AfterAlpha= bandpower(250, anesth_data(250*1750:end), [8 15])
% Beta
PreBeta= bandpower(250, anesth_data(1:250*500), [16 31])
UnconBeta= bandpower(250, anesth_data(250*500:250*1750), [16 31])
AfterBeta= bandpower(250, anesth_data(250*1750:end), [16 31])
% Gamma
PreGam= bandpower(250, anesth_data(1:250*500), [32 62])
UnconGam= bandpower(250, anesth_data(250*500:250*1750), [32 62])
AfterGam= bandpower(250, anesth_data(250*1750:end), [32 62])

%Question 6 : Alpha band specifies the state of anesthesia. The band power is lower after the operation. 

%% part 3
load sleep.mat;
L = sleep_data;
t = (0:(length(sleep_data)-1))/250;
figure(3);
plot(t,L);
xlabel('Time(s)');
ylabel('Data');
title('Sleep Data vs Time')
%Question 7 : It seems like there is a lot of brain activity while sleeping

%% Question 8: There seems to be a spike in activity at 65 and 245 seconds, so yes
figure(4)
plot(t,L)
xlabel('Time(s)');
ylabel('Data');
title('Sleep Data vs Time')
xlim([60 70]);

figure(5)
plot(t,L)
xlabel('Time(s)');
ylabel('Data');
title('Sleep Data vs Time')
xlim([240 250])

%% Question 9:

figure(6)
mtspecgram(L, 250, 0:40, 2);
title('Frequency vs Time')

figure(7) % Zoomed in spectrogram
mtspecgram(L, 250, 0:40, 2);
title('Frequency vs Time')
xlim([46 46.2])
ylim([0 4])

%% Question 10 : Delta, Alpha and Theta bands are present during deep sleep.
% audio = audioplayer(L, 2500);
% play(audio);

%% Question 11
% Delta

UnConD1= bandpower(250, sleep_data(), [0.1 4]);

% %Theta
UnconTh1= bandpower(250, sleep_data(), [4 7])

% %Alpha
UnconAlpha1= bandpower(250, sleep_data(), [8 15])

% %Beta

UnconBeta1= bandpower(250, sleep_data(), [16 31])

% %Gamma

UnconGam1= bandpower(250, sleep_data(), [32 62])

%question 12: Look at the values for both anesthesia and regular sleep data
%and compare the numbers

%% Part 4
eyes= csvread("Eyes open eyes closed.csv",1,2);
% question 13 there seems to be spikes at certain times
O1= eyes(:,7);
P8= eyes(:,9);
F3= eyes(:,3);
FC= eyes(:,4);
t = (0:(length(eyes(:,7))-1))/128;
figure(7)
plot(t, O1);
xlabel('Time(s)');
ylabel('Data');
title('Data vs Time')
figure(8)
plot(t,P8);
xlabel('Time(s)');
ylabel('Data');
title('Data vs Time')
figure(9)
plot(t, F3);
xlabel('Time(s)');
ylabel('Data');
title('Data vs Time')
figure(10)
plot(t,FC);
xlabel('Time(s)');
ylabel('Data');
title('Data vs Time')

figure(11)
subplot(4,1,1); hold on; pmtm(eyes(:,7),5,[],128);

subplot(4,1,2); hold on; pmtm(eyes(:,9),5,[],128);

subplot(4,1,3); hold on; pmtm(eyes(:,3),5,[],128);

subplot(4,1,4); hold on; pmtm(eyes(:,4),5,[],128);

figure(12)
mtspecgram(eyes(:,7), 128, 0:40, 2);
title('Frequency vs Time')
figure(13)
mtspecgram(eyes(:,9), 128, 0:40, 2);
title('Frequency vs Time')
figure(14)
mtspecgram(eyes(:,3), 128, 0:40, 2);
title('Frequency vs Time')
figure(15)
mtspecgram(eyes(:,4), 128, 0:40, 2);
title('Frequency vs Time')

%% question 14 seems like at ten hz there is a spike in all the graphs
rms= rms(my_data(:,7))

%% Question 15 it would take up to 45,000 people
power = ((rms^2)/20000) * 1e-6

%% Post LAb
ryan = csvread("Ryan_Eyes_Open_And_Closed.csv",1,2);

%% Question 1: when the eyes are closed, the alpha bands start spiking
figure(16)
mtspecgram(ryan(:,7), 128, 40, 2);
title('Frequency vs Time')
figure(17)
mtspecgram(ryan(:,8), 128, 40, 2);
title('Frequency vs Time')

%% question 2
% eyes open
bandpower(250, ryan(1:20*128, 7), [8 15])
bandpower(250, ryan(1:20*128, 8), [8 15])
% eyes close
bandpower(250, ryan(20*128:40*128, 7), [8 15])
bandpower(250, ryan(20*128:40*128, 8), [8 15])
% eyes open
bandpower(250, ryan(40*128:60*128, 7), [8 15])
bandpower(250, ryan(40*128:60*128, 8), [8 15])
% eyes closed
bandpower(250, ryan(60*128:80*128, 7), [8 15])
bandpower(250, ryan(60*128:80*128, 8), [8 15])

%% Question 3: eyes open uses more power compared to eyes closed






