# A320FENIX_AIRMANAGER
AirManager instruments/panel for FENIXSIM A320

****************************************************************
### IMPORTANT NOTICE REGARDING FENIXSIM EULA

Fenix Terms and Conditions forbids the use of their A320 in a "home cockpit configuration":  
"6.4. The Software must not be used on home cockpits."  
https://fenixsim.com/assets/docs/Fenix%20Terms%20and%20Conditions.pdf

****************************************************************

### DESCRIPTION

This share provides Air Manager (https://www.siminnovations.com/) instruments for Fenix A320 (https://fenixsim.com/) for MSFS.

You'll find the instruments files (.siff) in INSTRUMENTS folder and subfolders.

Most instruments work as is directly from Air Manager, others don't (please see EXTERNAL SOFTWARE AND CONFIG NEEDED chapter below)

### ORIGIN AND CREDITS

All this work is based on existing instruments developped for the FBW A32NX :
- A32NX Flybywire Overhead instruments by Scarabée 

    https://fr.flightsim.to/file/27278/a32nx-overhead-for-air-manager-4-1-siminnovation
- FlyByWire A320 Collection for MSFS 2020 Version 2 by Alexander Hilldman and Yves Lévesque

    https://siminnovations.com/forums/viewtopic.php?t=5877&hilit=FBW
    
I've used the design of this panels and rewrote the whole logic behind to match Fenix specific behaviours.

### EXTERNAL SOFTWARE AND CONFIG NEEDED

Some instruments need a few more steps to work properly :
- FCU Autopilot
- Radio panel (pedestal Left is the only one working for now)
- Rudder Trim
- Overhead elec panel

These instruments need to read data that FENIX doesn't provide directly. 

Here's how we'll make those data available to air manager (or any other software able to read LVAR variables) :

- download PilotsDeck_FNX tool by Fragtality : https://github.com/Fragtality/PilotsDeck_FNX and unzip to the folder of your choice
 
- install FSUIPC latest version (7.3.16 or newer) (for example to c:\fsuipc)

- install the WASM Module from MobiFlight (Put it in your Community Folder) : https://github.com/MobiFlight/MobiFlight-WASM-Module/releases

- modify c:\fsuipc\fsuipc:ini :

  to start automatically Pilots_FNX tool (ajust folder name if you installed the tool to another folder) :
  [Programs]
  RunIf1=READY,KILL,C:\PilotsDeck_FNX\PilotsDeck_FNX2PLD.exe  
  
Finally, PilotsDeck_FNX tool must be setup to create LVARS and use raw data, please edit PilotsDeck_FNX2PLD.dll.config file (in the folder where you've unzipped it).
Here are the settings used :

`<?xml version="1.0" encoding="utf-8" ?>  
<configuration>  
  <appSettings>  
    <add key="FenixExecutable" value="FenixSystem" />  
    <add key="logFilePath" value="FNX2PLD.log" />  
    <add key="logLevel" value="Debug" />  
    <add key="waitForConnect" value="false" />  
    <add key="offsetBase" value="0x5408" />  
    <add key="rawValues" value="true" />  
    <add key="useLvars" value="true" />  
    <add key="updateIntervall" value="50" />  
    <add key="altScaleDelim" value=" "/>  
    <add key="addFcuMode" value="true"/>  
  </appSettings>  
</configuration>`

To see the LVAR created by Pilots_FNX, please check Assignments.txt file in its folder.

There are probably a few bugs here and there, please don't hesitate to open an issue if you encounter some.


