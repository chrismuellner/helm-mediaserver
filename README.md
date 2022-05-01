# Helm Mediaserver

## Prerequisites

- Helm
- Enough disk space on the host (11Gb with default configuration)
- Nothing bound on port 443 (e.g. traefik)

## Setup

1. Create override values file
    - Set `nginx.host` to valid domain (e.g. `media.local`)
2. Install the Helm Chart
    ```sh
    helm install mediaserver . -f <custom-values.yaml>
    ```
3. Modify base paths correctly when using ingress controller
    - Set `BasePathOverride` to `/jackett` in `config/jackett/Jackett/ServerConfig.json`
    - Set `UrlBase` to `/sonarr` in `config/sonarr/config.xml`
4. Components can be accessed
    - jackett: `<host>/jackett` (e.g. `media.local/jackett`)
    - transmission: `<host>/transmission` (e.g. `media.local/transmission`)
    - sonarr: `<host>/sonarr` (e.g. `media.local/sonarr`)
    - jellyfin: `<host>` (e.g. `media.local`)
5. Finish configuration via Web UI