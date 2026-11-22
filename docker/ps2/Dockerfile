FROM ps2dev/ps2dev:latest

RUN apk add --no-cache \
    bash \
    cmake \
    make \
    ninja

ENV PS2DEV=/usr/local/ps2dev \
    PS2SDK=/usr/local/ps2dev/ps2sdk \
    GSKIT=/usr/local/ps2dev/gsKit \
    PATH="/usr/local/ps2dev/bin:/usr/local/ps2dev/ee/bin:/usr/local/ps2dev/iop/bin:/usr/local/ps2dev/dvp/bin:/usr/local/ps2dev/ps2sdk/bin:${PATH}"

WORKDIR /workspace
CMD ["/bin/bash"]
