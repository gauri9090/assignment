FROM ubuntu:latest


RUN apt-get -y update && apt-get -y install curl
#Copy the script into the container
COPY Gauri/getMetricsScript.sh /root/getMetricsScript.sh

#Grant executable permissions to the script
RUN chmod +x /root/getMetricsScript.sh

#Command to execute the script

CMD ["/bin/sh", "-c", "/root/getMetricsScript.sh && sleep 1200"]

