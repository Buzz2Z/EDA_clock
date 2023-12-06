set_global_assignment -name FAMILY "Cyclone IV"
set_global_assignment -name DEVICE EP4CE40F23C8
set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED"
set_global_assignment -name RESERVE_ALL_UNUSED_PINS_NO_OUTPUT_GND "AS INPUT TRI-STATED"
# system clock and reset----------------------------------------------------------------
set_location_assignment PIN_G1  -to clk
set_location_assignment PIN_K21 -to rstn
set_location_assignment PIN_K22 -to AdjMinKey
set_location_assignment PIN_T16 -to AdjHrKey
set_location_assignment PIN_T15 -to SetMinKey 
set_location_assignment PIN_T18 -to SetHrKey 
set_location_assignment PIN_M22 -to mode
set_location_assignment PIN_N21 -to CtrlBell
set_location_assignment PIN_A6 -to alarm
set_location_assignment PIN_G8 -to radio

set_location_assignment PIN_R16	-to seg[0]
set_location_assignment PIN_P17	-to seg[1]
set_location_assignment PIN_R19	-to seg[2]
set_location_assignment PIN_N16	-to seg[3]
set_location_assignment PIN_U22	-to seg[4]
set_location_assignment PIN_J21	-to seg[5]
set_location_assignment PIN_H22	-to seg[6]
set_location_assignment PIN_H21	-to seg[7]

set_location_assignment PIN_F22	-to dig[0]
set_location_assignment PIN_F21	-to dig[1]
set_location_assignment PIN_E22	-to dig[2]
set_location_assignment PIN_E21	-to dig[3]
set_location_assignment PIN_D22	-to dig[4]
set_location_assignment PIN_D21	-to dig[5]
set_location_assignment PIN_C22	-to dig[6]
set_location_assignment PIN_C21	-to dig[7]



