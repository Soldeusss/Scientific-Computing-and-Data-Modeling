clear
clc
% 
t = (0:60*250)/250;
x = sin(2*pi*20*t);
figure(1);
plot(t(1:250),x(1:250));
ylabel('Power/frequency(dB/Hz)')
xlabel('Frequency(Hz)')
title('20 Hz Pure Wave')
% Question 1: I see 20 periods, seems to be consistent. (1/250) s/sample * 250 = 1 second
figure(2)
pmtm(x, 5, [], 250);
figure(3)


% Question 2: The value at 20 Hz is at 5.1 dB/Hz, the value at 60hz is about  -177 hz. It is 1.7 *10^18 smaller

mtspecgram(x, 250, 40, 4);
figure(4);
% 
audio1 = audioplayer(x, 1000);
play(audio1);
% question 3: it plays for 15 seconds, not 60. Its consistent when you factor in sampling rate difference

audio2 = audioplayer(x, 2000);
play(audio2);

audio3 = audioplayer(x, 4000);
play(audio3);

audio4 = audioplayer(x, 8000);
play(audio4);

f = 10 + 10*exp(-t/60);
y = sin(2*pi*f.*t);
pmtm(f, 5, [], 250);
figure(5);
mtspecgram(f, 250, 40, 4);
% question 4: difference is that the varying frequency signal had more power at 1 hz, whereas the 20Hz pure tone had more power at 20 Hz
% 
% 
violin_sample = audioread('violin.wav');
audio04 = audioplayer(violin_sample, 32000);
play(audio04);
figure(6);
pmtm(violin_sample, 5, [], 32000);
figure(7);
mtspecgram(violin_sample, 32000, 8000, .04);
% question 6: the spectrogram shows the frequency at each second. The violin is playing multiple frequencies at the same time.
% 
% 
speech_sample = audioread('speech.wav');
audio5 = audioplayer(speech_sample, 16000);
play(audio5);
figure(8);
pmtm(speech_sample, 5, [], 16000);
figure(9);
mtspecgram(speech_sample, 16000, 8000, .04);
% question 7: The speech spectogram showed that the voice frequency changed more fluidly whereas the violin frequencies changed more abruptly.


load bat.mat
figure(10); % question 8
%question 9: from the graph in temporal spectrum it seems that the range
%that is significant is from 95 to 400 hz
plot(bat_chirp)
figure(11);
mtspecgram(bat_chirp, 143000, 71500, .00035); %question 10
% 
% question 11: the bat's chirp is at a higher pitch. it sweeps a wider range
% 
batchirp= audioplayer(bat_chirp, 1430);
play(batchirp)