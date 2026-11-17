# 1. Download Ubuntu Server and write it to a USB stick

Do this on your everyday computer (Mac, Windows or Linux).

## Download Ubuntu Server

1. Go to **[ubuntu.com/download/server](https://ubuntu.com/download/server)**.
2. Download **Ubuntu Server 26.04.1 LTS**. It's one `.iso` file of about 3 GB.

LTS means long-term support: it gets security updates for five years, which is what you want on a machine that stays on.

## Download Raspberry Pi Imager

Raspberry Pi Imager copies the `.iso` onto a USB stick so that a computer can start from it. It's made by Raspberry Pi, and it works for other systems too.

Download it from **[raspberrypi.com/software](https://www.raspberrypi.com/software/)** and install it like any other app.

(balenaEtcher or, on Windows, Rufus do the same job if you already use one of them.)

## Write the stick

1. Plug in the USB stick (8 GB or more). **Everything on it will be erased.**
2. Open Raspberry Pi Imager.
3. **Device:** choose **No filtering**.
4. **Operating system:** scroll to the bottom of the list, choose **Use custom**, and pick the Ubuntu `.iso` you downloaded.
5. **Storage:** pick your USB stick. Check it's the stick, not another drive.
6. Confirm the warning that the stick will be erased.

Writing takes a few minutes. Imager then checks the stick and shows **Write complete**.

## If the laptop won't see the stick later

Some cheap USB sticks don't show up in some laptops' boot menus, even when they're written perfectly. In the video, the HP laptop never listed a cheap "USB DISK 2.0" stick, although its contents matched the Ubuntu file byte for byte.

Writing the same file onto a **microSD card in a small USB card reader** fixed it straight away. It showed up as **Generic USB Storage**.

If your stick doesn't appear in step 2, try a different stick or a card reader before you change any settings.

Next: **[2. Boot from the stick and install](02-boot-and-install.md)**
