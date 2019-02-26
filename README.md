# docker-cloudflared
A docker container for running [Cloudflare's Argo Tunnel](https://developers.cloudflare.com/argo-tunnel/quickstart/) to proxy a service.

You can activate a tunnel to a service by specifying the following environment variables:

* `CF_TUNNEL_HOSTNAME` - The hostname on Cloudflare that you wish to register for the tunnel endpoint (i.e. mirror.example.com).
* `CF_TUNNEL_ORIGIN_URL` - The local URL you wish to forward the above hostname to, for example http://localhost:8080.
* `CF_TUNNEL_CERT_BASE64` - The base64 representation of the PEM-format certificate registered on Cloudflare for the origin.

Inspired by the [grabarz/cloudflared](https://hub.docker.com/r/grabarz/cloudflared) container.
