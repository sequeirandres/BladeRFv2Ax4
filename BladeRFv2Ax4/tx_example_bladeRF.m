
%% rx example blade rf
%% author : sequer@ndres

%% ... clear plot ...
clear; close all; clc;

% -- parametros del device --

FREQ_CENTER = 104.3e6 ;
BW =10e3  ; % 1MHz
SAMPLE_RATE = 1e6 ; %
FTONE = 800 ;
NUM_SECOND = 10 ;  % time to tx
FS=SAMPLE_RATE ;   % freq of sampling
AMPLITUD = 1 ;
GAIN_dB= 60 ;
% buid a signal tone

omega = 2 * pi * FTONE;
time = 0 : 1/SAMPLE_RATE : NUM_SECOND ;
signal = AMPLITUD* sin(omega * time) ;

%plot(time(1:1000), real( signal(1:1000))) ;
%grid() ;
% Select device
Device=bladeRF('*:serial=SERIAL_BLADE_DEVICE') ;

% parameters frequency
Device.tx.frequency = FREQ_CENTER ;
Device.tx.samplerate = SAMPLE_RATE ;
Device.tx.bandwidth = BW ;

% confgig potencia 
%Device.tx.vga1 = 10;
Device.tx.gain = GAIN_dB ;
%Device.tx.vga1 = -20;

% Device buffers
Device.tx.config.num_buffers = 64;
Device.tx.config.buffer_size = 16384;
Device.tx.config.num_transfers = 16;

disp('parameters .. done') ;

% -- set channel 1 or 2 ----

%Device.tx.channel = 'BLADERF_CHANNEL_TX1' ;
Device.tx.channel = 'BLADERF_CHANNEL_TX2' ;

% init tx ...
Device.tx.start() ; %% init transmit ..
disp('tx init ') ;

%  ---- single burst ---

Device.transmit(signal, 20*NUM_SECOND, 0, true, true);


plot(time(1:4000), real( signal(1:4000)),'linewidth',2.0) ;
ylim([-AMPLITUD*1.1,AMPLITUD*1.1]);
grid();

% --- Stop transmit --- 

Device.tx.stop() ;
disp('Tx stop ') ;

% ---- IMPRIMO EL CONSUMO Y LA TEMPERATURA -----
fprintf('Temperatura [°C] : %f\n',Device.misc.temperature );
fprintf('Consumo [W] : %d\n',Device.misc.dc_power );





