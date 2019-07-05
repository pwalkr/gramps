FROM ubuntu:18.04

RUN apt-get update && apt-get install --yes --no-install-recommends \
    ca-certificates\
    curl \
    gir1.2-gexiv2-0.10 \
    gir1.2-gtk-3.0 \
    python3-gi-cairo \
    python3-bsddb3 \
    sqlite \
    xdg-utils \
    && apt-get clean

RUN curl -L https://github.com/gramps-project/gramps/releases/download/v5.0.1/gramps_5.0.1-1_all.deb \
    > /tmp/gramps.deb \
    && dpkg -i /tmp/gramps.deb \
    && rm -f /tmp/gramps.deb

ENTRYPOINT /usr/bin/gramps
