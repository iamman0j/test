FROM centos:latest
MAINTAINER Allan Espinosa "m.c.balasubramaian@ure.com"
RUN yum install -y unzip
ADD jdk1.8.0_111.zip /opt/jdk1.8.0_111.zip
RUN chmod 777 /opt/jdk1.8.0_111.zip && cd /opt
RUN unzip /opt/jdk1.8.0_111.zip -d /opt/
RUN rm -rf /opt/jdk1.8.0_111.zip 
ENV JAVA_HOME /opt/jdk1.8.0_111/bin
ENV PATH "$PATH:/opt/jdk1.8.0_111/bin"
ADD jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins
ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080
EXPOSE 22
CMD [""]
