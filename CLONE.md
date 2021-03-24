Instructions for installing a clone of the database.

# Prerequisites
* Latest Docker engine and Docker Compose (https://docs.docker.com/compose/install/)

# Installation
Clone the repository and all its submodules:

`git clone --recursive git@github.com:MfN-Berlin/AnimalAudiogramDatabase.git`

Then start the application with docker-compose:

`docker-compose up -d`

The first time this command is executed, it will pull the necessary Docker images from Docker Hub. The corresponding Dockerfiles can be found in the submodules pulled when cloning the main repository.

Five containers will be started:

**aad_frontend**

> A Drupal installation providing the Web interface

**aad_api**

> A JSON interface to the audiograms, primarily used by the frontend, but can also be queried as a REST API. See [API documentation](https://animalaudiograms.museumfuernaturkunde.berlin/apidoc).

**aad_db**

> A database server.

**aad_redis**

> A thread broker for the audiogram plotting threads.

**aad_goa**

> Log analysis service.

**aad_admin**

> Audiogram administration backend.

# Backend configuration

# Frontend Configuration
Obtain a SQL dump of the AAD frontend database. Copy the dump to the database container

`docker cp /tmp/dump_frontend.sql aad_db:/tmp/`

Enter the database container

`docker exec -ti aad_db /bin/bash`

Login to the database as the root user and create the frontend database. Exit the mysql command line client and import the SQL dump into the new database

`mysql -uroot -p frontend < /tmp/dump_frontend.sql`

Obtain a copy of the html Folder and copy it to /mount/html

Restart the containers. The Frontend should be available at `http://localhost`.

## Troubleshooting

https://websitemigrationguides.com/guide.php?migrate=6


