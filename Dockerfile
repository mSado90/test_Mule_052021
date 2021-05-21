FROM java:openjdk-8-jdk

#Add  Mule runtime to the Docker container
RUN echo "Adding Mule 4.3.0 to Docker container"
ADD  mule-ee-distribution-standalone-4.3.0-20210119.zip /opt

#Add Work Directory
RUN echo "Adding Work Directory"
WORKDIR /opt

#Extract and install the Mule runtime in the container
RUN echo "Extracting the zip file and installing the Mule runtime"
RUN         unzip mule-ee-distribution-standalone-4.3.0-20210119.zip && \
    rm mule-ee-distribution-standalone-4.3.0-20210119.zip

# CMD ["mule-enterprise-standalone-4.3.0-20210119/bin"]

#Copy and deploy mule application in the Mule 4.3.0 runtime
RUN echo "Deploying mule application in runtime"
COPY  ./target/20-may-simple-http-get.jar mule-enterprise-standalone-4.3.0-20210119/apps
RUN ls -ltr mule-enterprise-standalone-4.3.0-20210119/apps

# Expose the port 8081 as needed
EXPOSE      8081

# Start Mule runtime
RUN echo "Starting Mule runtime 4.3.0"
CMD         ["mule-enterprise-standalone-4.3.0-20210119/bin/mule"]