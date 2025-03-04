FROM openjdk:17-jre-slim

WORKDIR /datacrow
RUN apt-get update && apt-get install -y wget unzip && \
    wget https://www.fosshub.com/Data-Crow.html?dwl=datacrow_4.11.0_installer.zip && \
    unzip datacrow_4_2.zip && \
    rm datacrow_4_2.zip

EXPOSE 9000
CMD ["java", "–Xmx1024m", "-jar", "/datacrow/datacrow-server.jar", "-userdir:/datacrow", "-port:9000", "imageserverport:9001", "-webserverport:8080", "credentials:admin/2xadmin"]
