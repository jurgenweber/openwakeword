FROM python:3-bookworm

ENV PIP_BREAK_SYSTEM_PACKAGES=1
ENV OPENWAKEWORD_LIB_VERSION=1.8.1

COPY run.sh /usr/local/bin/run.sh

RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        netcat-traditional \
        python3 \
        python3-pip \
        libopenblas0 \
    \
    && pip3 install --no-cache-dir -U \
        setuptools \
        wheel \
    && pip3 install --no-cache-dir \
        --extra-index-url https://www.piwheels.org/simple \
        "wyoming-openwakeword==${OPENWAKEWORD_LIB_VERSION}" \
    \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/local/bin/run.sh"]
