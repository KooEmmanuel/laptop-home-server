# 9. Extras for a laptop that stays on

## Look after the battery

A laptop that's plugged in all the time wears its battery out by sitting at 100%.

Many laptops can stop charging earlier:

- **HP:** open the BIOS (**F10**), look for **Battery Health Manager**, and choose **Maximize my battery health**.
- **Lenovo** (charge threshold), **Dell** (Primarily AC use) and **ASUS** (battery charge limit) have similar settings.

## Close the lid without it going to sleep

*(Not shown in the video.)* By default, closing the lid puts the laptop to sleep, and then the server is off. To let it keep running with the lid shut:

```bash
sudo mkdir -p /etc/systemd/logind.conf.d
```

```bash
printf '[Login]\nHandleLidSwitch=ignore\nHandleLidSwitchExternalPower=ignore\nHandleLidSwitchDocked=ignore\n' | sudo tee /etc/systemd/logind.conf.d/lid.conf
```

```bash
sudo reboot
```

## Keep Ubuntu up to date

Ubuntu Server installs security updates by itself. To install every other update, run this now and then:

```bash
sudo apt update && sudo apt upgrade -y
```

Updates for Nextcloud are in [step 7](07-nextcloud.md#keeping-it-up-to-date).

## Back up your files

The laptop is now the only copy of anything you upload to it. Keep a second copy somewhere else, for example:
- the Nextcloud desktop app syncing a folder to your computer, or
- a USB drive you copy `~/nextcloud/html/data` to.

One copy isn't a backup.

Next: **[10. Jellyfin: your own Netflix](10-jellyfin.md)**
