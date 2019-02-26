#!/bin/bash -

. /app/lib/common.sh

CHECK_VAR CF_TUNNEL_HOSTNAME
CHECK_VAR CF_TUNNEL_ORIGIN_URL
CHECK_VAR CF_TUNNEL_CERT_BASE64

MSG "Setting Cloudflare PEM certificate..."
mkdir -p /etc/cloudflared
echo "${CF_TUNNEL_CERT_BASE64}" | base64 -d > /etc/cloudflared/cert.pem
MSG "Starting Cloudflared tunnel..."

exec "$@"
