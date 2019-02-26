FROM chambana/base:latest

MAINTAINER Josh King <jking@chambana.net>

## Add startup script.                                                                                                                                                                                                                                                                                                                                                                                                                    
ADD bin/run.sh /app/bin/run.sh                                                                                                                                                                                                                                                                                                                                                                                                            
RUN apt-get -qq update && \
    apt-get install -y --no-install-recommends wget \
                                               ca-certificates && \
    wget -O ./cloudflared.tgz https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz && \
    tar -zxvf ./cloudflared.tgz -C ./ && \
    chmod +x /app/bin/run.sh && \
    install -Dm755 cloudflared /usr/bin/cloudflared

ENTRYPOINT ["/app/bin/run.sh"]                                                                                                                                                                                                                                                                                                                                                                                                            
CMD ["sh", "-c", "/usr/bin/cloudflared tunnel --no-autoupdate --hostname ${CF_TUNNEL_HOSTNAME} ${CF_TUNNEL_ORIGIN_URL}"] 
