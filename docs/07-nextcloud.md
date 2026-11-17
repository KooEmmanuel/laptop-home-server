# 7. Nextcloud: your own Google Drive

Nextcloud stores your files on the laptop, and your phone and computers open them from there. It runs as four containers:

| Container | What it does |
|---|---|
| a database (MariaDB) | keeps track of the files |
| a cache (Redis) | keeps it quick |
| Nextcloud itself | the app, on port 8080 |
| cron | runs Nextcloud's background jobs |

Run all of this over SSH, after [Tailscale](05-tailscale.md) is set up.

## 1. Make a folder for it

```bash
mkdir -p ~/nextcloud && cd ~/nextcloud
```

## 2. Get the two files

The quick way is to download them from this repo:

```bash
curl -fsSLO https://raw.githubusercontent.com/KooEmmanuel/laptop-home-server/main/nextcloud/compose.yaml
```

```bash
curl -fsSLO https://raw.githubusercontent.com/KooEmmanuel/laptop-home-server/main/nextcloud/make-env.sh
```

([compose.yaml](../nextcloud/compose.yaml) and [make-env.sh](../nextcloud/make-env.sh), if you'd like to read them first.)

## 3. Make the passwords file

This creates `.env`, which holds:
- random passwords for the database, so you never have to see or type them;
- the addresses Nextcloud will answer on: the laptop's home address, its Tailscale address and its Tailscale name.

```bash
bash make-env.sh
```

If you're filming, keep the contents of `.env` off camera.

The same thing as one command (it's what the video uses). Change `homeserver` if you named the machine something else in Tailscale:

```bash
printf 'DB_ROOT_PASSWORD=%s\nDB_PASSWORD=%s\nTRUSTED=%s %s homeserver\n' "$(openssl rand -hex 16)" "$(openssl rand -hex 16)" "$(hostname -I | awk '{print $1}')" "$(tailscale ip -4)" > .env && chmod 600 .env
```

## 4. Start it

```bash
docker compose up -d
```

The first start downloads everything, which takes a few minutes. Then check that all four containers are running, with Nextcloud on port 8080:

```bash
docker compose ps
```

## 5. Create your admin account

1. On your computer, open a browser and go to `http://<the laptop's address>:8080`, for example `http://192.168.x.x:8080`.
2. Create an admin account (username and password), and wait about a minute while it sets up.
3. If it offers recommended apps, you can skip them for now.

You're on the dashboard. Upload a file: it's now stored on the laptop.

Your files live in `~/nextcloud/html/data` on the laptop.

## Keeping it up to date

From `~/nextcloud`:

```bash
docker compose pull && docker compose up -d
```

## If something goes wrong

- **"Access through untrusted domain"**
  - You opened Nextcloud by an address that isn't in `.env`. The `TRUSTED` line only counts at the very first start.
  - To add an address afterwards (change the number at the end for each new one: 3, 4, …):
    ```bash
    docker compose exec -u www-data app php occ config:system:set trusted_domains 3 --value=192.168.x.x
    ```
- **The page doesn't load**
  - `docker compose ps` should list four running containers.
  - `docker compose logs app --tail 50` shows Nextcloud's last messages.
- **You want to start again from nothing.** This deletes everything stored in Nextcloud:
  ```bash
  docker compose down
  ```
  ```bash
  sudo rm -rf db html .env
  ```
  Then go back to step 3.

Next: **[8. Open your files on your phone](08-phone.md)**
