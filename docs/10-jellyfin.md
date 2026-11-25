# 10. Jellyfin: your own Netflix

Jellyfin turns the movies and shows you already have into a Netflix-style library, with posters, descriptions and "continue watching". Your phone, TV and computers stream them from the laptop.

It runs as one container. Run all of this over SSH from your computer, after [Docker](06-docker.md) is set up.

## 1. Make a folder for it

```bash
mkdir -p ~/jellyfin/media/movies ~/jellyfin/media/shows && cd ~/jellyfin
```

## 2. Get the file

```bash
curl -fsSLO https://raw.githubusercontent.com/KooEmmanuel/laptop-home-server/main/jellyfin/compose.yaml
```

([compose.yaml](../jellyfin/compose.yaml), if you'd like to read it first.)

## 3. Start it

```bash
docker compose up -d
```

The first start downloads Jellyfin, which takes a minute or two. Check that it's running, on port 8096:

```bash
docker compose ps
```

## 4. Put movies on the laptop

Copy them from your everyday computer. Run this on **your computer**, not over SSH. Change the file name, and use your own username and the laptop's address:

```bash
scp "Big Buck Bunny.mp4" your-username@192.168.x.x:~/jellyfin/media/movies/
```

- One folder per show goes in `~/jellyfin/media/shows`, for example `shows/My Show/Season 01/`.
- Jellyfin reads normal video files (`.mp4`, `.mkv`). Name movies the way they're called, with the year if you know it, for example `Night of the Living Dead (1968).mp4`, so it finds the right poster.
- Only use movies you own or that are free to share. *Big Buck Bunny* (Blender Foundation, CC BY) and many old films that are in the public domain are good ones to test with.

## 5. Set it up in the browser

1. On your computer, go to `http://<the laptop's address>:8096`, for example `http://192.168.x.x:8096`.
2. Pick your language and create your account (username and password).
3. **Add Media Library**: content type **Movies**, folder **/media/movies**. Add a second one for **Shows** with **/media/shows** if you have any.
4. Finish, then log in.

Jellyfin scans the folders and fetches the posters and descriptions by itself. That takes a minute.

## 6. Watch on your phone

**At home, no internet needed:** install the **Jellyfin** app (App Store or Google Play), or open the browser. Enter `http://192.168.x.x:8096` as the server and log in. Tap a movie: it streams from the laptop over your Wi-Fi.

To prove it's the laptop and not the internet: turn on Airplane mode, then turn Wi-Fi back on. The movie still plays.

**Away from home:** turn on Tailscale on your phone and use `http://homeserver:8096` instead (see [step 8](08-phone.md)).

**On your TV:** Jellyfin has apps for most smart TVs, Fire TV, Android TV and Roku. Use the same address.

## Keeping it up to date

From `~/jellyfin`:

```bash
docker compose pull && docker compose up -d
```

## If something goes wrong

- **The page doesn't load.** `docker compose ps` should list `jellyfin` as running. `docker compose logs --tail 50` shows its last messages.
- **A movie is missing from the library.** Check the file is in `~/jellyfin/media/movies`, then in Jellyfin go to **Dashboard → Libraries → Scan All Libraries**.
- **A movie stutters on the phone.** The laptop is converting it while it plays. Try a `.mp4` file, or set the app's quality to **Maximum** so it plays the original file.

Don't open port 8096 on your router to the internet. Use Tailscale to watch from away.
