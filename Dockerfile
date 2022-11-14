# https://github.com/jiangmo1024/jenkins-dotnet
# https://hub.docker.com/r/jiangmo1024/jenkins-dotnet
FROM jenkins/jenkins:centos7

USER root
 
RUN rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm
RUN yum install -y dotnet-sdk-7.0
RUN dotnet --version
 
USER jenkins
