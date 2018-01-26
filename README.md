```
docker image build -t ricejamesh/tomcat-dev -f ./docker/tomcat.Dockerfile .
```

```
docker run -v "$PWD":/home/code -e CATALINA_BASE=/home/code/catalina-base  --name tomcat -it --rm -p 8888:8080 tomcat:8.5.24-jre8-alpine

docker run -v "$PWD":/home/code -e CATALINA_BASE=/home/code/catalina-base  --name tomcat -it --rm -p 8888:8080 tomcat-dev
```