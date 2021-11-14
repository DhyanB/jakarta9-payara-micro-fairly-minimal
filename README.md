### About this project

A fairly minimal Jakarta EE 9 microservice running on Payara Micro.

Fairly minimal in that the MicroProfile, Lombok, SLF4J and some boilerplate are already included.

### Requirements

Shell + make + jdk11 + gradle + docker + docker-compose

### Building and running

    sudo make cb         # Clean up and build the WAR file
    sudo make up         # Start container
    sudo make logs       # Observe container logs

    curl http://localhost:8080/api/hello

    sudo make down       # Stop and remove container

Run `make` for a full list of available commands.