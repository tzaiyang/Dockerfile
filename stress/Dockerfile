FROM debian:bullseye-slim

LABEL maintainer=tzaiyang

RUN apt update && \
    apt -y --no-install-recommends install stress && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/usr/bin/stress" ]
CMD [ "--help" ]
