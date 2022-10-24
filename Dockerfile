FROM okteto/maven as builder
# RUN apt-get update
# RUN apt-get install maven -y
WORKDIR /project1
COPY . /project1/
RUN cd /project1 && mvn package

FROM tomcat:9 as tomcat
# RUN apt-get update && apt-get install maven -y
# WORKDIR /project1
# COPY . /project1/
# RUN cd /project1 && mvn package
COPY  --from=builder /project1/target/addressbook.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
