FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    PSN00BSDK_VERSION=0.24

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    cmake \
    ninja-build \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN wget -q "https://github.com/Lameguy64/PSn00bSDK/releases/download/v${PSN00BSDK_VERSION}/PSn00bSDK-${PSN00BSDK_VERSION}-Linux.zip" \
    && unzip -q "PSn00bSDK-${PSN00BSDK_VERSION}-Linux.zip" -d /opt \
    && ln -s "/opt/PSn00bSDK-${PSN00BSDK_VERSION}-Linux" /opt/psn00bsdk \
    && rm "PSn00bSDK-${PSN00BSDK_VERSION}-Linux.zip"

ENV PATH="/opt/psn00bsdk/bin:${PATH}" \
    PSN00BSDK_LIBS="/opt/psn00bsdk/lib/libpsn00b"

WORKDIR /workspace
CMD ["/bin/bash"]
