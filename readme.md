# Build WSO2 API-Manager Docker images

    $ docker build -f Dockerfile.builder -t tetracon/api-manager:2.6.0 .

## Docker run

	 $ docker network create --driver bridge selmasme-net
	 $ docker run -d -p 9443:9443 --name apim --network selmasme-net -t tetracon/apim:2.6.0
     $ docker run -d -p 9443:9443 --name apim --network="host" -t tetracon/apim:2.6.0

## How-to install Java8 in the container

    https://hub.docker.com/r/appcela/docker-debian-oracle-jdk/~/dockerfile/

## Login to API Publisher

    $ https://<host-address>:9443/publisher
    or
    https://localhost:9443/publisher
    
## API Store

    $ https://<host-address>:9443/store
    or
    $ https://localhost:9443/store

## API Gateway (Carbon)

    $ https://<host-address>:9443/carbon
    or
    https://localhost:9443/carbon

# Swagger API

## Swagger Editor installation for Docker

    $ docker pull swaggerapi/swagger-editor:latest
    $ docker run -d --name sw-editor -p 8080:8080 swaggerapi/swagger-editor
    $ http://localhost:8080

## Swagger Code Generator

    $ 