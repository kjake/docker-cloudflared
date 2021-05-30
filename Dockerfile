FROM kjake/base:latest

MAINTAINER kjake

## Add startup script.                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                         
RUN apt-get -qq update && \
    apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends wget \
                                               ca-certificates \
                                               curl && \
    curl -s https://api.github.com/repos/cloudflare/cloudflared/releases/latest | grep -E 'browser_download_url' | grep linux-amd64 | cut -d '"' -f 4 | wget -qi - && \
    install -Dm755 cloudflared-linux-amd64 /usr/bin/cloudflared && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/
                                                                                                                                                                                                                                                                                                                                                                                           
CMD ["sh", "-c", "/usr/bin/cloudflared tunnel --no-autoupdate run"]
