FROM chambana/base:latest

MAINTAINER Josh King <jking@chambana.net>

## Add startup script.                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                         
RUN apt-get -qq update && \
    apt-get install -y --no-install-recommends wget \
                                               ca-certificates && \
    wget -O ./cloudflared.tgz https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz && \
    tar -zxvf ./cloudflared.tgz -C ./ && \
    install -Dm755 cloudflared /usr/bin/cloudflared

                                                                                                                                                                                                                                                                                                                                                                                           
CMD ["sh", "-c", "/usr/bin/cloudflared tunnel run"] 
