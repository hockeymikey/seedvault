# Seedvault
[![Build Status](https://ci.hockeymikey.com/buildStatus/icon?job=Seedvault&style=plastic)](https://ci.hockeymikey.com/job/Seedvault/)

A backup application for the [Android Open Source Project](https://source.android.com/).

## Features
- Backup application data to a flash drive.
- Restore application data from a flash drive.
- User-friendly encryption using a mnemonic phrase (BIP39).
- Automatic daily backups that run in the background.

## Requirements
- Android 8

## Getting Started
- Check out [the wiki](https://github.com/stevesoltys/seedvault/wiki) for information on building the application with 
AOSP.

## What makes this different?
This application is compiled with the operating system and does not require a rooted device for use.
It uses the same internal APIs as `adb backup` which is deprecated and thus needs a replacement.

## Permissions
* `android.permission.BACKUP` to back up application data.
* `android.permission.MANAGE_DOCUMENTS` to retrieve the available storage roots. 
* `android.permission.MANAGE_USB` to access the serial number of USB mass storage devices.
* `android.permission.WRITE_SECURE_SETTINGS` to change system backup settings and enable call log backup.
* `android.permission.INSTALL_PACKAGES` to re-install apps when restoring from backup.

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/stevesoltys/seedvault. 

## License
This application is available as open source under the terms of the [Apache-2.0 License](https://opensource.org/licenses/Apache-2.0).
