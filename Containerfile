ARG BASE_IMAGE="ghcr.io/gbraad-devenv/fedora/rdesktop"
ARG BASE_VERSION=41

FROM ${BASE_IMAGE}:${BASE_VERSION}

USER root

RUN URL="https://download.jetbrains.com/cpp/CLion-2025.1.1.tar.gz" \
    && INSTALL_DIR="/opt/clion" \
    && mkdir -p "$INSTALL_DIR" \
    && curl -L "$URL" -o /tmp/clion.tar.gz \
    && tar --strip-components=1 -xzf /tmp/clion.tar.gz -C "$INSTALL_DIR" \
    && rm /tmp/clion.tar.gz

RUN git config -f /etc/rdesktop/rdesktop.ini \
	rdesktop.title "CLion 2025.1" \
    && git config -f /etc/rdesktop/rdesktop.ini \
	rdesktop.exec "/opt/clion/bin/clion.sh"

# ensure to become root for systemd
#ENTRYPOINT ["/sbin/init"]
