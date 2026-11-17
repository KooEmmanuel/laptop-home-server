# 8. Open your files on your phone

## At home, no internet needed

On your phone, connected to your home Wi-Fi, open the browser and go to the same address as before:

```
http://192.168.x.x:8080
```

Log in with your Nextcloud account. Your files are there, and videos play straight from the laptop.

The phone reaches the laptop through your Wi-Fi router, so it doesn't need the internet to get to your files. If the internet goes down at home, this keeps working.

There's also a **Nextcloud** app (App Store and Google Play) that does the same thing:
1. For the server address, enter `http://192.168.x.x:8080`.
2. If it warns that the connection isn't secure (`http`), that's expected on your own home network.

## Away from home

1. Turn on the **Tailscale** app on your phone, signed in with the same account as the server.
2. Use the machine's name instead of its address:

```
http://homeserver:8080
```

This works both at home and away, as long as Tailscale is on.

## Don't do this

Don't open port 8080 on your router to the internet ("port forwarding"). Tailscale already gets you in from anywhere, and an open port invites strangers to try your login.

Next: **[9. Extras for a laptop that stays on](09-extras.md)**
