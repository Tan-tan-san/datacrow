FROM openjdk:11-jre-slim

WORKDIR /datacrow
RUN apt-get update && apt-get install -y wget unzip && \
    wget https://datacrow.org/downloads/datacrow_4_2.zip && \
    unzip datacrow_4_2.zip && \
    rm datacrow_4_2.zip

EXPOSE 8080
CMD ["java", "-jar", "/datacrow/datacrow.jar"]
