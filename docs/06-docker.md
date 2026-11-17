# 6. Docker

Docker runs each app in its own **container**: a sealed box with everything that app needs. Apps don't get in each other's way, and each one is easy to remove.

Run these over SSH. First, install Docker and its `docker compose` command:

```bash
sudo apt update
```

```bash
sudo apt install -y docker.io docker-compose-v2
```

Then add your user to the `docker` group, so you don't need `sudo` for every Docker command:

```bash
sudo usermod -aG docker $USER
```

The group change only applies the next time you log in, so type `exit`, connect again with `ssh`, and then test it:

```bash
docker run --rm hello-world
```

It prints **Hello from Docker!**

## If it says "permission denied"

You're still in the old login. Type `exit`, connect again, and run the test again.

Next: **[7. Nextcloud](07-nextcloud.md)**
