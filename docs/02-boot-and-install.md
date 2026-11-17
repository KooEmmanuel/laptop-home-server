# 2. Boot from the stick and install Ubuntu Server

**This wipes the laptop.** Copy off anything you want to keep first.

## Open the boot menu

Plug the stick into the laptop, turn it on, and straight away tap the boot-menu key.

On **HP** laptops (the video uses an HP ProBook 450 G7):

| Key | What it opens |
|---|---|
| **Esc** | Startup Menu, which lists the keys below |
| **F9** | Boot menu: everything the laptop can start from |
| **F10** | BIOS settings |

Other brands use different keys. Common ones: Dell **F12**, Lenovo **F12** (some IdeaPads have a small "Novo" button instead), Acer **F12** (turn on "F12 Boot Menu" in its BIOS first), ASUS laptops **Esc**, MSI **F11**, Microsoft Surface: hold **Volume Down** while you press power.

In the boot menu, pick your USB stick. With a card reader it may be called **Generic USB Storage**.

## If the stick isn't in the list

1. Open the BIOS (**F10** on HP) and look at the boot options. **USB storage boot** must be on. Fast Boot is best turned off while you install.
2. Secure Boot can stay on: Ubuntu works with it.
3. If USB boot is already on and the stick still isn't listed, the laptop isn't seeing that stick at all. Try a different stick, or a microSD card in a USB card reader ([see step 1](01-download-and-write.md#if-the-laptop-wont-see-the-stick-later)).

## Install

The installer is used with the keyboard: arrow keys to move, **Enter** to choose, **Space** to tick a box.

1. **Try or Install Ubuntu Server**.
2. **Language:** pick yours. If it offers an installer update, you can skip it.
3. **Keyboard:** keep the layout it suggests, or pick yours.
4. **Type of install:** **Ubuntu Server**.
5. **Network:** without a network cable it says it isn't connected. That's fine. Choose **Continue without network**, because you'll connect to Wi-Fi after the install ([step 3](03-wifi.md)).
6. **Proxy** and **mirror:** leave as they are.
7. **Storage:** **Use an entire disk**, then confirm. **This is the step that wipes Windows.**
8. **Profile:**
   - your name
   - a name for the server
   - a username and a password you'll remember
9. **Ubuntu Pro:** skip it.
10. **SSH:** tick **Install OpenSSH server**. SSH lets you control the laptop from another computer. Don't skip it.
11. **Featured snaps:** you don't need any. Leave them all unticked.

The install takes a few minutes. When it says **Installation complete**, choose **Reboot Now**, remove the USB stick or card reader when it asks, and press **Enter**.

After the reboot there's no desktop, only a login prompt. That's normal for a server. Log in with the username and password you just made.

Next: **[3. Connect it to Wi-Fi](03-wifi.md)**
