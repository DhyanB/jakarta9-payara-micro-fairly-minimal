# About this project

This is a fairly minimal example of a Jakarta EE 9 microservice running on Payara Micro.

Fairly minimal means that the MicroProfile, Lombok, SLF4J logging and some boilerplate are already
included for convenience.

# Requirements

- Linux-like shell
- Make
- JDK 11
- Gradle
- Docker & Docker Compose

# Building and running

    sudo make cb         # Clean up and build the WAR file
    sudo make up         # Start container
    sudo make logs       # Observe container logs

    curl http://localhost:8080/api/hello

    sudo make down       # Stop and remove container

Run `make` for a full list of available commands.