(1) Open a device handle:

   b = bladeRF('*:serial=SERIAL_NUAND_BLADE_RF'); % Open device via first 3 serial # digits

 (2) Setup device parameters. These may be changed while the device
     is actively streaming.

   b.rx.frequency  = 917.45e6;
   b.rx.samplerate = 5e6;
   b.rx.bandwidth  = 2.5e6;
   b.rx.lna        = 'MAX';
   b.rx.vga1       = 30;
   b.rx.vga2       = 5;

 (3) Setup stream parameters. These may NOT be changed while the device
     is streaming.

   b.rx.config.num_buffers   = 64;
   b.rx.config.buffer_size   = 16384;
   b.rx.config.num_transfers = 16;
   b.rx.timeout_ms           = 5000;


 (4) Start the module

   b.rx.start();

 (5) Receive 0.250 seconds of samples

  samples = b.receive(0.250 * b.rx.samplerate);

 (6) Cleanup and shutdown by stopping the RX stream and having MATLAB
     delete the handle object.

  b.rx.stop();
  clear b;

/*
 Below is a list of submodules within the bladeRF handle. See the help
 text of each of these for the properties and methods exposed by modules.

 See also: bladeRF_XCVR, bladeRF_VCTCXO, bladeRF_StreamConfig, bladeRF_IQCorr
 Copyright (c) 2015 Nuand LLC

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE./*/
