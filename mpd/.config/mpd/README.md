# Usage: 

**touch/mkdir:**
```planet
playlist_directory "~/.config/mpd/playlists"
pid_file           "~/.config/mpd/pid"
state_file         "~/.config/mpd/state"
sticker_file       "~/.config/mpd/sticker.sql"
```

# Start:

```planet
systemctl enable mpd.service --user
systemctl start mpd.service --user
```
