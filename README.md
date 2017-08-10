# PicoCMS Docker Container

This is a dockerized version of PicoCMS, a flat file content management system using Markdown, developed at http://picocms.org




## Pre-requisites

Install [Docker](https://docs.docker.com/engine/installation/) and [Docker Compose](https://docs.docker.com/compose/install/).

Retrieve the project from: [https://github.com/guillaumeprevost/docker-picocms](https://github.com/guillaumeprevost/docker-picocms)

## Usage

Use the standard `docker-compose` commands:

1. `docker-compose build`

2. `docker-compose up -d`

To stop the container:
`docker-compose down`

Once up and running, 4 docker volumes allow changes directly into the container:

- **plugins**: [pico_edit](https://github.com/blocknotes/pico_edit) plugin is pre-installed. Follow PicoCMS doc to [install plugins](http://picocms.org/docs/#plugins).  ([Find more plugins](https://github.com/picocms/Pico/wiki/Pico-Plugins))
- **themes**: the default theme is installed. Follow PicoCMS doc to [add or edit themes](http://picocms.org/docs/#themes)
- **content**: the initial sample content files are present. Follow PicoCMS doc to [create content](http://picocms.org/docs/#creating-content)
- **config**: The default config is set up. Follow PicoCMS doc to [change configuration](http://picocms.org/docs/#config)

## Backend - Pico Edit

The **pico_edit** plugin is pre-installed ([https://github.com/blocknotes/pico_edit](https://github.com/blocknotes/pico_edit)),. It enables editing pages directly from the web browser via a password-protected interface.

##### Access the backend
Visit: `http://<your_site>/pico_edit`
Initial password: `password`

##### Change the backend password

1. Generate SHA-1 from your desired password at [http://www.sha1-online.com/](http://www.sha1-online.com/)
2. Edit the file `plugins/pico_cms/config.php` and insert your sha1 hashed password instead of the existing one (variable *$backend_password*).
