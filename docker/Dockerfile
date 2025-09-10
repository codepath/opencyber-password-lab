# docker/Dockerfile

# ------ 1: BUILD IMAGE --------
FROM ubuntu:22.04 AS john-builder
ENV DEBIAN_FRONTEND=noninteractive

# 1.1) Install build dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential wget tar gzip ca-certificates \
      libssl-dev zlib1g-dev unzip less pkg-config yasm && \
    rm -rf /var/lib/apt/lists/*

# 1.2) Install John (bleeding jumbo) to /opt/john
WORKDIR /opt
RUN wget https://github.com/openwall/john/archive/bleeding-jumbo.tar.gz && \
    tar xzf bleeding-jumbo.tar.gz && rm bleeding-jumbo.tar.gz && \
    mv john-bleeding-jumbo john && cd john/src && \
    ./configure --disable-native-arch && \
    make -s clean && make -sj"$(nproc)"

# ------ FINAL IMAGE --------
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

# 2.1) Install runtime dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends unzip less libgomp1 \
    wget ca-certificates whois && \
    rm -rf /var/lib/apt/lists/*

# 2.2) Create student user
RUN useradd -m -s /bin/bash student

# 2.3) Copy John install
COPY --from=john-builder /opt/john/run /opt/john/run
RUN chown -R student:student /opt/john/run

# 2.4) Switch to student user
USER student
WORKDIR /home/student

# 2.5) Add wrapper so 'john' always works in terminal
RUN mkdir -p ~/.local/bin && \
    printf '%s\n' '#!/usr/bin/env bash' \
                  'exec /opt/john/run/john "$@"' \
      > ~/.local/bin/john && \
    chmod +x ~/.local/bin/john && \
    ln -s ~/.local/bin/john ~/.local/bin/john-the-ripper
ENV PATH="/home/student/.local/bin:${PATH}"

# 2.6) Preload lab files
ARG SCRIPTS_REPO="https://raw.githubusercontent.com/codepath/cyb101-vm-setup/main/Files/"
RUN wget -q "${SCRIPTS_REPO}unit3/crackfiles.zip" -O ~/crackfiles.zip
RUN wget -q "${SCRIPTS_REPO}unit3/cp_leak.txt"   -O ~/password_leak.txt

# 2.7) Set up entrypoint script
COPY --chmod=755 docker/entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["bash"]
