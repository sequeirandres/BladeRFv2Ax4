 (1) Seleccionar el dispositivo:

   device = bladeRF('*:serial=SERIAL_NUAND_BLADE_RF'); % Open device via first 3 serial # digits

 (2) paramtros para recibir 

   device.rx.frequency  = 433e6;
   device.rx.samplerate = 5e6;         // 2Msamples a 20 Msamples Maximo
   device.rx.bandwidth  = 2.5e6;
   device.rx.lna        = 'MAX';
   device.rx.vga1       = 30;
   device.rx.vga2       = 5;

 (3) parametros de stream. No cambiar mientras esta corriendo 

   device.rx.config.num_buffers   = 64;
   device.rx.config.buffer_size   = 16384;
   device.rx.config.num_transfers = 16;
   device.rx.timeout_ms           = 5000;
   
 (4) iniciar el modulo receptor

   device.rx.start();

 (5) Ejemplo para recivir 250 ms de muestras

  samples = device.receive(0.250 * device.rx.samplerate);

 (6) Detener el 'device', Borrar buffer y elimimar el dispositivo

  device.rx.stop();
  clear b;    // solo en matlab
    
% temperatura y consumo del device
fprintf('Temperatura [°C] : %f\n',Device.misc.temperature );
fprintf('Consumo [W] : %d\n',Device.misc.dc_power );

  
  


