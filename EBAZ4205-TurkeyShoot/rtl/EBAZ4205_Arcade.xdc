## This file is a for EBAZ4205-Arcade PCB
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project


## CLOCK
set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS33} [get_ports clock_50]; # Use if you have X5 Oscillator soldered on
create_clock -period 20.000 -name clock_50 [get_ports clock_50];

## DATA1
## set_property -dict { PACKAGE_PIN H18   IOSTANDARD LVCMOS33 } [get_ports { DATA1_15 }]; 
## set_property -dict { PACKAGE_PIN D19   IOSTANDARD LVCMOS33 } [get_ports { DATA1_16 }]; 

## VGA - PS2 - AUDIO
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { O_VIDEO_R[0] }]; 
set_property -dict { PACKAGE_PIN D20   IOSTANDARD LVCMOS33 } [get_ports { O_VIDEO_R[1] }]; 
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { O_VIDEO_R[2] }]; 
set_property -dict { PACKAGE_PIN D19   IOSTANDARD LVCMOS33 } [get_ports { O_VIDEO_G[0] }]; 
set_property -dict { PACKAGE_PIN F20   IOSTANDARD LVCMOS33 } [get_ports { O_VIDEO_G[1] }];  
set_property -dict { PACKAGE_PIN H18   IOSTANDARD LVCMOS33 } [get_ports { O_VIDEO_G[2] }];  
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { O_VIDEO_B[0] }]; 
set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVCMOS33 } [get_ports { O_VIDEO_B[1] }]; 
set_property -dict { PACKAGE_PIN C20   IOSTANDARD LVCMOS33 } [get_ports { O_AUDIO_L }]; 
set_property -dict { PACKAGE_PIN B20   IOSTANDARD LVCMOS33 } [get_ports { O_AUDIO_R }]; 
set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { ps2_clk }]; 
set_property -dict { PACKAGE_PIN B19   IOSTANDARD LVCMOS33 } [get_ports { ps2_dat }]; 


## RESET BUTTON
set_property -dict { PACKAGE_PIN A20   IOSTANDARD LVCMOS33 } [get_ports { I_RESET }]; 
set_property PULLUP true [get_ports { I_RESET }];

## DATA2
## set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { DATA2_6 }]; 
## set_property -dict { PACKAGE_PIN G19   IOSTANDARD LVCMOS33 } [get_ports { DATA2_7 }]; 
## set_property -dict { PACKAGE_PIN H20   IOSTANDARD LVCMOS33 } [get_ports { DATA2_8 }]; 
## set_property -dict { PACKAGE_PIN J19   IOSTANDARD LVCMOS33 } [get_ports { DATA2_9 }];  
## set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { DATA2_11 }];  
## set_property -dict { PACKAGE_PIN K19   IOSTANDARD LVCMOS33 } [get_ports { DATA2_13 }]; 
## set_property -dict { PACKAGE_PIN J20   IOSTANDARD LVCMOS33 } [get_ports { DATA2_14 }]; 
## set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { DATA2_15 }]; 
## set_property -dict { PACKAGE_PIN L19   IOSTANDARD LVCMOS33 } [get_ports { DATA2_16 }]; 
## set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { DATA2_17 }]; 
## set_property -dict { PACKAGE_PIN L20   IOSTANDARD LVCMOS33 } [get_ports { DATA2_18 }]; 

## SYNC
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { O_HSYNC }]; 
set_property -dict { PACKAGE_PIN G20   IOSTANDARD LVCMOS33 } [get_ports { O_VSYNC }]; 


## DATA3
## set_property -dict { PACKAGE_PIN M19   IOSTANDARD LVCMOS33 } [get_ports { DATA3_5 }]; 
## set_property -dict { PACKAGE_PIN N20   IOSTANDARD LVCMOS33 } [get_ports { DATA3_6 }]; 
## set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { DATA3_7 }]; 
## set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { DATA3_8 }]; 
## set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { DATA3_9 }];  
## set_property -dict { PACKAGE_PIN P20   IOSTANDARD LVCMOS33 } [get_ports { DATA3_11 }];  
## set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { DATA3_13 }]; 
## set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports { DATA3_14 }]; 
## set_property -dict { PACKAGE_PIN P19   IOSTANDARD LVCMOS33 } [get_ports { DATA3_15 }]; 
## set_property -dict { PACKAGE_PIN T20   IOSTANDARD LVCMOS33 } [get_ports { DATA3_16 }]; 
## set_property -dict { PACKAGE_PIN U20   IOSTANDARD LVCMOS33 } [get_ports { DATA3_17 }]; 
## set_property -dict { PACKAGE_PIN T19   IOSTANDARD LVCMOS33 } [get_ports { DATA3_18 }]; 
## set_property -dict { PACKAGE_PIN V20   IOSTANDARD LVCMOS33 } [get_ports { DATA3_19 }]; 
## set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports { DATA3_20 }]; 

## LEDS
set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports { greenLED }]; 
set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports { redLED }];
 
## DEBUG LEDS ON HEADER
set_property -dict { PACKAGE_PIN V20   IOSTANDARD LVCMOS33 } [get_ports { led[0] }]; 
set_property -dict { PACKAGE_PIN U20   IOSTANDARD LVCMOS33 } [get_ports { led[1] }]; 
set_property -dict { PACKAGE_PIN P19   IOSTANDARD LVCMOS33 } [get_ports { led[2] }]; 
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { led[3] }]; 
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { led[4] }]; 
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { led[5] }]; 
set_property -dict { PACKAGE_PIN M19   IOSTANDARD LVCMOS33 } [get_ports { led[6] }]; 
set_property -dict { PACKAGE_PIN M20   IOSTANDARD LVCMOS33 } [get_ports { led[7] }]; 

##J5&J3
## set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { J5_SPEED }]; 
## set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { J5_PWM }]; 
## set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports { J3_SPEED }]; 
## set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { J3_PWM }]; 


