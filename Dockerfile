FROM androidsdk/android-29:latest

ENV CORDOVA_VERSION 10.0.0
ENV IONIC_VERSION 6.11.12

# Update to NodeJS 12
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt update && apt install -y nodejs
RUN apt install -y gradle

# Expose default ADB port
EXPOSE 5037

# Set up PATH
ENV PATH $PATH:/opt/platform-tools

# Install Ionic and Cordova
RUN npm install -g --unsafe-perm cordova@${CORDOVA_VERSION} @ionic/cli@${IONIC_VERSION} native-run

# Disable Ionic updates and clean apt
RUN ionic config set -g daemon.updates false
RUN rm -rf /var/lib/apt/lists/* && apt autoclean
