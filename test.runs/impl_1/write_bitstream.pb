
h
Command: %s
53*	vivadotcl27
#write_bitstream -force XADCdemo.bit2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px? 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px? 
>
IP Catalog is up to date.1232*coregenZ19-1839h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
?Missing CFGBVS and CONFIG_VOLTAGE Design Properties: Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

 set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0

Refer to the device configuration user guide for more information.%s*DRC2(
 DRC|Pin Planning2default:default8ZCFGBVS-1h px? 
?
YReport rule limit reached: REQP-1839 rule limit reached: 20 violations have been found.%s*DRC29
 !DRC|DRC System|Rule limit reached2default:default8ZCHECK-3h px? 
?
YReport rule limit reached: REQP-1840 rule limit reached: 20 violations have been found.%s*DRC29
 !DRC|DRC System|Rule limit reached2default:default8ZCHECK-3h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2K
 "5
game/pg/b2b/E[0]game/pg/b2b/E2default:default2default:default2f
 "P
game/pg/b2b/seg_reg[0]_i_2/Ogame/pg/b2b/seg_reg[0]_i_2/O2default:default2default:default2b
 "L
game/pg/b2b/seg_reg[0]_i_2	game/pg/b2b/seg_reg[0]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "p
,game/pg/init/address_reg_0_0/ADDRARDADDR[10],game/pg/init/address_reg_0_0/ADDRARDADDR[10]2default:default2default:default2p
 "Z
!game/pg/init/sel[10]_repN_5_alias!game/pg/init/sel[10]_repN_5_alias2default:default2default:default2~
 "h
(game/vc/v_count_reg_reg[3]_rep_replica_5	(game/vc/v_count_reg_reg[3]_rep_replica_52default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "p
,game/pg/init/address_reg_0_0/ADDRARDADDR[11],game/pg/init/address_reg_0_0/ADDRARDADDR[11]2default:default2default:default2~
 "h
(game/pg/init/ADDRARDADDR[1]_repN_7_alias(game/pg/init/ADDRARDADDR[1]_repN_7_alias2default:default2default:default2~
 "h
(game/vc/v_count_reg_reg[4]_rep_replica_7	(game/vc/v_count_reg_reg[4]_rep_replica_72default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "p
,game/pg/init/address_reg_0_0/ADDRARDADDR[12],game/pg/init/address_reg_0_0/ADDRARDADDR[12]2default:default2default:default2f
 "P
game/pg/init/ADDRARDADDR[12]game/pg/init/ADDRARDADDR[12]2default:default2default:default2j
 "T
game/vc/v_count_reg_reg[5]_rep	game/vc/v_count_reg_reg[5]_rep2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "p
,game/pg/init/address_reg_0_0/ADDRARDADDR[13],game/pg/init/address_reg_0_0/ADDRARDADDR[13]2default:default2default:default2f
 "P
game/pg/init/ADDRARDADDR[13]game/pg/init/ADDRARDADDR[13]2default:default2default:default2j
 "T
game/vc/v_count_reg_reg[6]_rep	game/vc/v_count_reg_reg[6]_rep2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "p
,game/pg/init/address_reg_0_0/ADDRARDADDR[14],game/pg/init/address_reg_0_0/ADDRARDADDR[14]2default:default2default:default2~
 "h
(game/pg/init/ADDRARDADDR[4]_repN_5_alias(game/pg/init/ADDRARDADDR[4]_repN_5_alias2default:default2default:default2~
 "h
(game/vc/v_count_reg_reg[7]_rep_replica_5	(game/vc/v_count_reg_reg[7]_rep_replica_52default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "p
,game/pg/init/address_reg_0_0/ADDRARDADDR[15],game/pg/init/address_reg_0_0/ADDRARDADDR[15]2default:default2default:default2f
 "P
game/pg/init/ADDRARDADDR[15]game/pg/init/ADDRARDADDR[15]2default:default2default:default2j
 "T
game/vc/v_count_reg_reg[8]_rep	game/vc/v_count_reg_reg[8]_rep2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "n
+game/pg/init/address_reg_0_0/ADDRARDADDR[5]+game/pg/init/address_reg_0_0/ADDRARDADDR[5]2default:default2default:default2d
 "N
game/pg/init/ADDRARDADDR[5]game/pg/init/ADDRARDADDR[5]2default:default2default:default2b
 "L
game/vc/h_count_reg_reg[5]	game/vc/h_count_reg_reg[5]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "n
+game/pg/init/address_reg_0_0/ADDRARDADDR[5]+game/pg/init/address_reg_0_0/ADDRARDADDR[5]2default:default2default:default2d
 "N
game/pg/init/ADDRARDADDR[5]game/pg/init/ADDRARDADDR[5]2default:default2default:default2b
 "L
game/vc/h_count_reg_reg[6]	game/vc/h_count_reg_reg[6]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "n
+game/pg/init/address_reg_0_0/ADDRARDADDR[5]+game/pg/init/address_reg_0_0/ADDRARDADDR[5]2default:default2default:default2d
 "N
game/pg/init/ADDRARDADDR[5]game/pg/init/ADDRARDADDR[5]2default:default2default:default2b
 "L
game/vc/h_count_reg_reg[7]	game/vc/h_count_reg_reg[7]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "n
+game/pg/init/address_reg_0_0/ADDRARDADDR[5]+game/pg/init/address_reg_0_0/ADDRARDADDR[5]2default:default2default:default2d
 "N
game/pg/init/ADDRARDADDR[5]game/pg/init/ADDRARDADDR[5]2default:default2default:default2b
 "L
game/vc/h_count_reg_reg[8]	game/vc/h_count_reg_reg[8]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "n
+game/pg/init/address_reg_0_0/ADDRARDADDR[5]+game/pg/init/address_reg_0_0/ADDRARDADDR[5]2default:default2default:default2d
 "N
game/pg/init/ADDRARDADDR[5]game/pg/init/ADDRARDADDR[5]2default:default2default:default2b
 "L
game/vc/h_count_reg_reg[9]	game/vc/h_count_reg_reg[9]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "n
+game/pg/init/address_reg_0_0/ADDRARDADDR[6]+game/pg/init/address_reg_0_0/ADDRARDADDR[6]2default:default2default:default2d
 "N
game/pg/init/ADDRARDADDR[6]game/pg/init/ADDRARDADDR[6]2default:default2default:default2b
 "L
game/vc/h_count_reg_reg[6]	game/vc/h_count_reg_reg[6]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "n
+game/pg/init/address_reg_0_0/ADDRARDADDR[6]+game/pg/init/address_reg_0_0/ADDRARDADDR[6]2default:default2default:default2d
 "N
game/pg/init/ADDRARDADDR[6]game/pg/init/ADDRARDADDR[6]2default:default2default:default2b
 "L
game/vc/h_count_reg_reg[7]	game/vc/h_count_reg_reg[7]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "n
+game/pg/init/address_reg_0_0/ADDRARDADDR[6]+game/pg/init/address_reg_0_0/ADDRARDADDR[6]2default:default2default:default2d
 "N
game/pg/init/ADDRARDADDR[6]game/pg/init/ADDRARDADDR[6]2default:default2default:default2b
 "L
game/vc/h_count_reg_reg[8]	game/vc/h_count_reg_reg[8]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "n
+game/pg/init/address_reg_0_0/ADDRARDADDR[6]+game/pg/init/address_reg_0_0/ADDRARDADDR[6]2default:default2default:default2d
 "N
game/pg/init/ADDRARDADDR[6]game/pg/init/ADDRARDADDR[6]2default:default2default:default2b
 "L
game/vc/h_count_reg_reg[9]	game/vc/h_count_reg_reg[9]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "n
+game/pg/init/address_reg_0_0/ADDRARDADDR[7]+game/pg/init/address_reg_0_0/ADDRARDADDR[7]2default:default2default:default2d
 "N
game/pg/init/ADDRARDADDR[7]game/pg/init/ADDRARDADDR[7]2default:default2default:default2b
 "L
game/vc/h_count_reg_reg[7]	game/vc/h_count_reg_reg[7]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "n
+game/pg/init/address_reg_0_0/ADDRARDADDR[7]+game/pg/init/address_reg_0_0/ADDRARDADDR[7]2default:default2default:default2d
 "N
game/pg/init/ADDRARDADDR[7]game/pg/init/ADDRARDADDR[7]2default:default2default:default2b
 "L
game/vc/h_count_reg_reg[8]	game/vc/h_count_reg_reg[8]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "n
+game/pg/init/address_reg_0_0/ADDRARDADDR[7]+game/pg/init/address_reg_0_0/ADDRARDADDR[7]2default:default2default:default2d
 "N
game/pg/init/ADDRARDADDR[7]game/pg/init/ADDRARDADDR[7]2default:default2default:default2b
 "L
game/vc/h_count_reg_reg[9]	game/vc/h_count_reg_reg[9]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "n
+game/pg/init/address_reg_0_0/ADDRARDADDR[8]+game/pg/init/address_reg_0_0/ADDRARDADDR[8]2default:default2default:default2p
 "Z
!game/pg/init/address_reg_1_0_0[0]!game/pg/init/address_reg_1_0_0[0]2default:default2default:default2j
 "T
game/vc/v_count_reg_reg[1]_rep	game/vc/v_count_reg_reg[1]_rep2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
game/pg/init/address_reg_0_0	game/pg/init/address_reg_0_02default:default2default:default2?
 "n
+game/pg/init/address_reg_0_0/ADDRARDADDR[9]+game/pg/init/address_reg_0_0/ADDRARDADDR[9]2default:default2default:default2P
 ":
game/pg/init/Q[0]game/pg/init/Q[0]2default:default2default:default2b
 "L
game/vc/v_count_reg_reg[2]	game/vc/v_count_reg_reg[2]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test2/rom1/addr_reg_reg	game/pg/test2/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test2/rom1/addr_reg_reg/ADDRARDADDR[3].game/pg/test2/rom1/addr_reg_reg/ADDRARDADDR[3]2default:default2default:default2v
 "`
$game/pg/test2/rom1/Q[0]_repN_3_alias$game/pg/test2/rom1/Q[0]_repN_3_alias2default:default2default:default2v
 "`
$game/vc/v_count_reg_reg[0]_replica_3	$game/vc/v_count_reg_reg[0]_replica_32default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test2/rom1/addr_reg_reg	game/pg/test2/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test2/rom1/addr_reg_reg/ADDRARDADDR[4].game/pg/test2/rom1/addr_reg_reg/ADDRARDADDR[4]2default:default2default:default2z
 "d
&game/pg/test2/rom1/sel[8]_repN_5_alias&game/pg/test2/rom1/sel[8]_repN_5_alias2default:default2default:default2v
 "`
$game/vc/v_count_reg_reg[1]_replica_5	$game/vc/v_count_reg_reg[1]_replica_52default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test2/rom1/addr_reg_reg	game/pg/test2/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test2/rom1/addr_reg_reg/ADDRARDADDR[5].game/pg/test2/rom1/addr_reg_reg/ADDRARDADDR[5]2default:default2default:default2z
 "d
&game/pg/test2/rom1/sel[9]_repN_4_alias&game/pg/test2/rom1/sel[9]_repN_4_alias2default:default2default:default2~
 "h
(game/vc/v_count_reg_reg[2]_rep_replica_4	(game/vc/v_count_reg_reg[2]_rep_replica_42default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test2/rom1/addr_reg_reg	game/pg/test2/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test2/rom1/addr_reg_reg/ADDRARDADDR[6].game/pg/test2/rom1/addr_reg_reg/ADDRARDADDR[6]2default:default2default:default2|
 "f
'game/pg/test2/rom1/sel[10]_repN_6_alias'game/pg/test2/rom1/sel[10]_repN_6_alias2default:default2default:default2~
 "h
(game/vc/v_count_reg_reg[3]_rep_replica_6	(game/vc/v_count_reg_reg[3]_rep_replica_62default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test2/rom1/addr_reg_reg	game/pg/test2/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test2/rom1/addr_reg_reg/ADDRBWRADDR[3].game/pg/test2/rom1/addr_reg_reg/ADDRBWRADDR[3]2default:default2default:default2v
 "`
$game/pg/test2/rom1/Q[0]_repN_3_alias$game/pg/test2/rom1/Q[0]_repN_3_alias2default:default2default:default2v
 "`
$game/vc/v_count_reg_reg[0]_replica_3	$game/vc/v_count_reg_reg[0]_replica_32default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test2/rom1/addr_reg_reg	game/pg/test2/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test2/rom1/addr_reg_reg/ADDRBWRADDR[4].game/pg/test2/rom1/addr_reg_reg/ADDRBWRADDR[4]2default:default2default:default2z
 "d
&game/pg/test2/rom1/sel[8]_repN_5_alias&game/pg/test2/rom1/sel[8]_repN_5_alias2default:default2default:default2v
 "`
$game/vc/v_count_reg_reg[1]_replica_5	$game/vc/v_count_reg_reg[1]_replica_52default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test2/rom1/addr_reg_reg	game/pg/test2/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test2/rom1/addr_reg_reg/ADDRBWRADDR[5].game/pg/test2/rom1/addr_reg_reg/ADDRBWRADDR[5]2default:default2default:default2z
 "d
&game/pg/test2/rom1/sel[9]_repN_4_alias&game/pg/test2/rom1/sel[9]_repN_4_alias2default:default2default:default2~
 "h
(game/vc/v_count_reg_reg[2]_rep_replica_4	(game/vc/v_count_reg_reg[2]_rep_replica_42default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test2/rom1/addr_reg_reg	game/pg/test2/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test2/rom1/addr_reg_reg/ADDRBWRADDR[6].game/pg/test2/rom1/addr_reg_reg/ADDRBWRADDR[6]2default:default2default:default2|
 "f
'game/pg/test2/rom1/sel[10]_repN_6_alias'game/pg/test2/rom1/sel[10]_repN_6_alias2default:default2default:default2~
 "h
(game/vc/v_count_reg_reg[3]_rep_replica_6	(game/vc/v_count_reg_reg[3]_rep_replica_62default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test4/rom1/addr_reg_reg	game/pg/test4/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test4/rom1/addr_reg_reg/ADDRARDADDR[3].game/pg/test4/rom1/addr_reg_reg/ADDRARDADDR[3]2default:default2default:default2v
 "`
$game/pg/test4/rom1/Q[0]_repN_2_alias$game/pg/test4/rom1/Q[0]_repN_2_alias2default:default2default:default2v
 "`
$game/vc/v_count_reg_reg[0]_replica_2	$game/vc/v_count_reg_reg[0]_replica_22default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test4/rom1/addr_reg_reg	game/pg/test4/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test4/rom1/addr_reg_reg/ADDRARDADDR[4].game/pg/test4/rom1/addr_reg_reg/ADDRARDADDR[4]2default:default2default:default2z
 "d
&game/pg/test4/rom1/sel[8]_repN_6_alias&game/pg/test4/rom1/sel[8]_repN_6_alias2default:default2default:default2v
 "`
$game/vc/v_count_reg_reg[1]_replica_6	$game/vc/v_count_reg_reg[1]_replica_62default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test4/rom1/addr_reg_reg	game/pg/test4/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test4/rom1/addr_reg_reg/ADDRARDADDR[5].game/pg/test4/rom1/addr_reg_reg/ADDRARDADDR[5]2default:default2default:default2z
 "d
&game/pg/test4/rom1/sel[9]_repN_5_alias&game/pg/test4/rom1/sel[9]_repN_5_alias2default:default2default:default2~
 "h
(game/vc/v_count_reg_reg[2]_rep_replica_5	(game/vc/v_count_reg_reg[2]_rep_replica_52default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test4/rom1/addr_reg_reg	game/pg/test4/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test4/rom1/addr_reg_reg/ADDRARDADDR[6].game/pg/test4/rom1/addr_reg_reg/ADDRARDADDR[6]2default:default2default:default2|
 "f
'game/pg/test4/rom1/sel[10]_repN_7_alias'game/pg/test4/rom1/sel[10]_repN_7_alias2default:default2default:default2~
 "h
(game/vc/v_count_reg_reg[3]_rep_replica_7	(game/vc/v_count_reg_reg[3]_rep_replica_72default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test4/rom1/addr_reg_reg	game/pg/test4/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test4/rom1/addr_reg_reg/ADDRBWRADDR[3].game/pg/test4/rom1/addr_reg_reg/ADDRBWRADDR[3]2default:default2default:default2v
 "`
$game/pg/test4/rom1/Q[0]_repN_2_alias$game/pg/test4/rom1/Q[0]_repN_2_alias2default:default2default:default2v
 "`
$game/vc/v_count_reg_reg[0]_replica_2	$game/vc/v_count_reg_reg[0]_replica_22default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test4/rom1/addr_reg_reg	game/pg/test4/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test4/rom1/addr_reg_reg/ADDRBWRADDR[4].game/pg/test4/rom1/addr_reg_reg/ADDRBWRADDR[4]2default:default2default:default2z
 "d
&game/pg/test4/rom1/sel[8]_repN_6_alias&game/pg/test4/rom1/sel[8]_repN_6_alias2default:default2default:default2v
 "`
$game/vc/v_count_reg_reg[1]_replica_6	$game/vc/v_count_reg_reg[1]_replica_62default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test4/rom1/addr_reg_reg	game/pg/test4/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test4/rom1/addr_reg_reg/ADDRBWRADDR[5].game/pg/test4/rom1/addr_reg_reg/ADDRBWRADDR[5]2default:default2default:default2z
 "d
&game/pg/test4/rom1/sel[9]_repN_5_alias&game/pg/test4/rom1/sel[9]_repN_5_alias2default:default2default:default2~
 "h
(game/vc/v_count_reg_reg[2]_rep_replica_5	(game/vc/v_count_reg_reg[2]_rep_replica_52default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test4/rom1/addr_reg_reg	game/pg/test4/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test4/rom1/addr_reg_reg/ADDRBWRADDR[6].game/pg/test4/rom1/addr_reg_reg/ADDRBWRADDR[6]2default:default2default:default2|
 "f
'game/pg/test4/rom1/sel[10]_repN_7_alias'game/pg/test4/rom1/sel[10]_repN_7_alias2default:default2default:default2~
 "h
(game/vc/v_count_reg_reg[3]_rep_replica_7	(game/vc/v_count_reg_reg[3]_rep_replica_72default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test6/rom1/addr_reg_reg	game/pg/test6/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test6/rom1/addr_reg_reg/ADDRARDADDR[3].game/pg/test6/rom1/addr_reg_reg/ADDRARDADDR[3]2default:default2default:default2v
 "`
$game/pg/test6/rom1/Q[0]_repN_2_alias$game/pg/test6/rom1/Q[0]_repN_2_alias2default:default2default:default2v
 "`
$game/vc/v_count_reg_reg[0]_replica_2	$game/vc/v_count_reg_reg[0]_replica_22default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test6/rom1/addr_reg_reg	game/pg/test6/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test6/rom1/addr_reg_reg/ADDRARDADDR[4].game/pg/test6/rom1/addr_reg_reg/ADDRARDADDR[4]2default:default2default:default2z
 "d
&game/pg/test6/rom1/sel[8]_repN_6_alias&game/pg/test6/rom1/sel[8]_repN_6_alias2default:default2default:default2v
 "`
$game/vc/v_count_reg_reg[1]_replica_6	$game/vc/v_count_reg_reg[1]_replica_62default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test6/rom1/addr_reg_reg	game/pg/test6/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test6/rom1/addr_reg_reg/ADDRARDADDR[5].game/pg/test6/rom1/addr_reg_reg/ADDRARDADDR[5]2default:default2default:default2z
 "d
&game/pg/test6/rom1/sel[9]_repN_5_alias&game/pg/test6/rom1/sel[9]_repN_5_alias2default:default2default:default2~
 "h
(game/vc/v_count_reg_reg[2]_rep_replica_5	(game/vc/v_count_reg_reg[2]_rep_replica_52default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2l
 "V
game/pg/test6/rom1/addr_reg_reg	game/pg/test6/rom1/addr_reg_reg2default:default2default:default2?
 "t
.game/pg/test6/rom1/addr_reg_reg/ADDRARDADDR[6].game/pg/test6/rom1/addr_reg_reg/ADDRARDADDR[6]2default:default2default:default2|
 "f
'game/pg/test6/rom1/sel[10]_repN_8_alias'game/pg/test6/rom1/sel[10]_repN_8_alias2default:default2default:default2~
 "h
(game/vc/v_count_reg_reg[3]_rep_replica_8	(game/vc/v_count_reg_reg[3]_rep_replica_82default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
g
DRC finished with %s
1905*	planAhead2)
0 Errors, 44 Warnings2default:defaultZ12-3199h px? 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px? 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px? 
?
Loading data files...
1271*designutilsZ12-1165h px? 
>
Loading site data...
1273*designutilsZ12-1167h px? 
?
Loading route data...
1272*designutilsZ12-1166h px? 
?
Processing options...
1362*designutilsZ12-1514h px? 
<
Creating bitmap...
1249*designutilsZ12-1141h px? 
7
Creating bitstream...
7*	bitstreamZ40-7h px? 
_
Writing bitstream %s...
11*	bitstream2"
./XADCdemo.bit2default:defaultZ40-11h px? 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px? 
?
?WebTalk data collection is mandatory when using a WebPACK part without a full Vivado license. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.
120*projectZ1-120h px? 
?
?'%s' has been successfully sent to Xilinx on %s. For additional details about this file, please refer to the Webtalk help file at %s.
186*common2?
mC:/Users/needs/OneDrive/Documents/GitHub/TerritorialWars_Basys3/test.runs/impl_1/usage_statistics_webtalk.xml2default:default2,
Wed Dec 14 02:07:16 20222default:default2S
?D:/Softwares/xilinx/Vivado/2020.1/doc/webtalk_introduction.html2default:defaultZ17-186h px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
2062default:default2
882default:default2
12default:default2
02default:defaultZ4-41h px? 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:332default:default2
00:00:292default:default2
2272.4732default:default2
456.4962default:defaultZ17-268h px? 


End Record