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

Everything now works directly from Air Manager, FenixQuartz is no longer needed.

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