# 5. Tailscale: reach it from anywhere, safely

Tailscale puts the laptop on a private network with your other devices. You can then reach it from anywhere, without opening anything on your router to the internet. The free plan is enough.

Run these over SSH. First, install Tailscale:

```bash
curl -fsSL https://tailscale.com/install.sh | sh
```

Then connect, giving the machine a name. The video uses `homeserver`:

```bash
sudo tailscale up --hostname=homeserver
```

It prints a login link. Open it on your computer and sign in. If you don't have a Tailscale account, signing in with Google, Microsoft or GitHub creates one.

Then check the laptop's private Tailscale address. It starts with `100.`:

```bash
tailscale ip -4
```

## Two things to do once

1. **Turn off key expiry.** Without this, the server logs itself out of Tailscale every few months:
   1. Open the admin console at [login.tailscale.com](https://login.tailscale.com/admin/machines).
   2. Click **⋯** next to `homeserver`.
   3. Choose **Disable key expiry**.
2. **Install Tailscale on your phone and computer** ([tailscale.com/download](https://tailscale.com/download)) and sign in with the **same account**. Any device on that account can then reach `homeserver` by name.

Next: **[6. Docker](06-docker.md)**
