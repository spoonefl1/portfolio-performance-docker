FROM openjdk:16-slim
LABEL maintainer="Markus Mayer <widemeadows@gmail.com>"

ENV DISPLAY=:0

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    ca-certificates curl \
    libgtk2.0-0 libswt-gtk* libcanberra-gtk-module libwebkitgtk-3.0.0 \
    && rm -rf /var/lib/apt/lists/*

ARG VERSION=0.50.3
ENV ARCHIVE=https://github.com/buchen/portfolio/releases/download/${VERSION}/PortfolioPerformance-${VERSION}-linux.gtk.x86_64.tar.gz

RUN useradd -ms /bin/bash portfolio && mkdir /data && chown portfolio /opt /data
USER portfolio

RUN cd /opt && (curl -L ${ARCHIVE} | tar xvz)

WORKDIR /data
CMD /opt/portfolio/PortfolioPerformance
