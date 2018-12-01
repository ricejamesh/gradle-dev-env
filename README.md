# Basic Gradle/Tomcat development configuration.
## Uses Docker, Docker-Compose for development and testing.

```
docker image build -t ricejamesh/tomcat-dev -f ./docker/tomcat.Dockerfile .
```

```
docker run -v "$PWD":/home/code -e CATALINA_BASE=/home/code/catalina-base  --name tomcat -it --rm -p 8888:8080 tomcat:8.5.24-jre8-alpine

docker run -v "$PWD":/home/code -e CATALINA_BASE=/home/code/catalina-base  --name tomcat -it --rm -p 8888:8080 tomcat-dev
```


## Linux -- Building and running the tomcat dockerfile

### Use docker gradle to compile the war file.
```docker
docker run --rm -v "$PWD":/home/gradle/project -w /home/gradle/project gradle gradle deployToTomcat
```


### Run project in Tomcat:
```docker
docker run -v "$PWD":/home/code -e CATALINA_BASE=/home/code/catalina-base  --name tomcat -it --rm -p 8888:8080 tomcat:8.5.24-jre8-alpine
```


## Windows -- Building and running the tomcat dockerfile.
### The essential change between linux and windows are the $PWD and %cd% parameters in the docker commands.

### Use docker gradle to compile the war file.
```docker
docker run --rm -v "%cd%":/home/gradle/project -w /home/gradle/project gradle gradle deployToTomcat
```


### Run project in Tomcat:
```docker
docker run -v "%cd%":/home/code -e CATALINA_BASE=/home/code/catalina-base  --name tomcat -it --rm -p 8888:8080 tomcat:8.5.24-jre8-alpine
```

### Simple Testing
```bash
curl localhost:8080/gradle-tomcat-0.0.1-SNAPSHOT/rest/test
```
### Browser Testing
```
http://localhost:8888/project-0.0.1-SNAPSHOT/
```