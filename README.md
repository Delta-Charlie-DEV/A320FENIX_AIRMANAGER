# A320FENIX_AIRMANAGER
AirManager instruments/panel for FENIXSIM A320 (MSFS 2020 and MSFS 2024)

### MAJOR UPDATE AND CHANGES AFTER MFS2024 RELEASE
2024 december update : starting from this date, the MAIN branch stores new versions of the instruments (version 2.X)  
All instruments have a new version counting : 2.x.x.  
The instruments have been renamed (I removed the 'OK' in the titles), the UUID have been kept so that should not have any impact.  

This new instruments use the new Air Manager directives that are compatible with both MSFS2020 et MSFS2024 :  
	msfs_variable_subscribe()  
	msfs_variable_write()  
	
This news directive can only be used with Air Manager versions  > 4.2.12 and Air Manager 5.x :  
https://siminnovations.com/wiki/index.php/Air_Manager_Instrument_Logic_API#Microsoft_Flight_Simulator

At this time they've only been tested with AM 5.0 BETA3

The old instruments have been kept (as an archive) as a all in one SIFF package :  
https://github.com/Delta-Charlie-DEV/A320FENIX_AIRMANAGER/releases/tag/ARCHIVE

### ALL IN ONE PACKAGE
You can download a all in one .SIFF package : this export contains every instruments.
In cas you need to install all instruments, or don't know which one you need to update, you just need to import
this package, it'll install/overwrite every FENIX instruments.
Download link :  
https://github.com/Delta-Charlie-DEV/A320FENIX_AIRMANAGER/releases/tag/CURRENT

### SPECIFIC NOTES ABOUT FLIGHT SIMULATOR 2024
At this time, the environment variable for zulu time in MSFS2024 doesn't work as expected :  
https://devsupport.flightsimulator.com/t/msfs2024-enviroment-variables-not-working/10509  
That means cockpit enlightenment can be errounous (night mode while you're flying in day time for example).


****************************************************************
### IMPORTANT NOTICE REGARDING FENIXSIM EULA

Fenix Terms and Conditions forbids the use of their A320 in a "home cockpit configuration":  
"6.4. The Software must not be used on home cockpits."  
https://fenixsim.com/assets/docs/Fenix%20Terms%20and%20Conditions.pdf

****************************************************************

### DESCRIPTION

This share provides Air Manager (https://www.siminnovations.com/) instruments for Fenix A320 (https://fenixsim.com/) for MSFS.

You'll find the instruments files (.siff) in INSTRUMENTS folder and subfolders.

Everything now works directly from Air Manager, FenixQuartz is no longer needed.

### INTRUMENTS LIGHITING AND ENVIRONNMENT

All the instruments/panels in this set are able to reflect external lightning and internal light settings. The captain pedestal illumination panel (A320 FENIX - OK - PEDESTAL - Illumination Pedestal Captain) must be displayed (this instrument works as master to enable the illumination mode for all other instruments).

### ORIGIN AND CREDITS

All this work is based on existing instruments developped for the FBW A32NX :
- A32NX Flybywire Overhead instruments by Scarabée 

    https://fr.flightsim.to/file/27278/a32nx-overhead-for-air-manager-4-1-siminnovation
- FlyByWire A320 Collection for MSFS 2020 Version 2 by Alexander Hilldman and Yves Lévesque

    https://siminnovations.com/forums/viewtopic.php?t=5877&hilit=FBW
    
I've used the design of this panels and rewrote the whole logic behind to match Fenix specific behaviours.

### EXTERNAL SOFTWARE AND CONFIG NEEDED

Since Fenix B2 release update 407, every needed values are now native LVARS.

There's no more need for external software (FenixQuartz / FSUIPC).


### FENIX EFB SETTINGS

Previous EFIS left/right versions included an option to enable/disable barometer sync. This option has been removed, as the behaviour can be set directly in Fenix EFB settings.

For correct behaviour, please set Fenix EFB settings  : 

Fenix -> SIM SETTINGS -> CONTROLS -> EFIS BARO CTL : Indepedent (use air manager EFIS option to enable barometer sync)  
Fenix -> SIM SETTINGS -> AIRFRAME -> STANDBY : isis (analogic standby instrument not supported)

### DONATION

In case you like those instruments and want to offer me a beer or motivation for further upgrades ... No obligation !

https://www.paypal.com/donate/?business=G99DPNWCBDFZA&no_recurring=1&currency_code=EUR