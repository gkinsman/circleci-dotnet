FROM circleci/node

USER root

# Install .NET SDK
RUN wget https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN apt-get update
RUN apt-get install apt-transport-https
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update
RUN apt-get install -y dotnet-sdk-3.1
 
# Install NerdBank.GitVersioning CLI
RUN dotnet tool install --tool-path /tools nbgv

RUN yarn global add @vue/cli