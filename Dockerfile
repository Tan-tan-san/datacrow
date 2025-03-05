FROM openjdk:25-ea-jdk-slim-bookworm
#FROM jumpserver/openjdk:17-slim-bullseye

WORKDIR /datacrow
RUN apt-get update && apt-get install -y wget unzip libfreetype6 fontconfig fonts-dejavu-core && \
    wget https://datacrow.org/wp-content/uploads/versions/datacrow_4.9.1_server_zipped.zip && \
    unzip datacrow_4.9.1_server_zipped.zip && \
    rm datacrow_4.9.1_server_zipped.zip && \
    cd dc-server && \
    mkdir -p /datacrow/dc-server/data

EXPOSE 9000 9001 8080
CMD ["java", "-Xmx1024m", "-jar", "/datacrow/dc-server/datacrow-server.jar", "-dir:/datacrow/dc-server", "-userdir:/datacrow/dc-server/data", "-port:9000", "-imageserverport:9001", "-webserverport:8080", "-credentials:admin/2xadmin"]
