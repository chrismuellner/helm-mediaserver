# helm-mediaserver

1. Install the Helm Chart
    ```sh
    helm install mediaserver .
    ```
2. Forward port to local machine
    ```sh
    kubectl port-forward deployment/<name> :<port>
    ```

Name/Port can be any of the following combinations:
- `jackett`, `9117`
- `sonarr`, `8989`
- `transmission`, `9091`
- `jellyfin`, `8096`
