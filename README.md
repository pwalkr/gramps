# Gramps Docker Container and Utility Scripts

Gramps is a free software project and community:
<https://gramps-project.org/introduction-WP/>

As a tool, gramps is a powerful organizational application for genealogical
research. This repository provides a portable means of running the gramps
application from any computer that can run [Docker](https://www.docker.com/).

## Usage

First-time setup: build the docker container

    docker build -t gramps docker/

To start a new database, or to pick up where you left off, run the included
start script:

    ./start.sh gramps

To use an existing database, copy your home database folder into the data
directory here:

    rsync -a $HOME/.gramps/ ./data/gramps

You can then start gramps with the command above.

---
**NOTE**
You will also need to copy any media elements into the `data` folder, and this
may require updating the source paths.

It is recommended to use a folder like `data/media` and also to link any files
using **relative paths**.

---
