FROM kjake/base:latest

MAINTAINER kjake

## Add startup script.                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                         
RUN apt-get -qq update && \
    apt-get install -y --no-install-recommends wget \
                                               ca-certificates && \
    wget -O ./cloudflared.tgz https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz && \
    tar -zxvf ./cloudflared.tgz -C ./ && \
    install -Dm755 cloudflared /usr/bin/cloudflared

                                                                                                                                                                                                                                                                                                                                                                                           
CMD ["sh", "-c", "/usr/bin/cloudflared tunnel --no-autoupdate run"] 
