# Farming Simulator 22 Dockerfile

This project contains a Dockerfile for setting up a dedicated server for [Farming Simulator 22](https://www.farming-simulator.com/about.php), a game developed by Giants Software.

## Prerequisites

To use this Dockerfile, you need to have Docker installed on your machine. This is a Windows container, so make sure to switch to Windows containers if you're using Docker Desktop. If you don't have Docker installed, you can download it from the [official Docker website](https://www.docker.com/products/docker-desktop).

## Configuration

Before you can run the Docker container, you need to set up some environment variables:

* ``STEAMUSER``: Your Steam username
* ``STEAMPASS``: Your Steam password

These environment variables are used to log in to your Steam account and download the necessary game files. Please note that the used Steam account must have a Farming Simulator 22 license (i.e., you have purchased the game and it is in your library).

You can set these variables in a `.env` file in the same directory as your Dockerfile. The `.env` file should look like this:

```.env
STEAMUSER=your_steam_username
STEAMPASS=your_steam_password
```

Replace ``your_steam_username`` and ``your_steam_password`` with your actual Steam username and password.

## Updating the dedicatedServer.xml

Before building the container, you can update the `dedicatedServer.xml` file to your liking. This file contains various settings for the dedicated server.

To update the `dedicatedServer.xml`, open the file in a text editor, make your changes, and save the file. Then, proceed with building the Docker container. Your changes will be included in the built container.

## Persistent Volume

You might also want to add a persistent volume to ``C:\data`` inside the container. This will allow the game data to persist across multiple runs of the container. You can do this by adding the ``-v`` option to the ``docker run`` command, like this:

``docker run -it --env-file .env -v C:\path\on\host:C:\data fs22``

Replace ``C:\path\on\host`` with the path on your host machine where you want the game data to be stored.

## Running the Container

Once you have set up the environment variables and optional persistent volume, you can run the Docker container with the following command:

``docker run -it --env-file .env -v C:\path\on\host:C:\data fs22``

This will start the Farming Simulator 22 dedicated server in a Docker container.

## Known Issues

* Starting the dedicated server spawns a new shell: This means that the actual dedicated server logs are not visible in the container log. We are currently looking into solutions for this issue.
