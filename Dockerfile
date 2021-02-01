FROM jenkins/jenkins

USER root
 
RUN uname -a && cat /etc/*release

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl libunwind8 gettext apt-transport-https && \
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
    sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/dotnetdev.list' && \
    apt-get update
 
RUN apt-get install -y dotnet-sdk-5.0 && \
    export PATH=$PATH:$HOME/dotnet && \
    dotnet --version
 
USER jenkins