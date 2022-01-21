## SimpleSoC ##

The purpose of this project is to illustrate how to create from scratch a simple SoC (System on Chip) using ARM Design Start resources. Various tutorials already exist online on this subject, but they are mostly ‘connect the dots’ guides based on pre-canned projects which require specific Vivado versions and mostly fail their objective to enable the user to create and customize on his own SoC.

First, download the Cortex-M1 design start files available from ARM. They are available at this address: https://www.arm.com/resources/free-arm-cortex-m-on-fpga

Make sure you have the board files installed in Vivado under 

`C:\Xilinx\Vivado\2021.1\data\boards\board_files`

If not, download them from https://github.com/Digilent/vivado-boards

### Creating the project from scratch ###
Create a new Vivado project using e.g.: Arty as target board. Then, copy the contents of ‘Arm_ipi_repository’ directory included in the Cortex-M1 Design Start package into the IPs 'directory' and restart Vivado.

Now, go to `IP Integrator/Create Block design` and add the Cortex-M processor to the design. If this is not yet there, create a new project to reflect changes to IP repository applied before.
You can now add other AXI blocks, such as an AXI Interconnect and an AXI BRAM controller. 
Selecting the ‘Board’ tab it is possible to add the board resources to the block design and the relevant IPs will be automatically added and connected by the tool. If, for example, board LEDs are added to the block design, Vivado will create an AXI slave GPIO block to manage them.

With the help of the connection wizard, something similar should appear:

![SimpleSoc Block Diagram](/images/block-diagram.PNG)

Before building, a TOP level module must be specified. Right-click the top level design where all blocks are belonging to and select “Create HDLwrapper”. Now you can run design synthesis.
Remember to add proper constraints file to map the top signals to the correct IOs. Template files for all Digilent boards can be found here https://github.com/Digilent/digilent-xdc

The SWD debugger connection requires an INOUT buffer to bring SWD connections towards external pins. For some unknown reason, IOBUF resource is not present in the ‘Utility Buffer’ V2.2 package which comes with Vivado 2021.1. So, I crafted my own one in a separate VHDL project and packaged it with the Vivado package tools: go to `Tools/Create and Package new IP/Package your Current Project`. This new IP can be easily connected to the processor’s SWD signals but there’s a catch: Vivado will complain about not being able to assign INOUT signals. To work this around, use the Global synthesis as opposed to the default Out of Context one. These settings are well hidden in Vivado: you need to go to the ‘Design Runs’ tab, right click the design, and reset it. Now, a dialog will show up asking whether to use Global or Out Of Context. Other cleaner approaches might exist: figure out why the IOBUF is not there; put the inout logic in the Top wrapper created by Vivado; tweak the different units in `Design Runs`.
Vivado will finally complain about the SWD clock not being correctly mapped. Just add the suggested constraint in the constraints file.
Finally, remember to remap the BRAM memory in 0x0 instead of 0xC0000000 as the VTOR cannot be modified in the Cortex-M1.

Now, connect a J-Link probe to the SWD signals and check that the debugger recognizes the core. If yes, try to read/write some memory using w4 and mem32 commands.

Test also the LEDs connections via by programming the the GPIO peripheral:
w4 0x40000004 0
w4 0x40000000 0xf

If everything is fine, build the Keil project (free version limited to 32kB is more than enough) and try blinky LED application.


### Resources ###
Cortex-M1 based Design Start is shown in this virtual event:
https://events.hackster.io/designstart

More resources here
https://www.arm.com/products/silicon-ip-cpu/cortex-m/cortex-m1

Some tutorial on block level design
https://digilent.com/reference/vivado/getting-started-with-ipi/2018.2


