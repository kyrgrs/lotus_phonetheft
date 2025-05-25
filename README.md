# Lotus Phone Theft

This script adds a phone theft, reset, and IMEI registration mission system for FiveM servers. It is compatible with the QBCore framework and `qb-target`.

## Features

- Start missions via NPC
- Steal a phone from a randomly selected house
- Reset the stolen phone at a reset point
- Register the IMEI of the reset phone to legalize it
- Blip and notification support for mission steps
- Full compatibility with the QBCore inventory system

## Installation

1. Place the script files in the `resources` folder.
2. Add `ensure lotus_phonetheft` to your `server.cfg` file.
3. Add the item definitions in `[install]/items.lua` to your inventory system.
4. Make sure the dependencies in `fxmanifest.lua` (`qb-core`, `qb-target`) are installed.
5. Start the script in your server configuration.

## Usage

1. The player starts the mission by going to the designated NPC on the map.
2. Steal a phone from a randomly selected house using the "Steal Phone" option.
3. Go to the reset point and perform the "Reset Phone" action.
4. Finally, complete the "Register IMEI" action at the IMEI registration point to finish the mission.

## Configuration

- NPC model, location, and mission points can be edited via `config.lua`.
- Notification messages and mission durations can also be adjusted in `config.lua`.

## Requirements

- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-target](https://github.com/BerkieBb/qb-target)

## Supported Inventories

- OX Inventory
- QB Inventory

