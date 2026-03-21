# ✈️ A320 Fenix - Air Manager Instruments

[![GitHub release](https://img.shields.io/github/v/release/Delta-Charlie-DEV/A320FENIX_AIRMANAGER?style=flat-square)](https://github.com/Delta-Charlie-DEV/A320FENIX_AIRMANAGER/releases)
[![MSFS 2020](https://img.shields.io/badge/MSFS-2020-blue?style=flat-square)](https://www.flightsimulator.com/)
[![MSFS 2024](https://img.shields.io/badge/MSFS-2024-green?style=flat-square)](https://www.flightsimulator.com/)

A comprehensive collection of [Air Manager](https://www.siminnovations.com/) instruments and panels specifically designed for the **Fenix A320** in Microsoft Flight Simulator (2020 & 2024).

---

## 📝 Description
This repository provides high-fidelity `.siff` instrument files for the Fenix A320. 

> [!IMPORTANT]
> Since the Fenix B2 (v407) update, **FenixQuartz and FSUIPC are no longer required**. All instruments now communicate directly via native LVARS within Air Manager.

### 📦 All-in-One Installation
For a quick setup, you can download a single package containing every instrument:
👉 **[Download the CURRENT all in one .SIFF Package](https://github.com/Delta-Charlie-DEV/A320FENIX_AIRMANAGER/releases/tag/CURRENT)**
*Note: This will install or overwrite all Fenix instruments in your Air Manager library.*

---

## ⚙️ Requirements & Configuration

### Software Versions
* **Air Manager:** Version **4.2.12** or **5.x** (Required for MSFS 2024 logic).
* **Fenix A320:** Build 407 (B2) or newer.

### Fenix EFB Settings
For the instruments to behave correctly, please configure your EFB as follows:
* **Fenix** ➔ **SIM SETTINGS** ➔ **CONTROLS** ➔ **EFIS BARO CTL**: `Independent`
* **Fenix** ➔ **SIM SETTINGS** ➔ **AIRFRAME** ➔ **STANDBY**: `ISIS` (Analog standby is not supported).

---

## 📥 Quick Installation Guide

1. **Download:** Get the latest `.siff` file from the [Releases](https://github.com/Delta-Charlie-DEV/A320FENIX_AIRMANAGER/releases/tag/CURRENT) page.
2. **Import:** Open Air Manager, go to the **Instruments** tab, and click **Import**. Select the downloaded `.siff` file.
3. **Panel Creation:** * Create a new Panel in Air Manager.
   * Add the Fenix instruments you need.
4. **Master Instrument:** Ensure you add the **"A320 FENIX - PEDESTAL - Illumination Pedestal Captain"** to your panel. This instrument acts as the "Master" to enable lighting synchronization for all other panels.

---

## 🛠️ Troubleshooting & Known Issues

| Issue | Potential Solution |
| :--- | :--- |
| **Instruments stay black** | Ensure the "Illumination Pedestal Captain" instrument is added to your panel. |
| **Buttons don't respond** | Verify you are using Air Manager **v4.2.12+**. Older versions do not support the new MSFS write directives. |
| **Baro syncing** | Check EFB settings: `EFIS BARO CTL` must be set to `Independent`. |
| **Analog Standby** | The analog standby clock/instruments are currently **not supported**. Use the `ISIS` setting in the EFB. |

---

## 🚀 Major Update (v2.x) - MSFS 2024 Ready
As of December 2024, the `MAIN` branch hosts **v2.x.x** instruments.
* **Modern API:** Uses `msfs_variable_subscribe()` and `msfs_variable_write()` for full MSFS 2020/2024 compatibility.
* **Clean Titles:** Removed "OK" from instrument titles (UUIDs remain identical for seamless updates).
* **Legacy Support:** The older versions are archived [here](https://github.com/Delta-Charlie-DEV/A320FENIX_AIRMANAGER/releases/tag/ARCHIVE_PREV2).

---

## ⚖️ Origin & Credits
This project is built upon existing designs for the A32NX (FBW), with logic entirely rewritten for Fenix-specific behaviors:
* **A32NX Overhead instruments** by *Scarabée* ([Flightsim.to](https://fr.flightsim.to/file/27278/a32nx-overhead-for-air-manager-4-1-siminnovation)).
* **FlyByWire A320 Collection v2** by *Alexander Hilldman* & *Yves Lévesque* ([Forum Link](https://siminnovations.com/forums/viewtopic.php?t=5877&hilit=FBW)).

---

## ⚠️ Important Legal Notice
Please respect the **FenixSim EULA**. Their Terms and Conditions have been updated and the "home cockpit configuration" prohibition isn't mentionned any more.
> *"6.4. You shall only use the Software for non-commercial purposes (meaning private home entertainment
use). You shall refrain from any other use, in particular commercial use (meaning that which is intended
for, or directed towards, commercial advantage, monetary compensation, professional training, or
educational purposes)."*

> — [Fenix Terms and Conditions](https://fenixsim.com/assets/docs/2024-terms-and-conditions.pdf)

---

## ☕ Support the Project
If you enjoy these instruments and want to offer me a beer or stay motivated for further updates... No obligation, but greatly appreciated!

👉 **[Donate via PayPal](https://www.paypal.com/donate/?business=G99DPNWCBDFZA&no_recurring=1&currency_code=EUR)**

---