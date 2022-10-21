From tomcat:9
COPY . /project1
RUN cd project1 && mvn package
ADD target/addressbook.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
