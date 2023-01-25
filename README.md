# A320FENIX_AIRMANAGER
AirManager instruments/panel for FENIXSIM A320

This share provides Air Manager (https://www.siminnovations.com/) instruments for Fenix A320 (https://fenixsim.com/) for MSFS.

You'll find the instruments files (.siff) in INSTRUMENTS folder and subfolders.

Most instruments work as is directly from Air Manager.

Some need a few more steps to work properly :
- FCU Autopilot
- Radio panel (pedestal Left is the only one working for now)
- Rudder Trim
- Overhead elec panel
These instruments need to read information that FENIX doesn't provide directly. 

Here's how we'll make those data available to air manager (or any other software able to read LVAR variables) :

For that you need to :
- download PilotsDeck_FNX tool by Fragtality : https://github.com/Fragtality/PilotsDeck_FNX and unzip to the folder of your choice
  (for example c:\PilotsDeck_FNX)
 
- install a registered FSUIPC version (for example to c:\fsuipc)

- download provided lua script PilotsDeck_FNX.lua and move the file to FSUIPC install folder (in this example c:\fsuipc)

- modify c:\fsuipc\fsuipc:ini :

  to start automatically Pilots_FNX tool (ajust folder name if you installed the tool to another folder) :
  [Programs]
  RunIf1=READY,KILL,C:\PilotsDeck_FNX\PilotsDeck_FNX2PLD.exe  
  
  to start automatically the LUA script :
  [Auto]
  1=Lua PilotsDeck_FNX
  
  
The custom LVARS created are :
CUSTOM LVAR							Description
L:IPCFNXA320_OVHD_BAT1_STR 			BAT1 voltage
L:IPCFNXA320_OVHD_BAT2_STR 			BAT2 voltage
L:IPCFNXA320_FCU_SPD_STR 			FCU SPEED display
L:IPCFNXA320_FCU_HDG_STR 			FCU HDG display
L:IPCFNXA320_FCU_ALT_STR 			FCU ALT display
L:IPCFNXA320_FCU_VS_STR 			FCU VS display
L:IPCFNXA320_FCU_IS_ALTVS 			FCU ALTVS
L:IPCFNXA320_ISIS_BARO_STR 			ISIS baro
L:IPCFNXA320_PED_COM_ACTIVE_STR 	COM active freq
L:IPCFNXA320_PED_COM_STNDBY_STR 	COM stdby freq
L:IPCFNXA320_PED_XPDR_STR 			XPDR code
L:IPCFNXA320_PED_RUDDER_TRIM_STR 	Rudder trim angle

There are probably a few bugs here and there, please don't hesitate yo open an issue if you encounter some.
