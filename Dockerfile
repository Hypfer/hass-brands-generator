FROM debian:latest

RUN apt-get update && apt-get install -y \
    git \
    optipng \
    bash \
    rsync \
    jq \
    librsvg2-bin \
    ca-certificates \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN mkdir /workspace
RUN mkdir /output

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]