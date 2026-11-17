# 4. Control it from your computer (SSH)

From here on you can leave the laptop alone and do everything from your own computer. Copy and paste works there, so long commands are easy.

Open a terminal:
- **Mac:** Terminal
- **Windows:** Windows Terminal or PowerShell
- **Linux:** any terminal

Then connect, using **your** username and **the laptop's address** from step 3:

```bash
ssh your-username@192.168.x.x
```

1. The first time, it asks whether you trust this computer. Type `yes`.
2. Enter the laptop's password. Nothing appears while you type it; that's normal.

The prompt changes to the laptop's name, and everything you type from now on runs on the laptop. Type `exit` to disconnect.

## Optional: log in without a password

On your computer (not the laptop), make a key once, then copy it to the laptop:

```bash
ssh-keygen -t ed25519
```

```bash
ssh-copy-id your-username@192.168.x.x
```

On Windows, `ssh-copy-id` isn't included. Run this in PowerShell instead:

```powershell
type $env:USERPROFILE\.ssh\id_ed25519.pub | ssh your-username@192.168.x.x "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

Next: **[5. Tailscale](05-tailscale.md)**
