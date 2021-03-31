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

> A Drupal installation providing the Web interface. After configuration, available at `http://localhost`

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

# Settings
Copy the file `env.tpl` to `.env` and set passwords or alternatively obtain a configuration file.

Copy the `.env` file to the Admin/src directory

`cp .env Admin/src/`

Copy the `.env` file to the API/src/API directory

`cp .env API/src/API`

# Backend configuration
Obtain a SQL dump of the audiogram data, e.g. from a backup. Copy the dump to the database container

`docker cp /tmp/dump_audiogrambase.sql aad_db:/tmp/`

Enter the database container

`docker exec -ti aad_db /bin/bash`

Login to the database as the root user and create the `audiogrambase` database. Exit the mysql command line client and import the SQL dump into the new database

`mysql -uroot -p audiogrambase < /tmp/dump_audiogrambase.sql`

# Frontend Configuration
Obtain a SQL dump of the AAD frontend database, e.g. from a backup. Copy the dump to the database container

`docker cp /tmp/dump_frontend.sql aad_db:/tmp/`

Enter the database container

`docker exec -ti aad_db /bin/bash`

Login to the database as the root user and create the `frontend` database. Exit the mysql command line client and import the SQL dump into the new database

`mysql -uroot -p frontend < /tmp/dump_frontend.sql`

Obtain a copy of the html Folder and copy it to /mount/html

# Network
If you are running only this application on your machine, then the provided configuration will work out-of-the-box.

However, if you are running several services on a single machine, you will need to:
* Check in `docker-compose.yml` that all ports are free, otherwise edit them
* Use a reverse proxy, e.g.Pound, to map the external URLs to the internal ports. A sample Pound configuration is provided in `resources/network`.

# Verifying
Test if the installation was successfull:
* http://localhost should show the frontend
* http://localhost:9083/admin/v1/start should show the administration backend
* http://localhost:9082/ should show the message 'Audiogrambase API'

## Troubleshooting

Contact: audiograms@mfn.berlin

Drupal migration howto:
https://websitemigrationguides.com/guide.php?migrate=6


