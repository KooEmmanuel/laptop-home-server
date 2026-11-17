# 3. Connect it to Wi-Fi

Type these on the laptop itself, logged in at the prompt.

## Is it on the network?

```bash
hostname -I
```

This prints the laptop's address on your home network (something like `192.168.x.x`). If it prints nothing, the laptop isn't connected yet. That's normal if you skipped the network during the install.

Linux commands are case-sensitive: it's `hostname` in lower case, then `-I` with a capital i.

## Find the Wi-Fi card's name

```bash
ls /sys/class/net
```

The one that starts with **wl** is the Wi-Fi card, for example `wlp3s0` or `wlo1`. Write it down.

Check the Wi-Fi software is there. It should say `install ok installed`:

```bash
dpkg -s wpasupplicant | grep -i status
```

If it isn't installed, connect the laptop to the internet some other way for a minute and install it. A network cable works, and so does USB tethering from an Android phone. Then run:

```bash
sudo apt update && sudo apt install -y wpasupplicant
```

## Write the Wi-Fi settings

On Ubuntu Server, Wi-Fi is set up in a small settings file that a tool called **netplan** reads.

```bash
sudo nano /etc/netplan/60-wifi.yaml
```

Type this in, with three changes:

- `wlp3s0` becomes your Wi-Fi card's name from above.
- `YourWifiName` becomes your Wi-Fi network's name. Keep the quotes.
- `YourWifiPassword` becomes your Wi-Fi password. Keep the quotes.

```yaml
network:
  version: 2
  wifis:
    wlp3s0:
      dhcp4: true
      access-points:
        "YourWifiName":
          password: "YourWifiPassword"
```

(The same file is in this repo: [netplan/60-wifi.yaml](../netplan/60-wifi.yaml).)

- Use **spaces, never Tab**, and keep the indents exactly as shown.
- Save with **Ctrl+O**, then **Enter**, then **Ctrl+X**.

If you're filming this, keep the password off camera.

## Turn it on

Make the file readable only by the system (it holds your Wi-Fi password), then apply it:

```bash
sudo chmod 600 /etc/netplan/60-wifi.yaml
```

```bash
sudo netplan apply
```

```bash
hostname -I
```

Now it prints the laptop's address. **Write it down: you'll use it from now on.**

## Keep that address

Your router can give the laptop a different address after a restart. Stop that in your router's settings page: find the laptop in the list of devices and reserve its address. Routers call this **DHCP reservation**, **static lease** or **address reservation**.

## If it doesn't connect

- `netplan apply` shows an error about the file: it's almost always spacing (a Tab, or an indent off by one space) or a typo. `access-points` is easy to mistype.
- Still nothing in `hostname -I`: check the Wi-Fi name and password, including capital letters, then run `sudo netplan apply` again.
- To see more detail: `sudo netplan --debug apply`.

Next: **[4. Control it from your computer (SSH)](04-ssh.md)**
