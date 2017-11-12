# Use tomcat:latest base image
FROM tomcat:latest

# Author
MAINTAINER Mandar Abhyankar <mandar.abhyankar@live.com>

# Information
LABEL version="1.0"

# Update and upgrade the package repository(tomcat uses ubuntu base image)
# Upgrade operation also install Curl
RUN apt-get update && apt-get upgrade -y

# Install vim editor for editing files and curl for testing localhost
RUN apt-get install vim -y

# Remove context.xml files for manager and host-manager to copy user defined context.xml file
# Remove tomcat-users.xml file to copy user-defined tomcat-users.xml file
RUN rm /usr/local/tomcat/webapps/host-manager/META-INF/context.xml && \
    rm /usr/local/tomcat/webapps/manager/META-INF/context.xml && \
    rm /usr/local/tomcat/conf/tomcat-users.xml

# Copy user-defined context.xml to allow global access for manager and host-manager
COPY /work-files/context.xml /usr/local/tomcat/webapps/host-manager/META-INF/context.xml
COPY /work-files/context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml

# Copy user-defined tomcat-users.xml file
COPY /work-files/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
