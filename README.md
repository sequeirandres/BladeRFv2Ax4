## NUAND BladeRF 
![image](BladeRFv2Ax4/bladerfv2ax4_1.jpg)

## Documentacion util:
- [Blade rf v2](https://www.nuand.com/bladerf-2-0-micro/)
- [gitHub Nuand Blade](https://github.com/Nuand/bladeRF)
- [bladeRF Product Brief](https://www.nuand.com/bladeRF-brief.pdf)
- [libbladeRF API documentation](https://www.nuand.com/bladeRF-doc/libbladeRF/v2.2.1/)
- [An SDR-Based FRS Transceiver view](https://www.nuand.com/bladeRF-doc/examples/bladeRF_frs.html)
- [wiki bladeRf](https://github.com/Nuand/bladeRF/wiki)

## gnuradio osmocom
![image](BladeRFv2Ax4/gnuradio_modulo.JPG)

## Matlab

%(1) Open a device handle:\
device = bladeRF('*:serial=SERIAL_NUAND_BLADE'); \
%(2) Setup device parameters
device.rx.frequency  = 917.45e6;    % frecuencia de portadopra
device.rx.samplerate = 5e6;         % frecuencia de muestreo
device.rx.bandwidth  = 2.5e6;       % Ancho de banda de trabajo
device.rx.lna        = 'MAX';       % Ganancia Maxima del lna 'receive'
device.rx.vga1       = 30;
device.rx.vga2       = 5;


## Bladerf cli -i


## Python



