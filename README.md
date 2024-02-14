# Sending Podman container logs to Loki

This is a quick readme for how to send Podman container logs to Grafan's Loki via Grafana's Promtail, for my full blog post [see here.](https://n00bsecurityblog.wordpress.com/2023/07/28/getting-podman-container-logs-to-grafana-loki/)

Grafana Promtail offers a convient way to send all Docker container logs to Grafana Loki. While Podman often maintains feature parity with Docker, in this case the Docker log driver solution requires a daemon, which Podman does not use. There are other options for sending Podman container logs to Loki, however. Podman has 2 options for capturing container logs. 

## Journald

Journald or systemd-journald is the logging part of systemd. Podman offers a convient way to send container logs to the hosts journald log. Promtail also offers a journald log parser and forwarder to Loki. The downside to this solution is that the container's name is saved as the process name and by default the process name is not parsed in Loki. To run the journald log driver run a podman container like so 

`podman run --log-driver=journald echoevery5:latest`


## k8s-file

This option simply write the container logs to a file, which can then be parsed by promtail using the CRI Promtail stage. 

`podman run --log-driver=k8s-file --log-opt path=/var/log/podman/every5 echoevery5:latest`

