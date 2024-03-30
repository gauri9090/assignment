#Use a base image 
FROM alpine:latest

#Copy the script into the container
COPY /home/graghuva/Gauri/getMetricsScript.sh /getMetricsScript.sh

#Grant executable permissions to the script
RUN chmod +x /getMetricsScript.sh

#Command to execute the script
CMD ["./getMetricsScript.sh"]
