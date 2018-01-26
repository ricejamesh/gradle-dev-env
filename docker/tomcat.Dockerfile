FROM tomcat:8.5.27-jre8-alpine
RUN chown -R 1000:1000 /usr/local/tomcat

# Maintainer 
MAINTAINER James Rice <James.Rice@ttg-solutions.com>

# Map CATALINA_BASE to a folder that's soon to created.
ENV CATALINA_BASE=/catalina-base

# Bring over our project tomcat configuration files.
ADD catalina-base/conf/ ${CATALINA_BASE}/conf

# Set ownership of tomcat to uid 1000.  This maps to my 
# uid in my development environment.  Otherwise ownership
# of created log files are set to root which is just annoying
# when you look at them from a local IDE.
RUN chown -R 1000:1000 ${CATALINA_BASE}

# Set current user as myself.  Operations after this will be 
# performed as UID 1000.
USER 1000:1000

# Make a folder that Tomcat looks for.
RUN mkdir ${CATALINA_BASE}/temp \
    && mkdir ${CATALINA_BASE}/work \
    && mkdir ${CATALINA_BASE}/webapps \
    && mkdir ${CATALINA_BASE}/logs \
    && echo "tomcat-dev hello world!" > ${CATALINA_BASE}/logs/greetings.txt

# Create a logs volume to allow the tomcat logs to stay around
# after container destruction.
VOLUME ["${CATALINA_BASE}/logs"]

# To add your war file, uncomment the next line,
# ADD build/libs/*.war ${CATALINA_BASE}/webapps/

# Make our command run as user 1000
CMD ["catalina.sh", "run"]

# My build command is going to be executed from the project root folder (one up from this file):
# docker image build -t ricejamesh/tomcat-dev -f ./docker/tomcat.Dockerfile .

# Simple way to see how things deployed inside...
# docker run  -it --rm -p 8888:8080 ricejamesh/tomcat-dev /bin/bash

# Run, as-is...
# docker run  -it --rm -p 8888:8080 ricejamesh/tomcat-dev

# Run, with local catalina/conf mapped in...
# This should keep the logs local to the development environment.
# docker run -v "$PWD/catalina-base/webapps":/catalina-base/webapps --name tomcat -it --rm -p 8888:8080 ricejamesh/tomcat-dev