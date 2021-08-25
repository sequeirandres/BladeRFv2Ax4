%%  clear plot
clear; close all; clc;


%% 


FREQ_CENTER = 98.3e6 ;
BW = 1e6 ; % 1MHz
SAMPLE_RATE = 5e6 ; %

% Select device
Device=bladeRF('*:serial=e20a37e47ade4fce943d324ae507236a') ;

% -- configuracion en frecuencias ---
Device.rx.frequency = FREQ_CENTER ;
Device.rx.samplerate = SAMPLE_RATE ;
Device.rx.bandwidth = BW ;
%Device.rx.lna = 0;   % ganancia general 0,3, 6
Device.rx.vga1 = 20;
%Device.rx.gain = 20 ;

%Device.rx.vga2 = 20; % chanel 2
% (3) set up sream parameters. These may noy be change, while the device is
% streaming.

Device.rx.config.num_buffers   = 64;
Device.rx.config.buffer_size   = 16384;
Device.rx.config.num_transfers = 16;
%Device.rx.timeout_ms = 5000;
 
% SELECCIONAL EL CHANAL RX1 O RX2 

Device.rx.channel = 'BLADERF_CHANNEL_RX1' ;
%Device.rx.channel = 'BLADERF_CHANNEL_RX2' ;


% (4) Start the module
disp('start Blade RF') ;
Device.rx.start() ;

% (5) Receive 0.250 seconds of sample
disp('Reciving ...')
samples = Device.receive(0.15*Device.rx.samplerate) ;

% (6) Cleanup and shutdown by stopping the RX stream and having MATLAB
%      delete the handle object.
disp('stop Blade RF') ;
Device.rx.stop() ;
%%clear Device ;

% (7) Plot data from steam  ..

% plot real part of complex samples

%time = 0:1:(length(real(samples))-1) ;
%time = time*1/SAMPLE_RATE ;

plot( real(samples) ,'k') ;
grid() ;
disp('len of sample :')
disp(length(samples)) ;

% ---- IMPRIMO EL CONSUMO Y LA TEMPERATURA -----
fprintf('Temperatura [°C] : %f\n',Device.misc.temperature );
fprintf('Consumo [W] : %d\n',Device.misc.dc_power );






















