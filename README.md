# docker armhf sonarr

## Instructions

```
docker run -d \
    --name sonarr \
    --restart always \
    -p 8989:8989 \
    -p 9898:9898 \
    --link plex:plex \
    --link nzbget:nzbget \
    -v <your_media_location>:/media \
    -v <your_downloads_location>:/downloads \
    -v <your_sonarr_config_location>:/config \
    adrienbrault/armhf-sonarr
```
