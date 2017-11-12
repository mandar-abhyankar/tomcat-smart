# Tomcat-Smart
This Dockerfile can be used to build a docker an image of tomcat server with access to manager and host-manager

## Usage
1. Clone this repository using the Git command `git clone <repository-url>`
2. CD into the directory using command `cd <repository-name>`
3. Edit the work-files/tomcat-users.xml file to change the username and password as required
4. Build a docker image using the command `docker build -t tomcat-smart:latest .`
5. Run the container using the command `docker container run -d -p 8080:8080 tomcat-smart:latest`
