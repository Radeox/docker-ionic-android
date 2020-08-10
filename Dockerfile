FROM befair/cordova:v10.0.0

ENV IONIC_VERSION 6.11.0

RUN apt-get update && apt-get install -y git bzip2 openssh-client openjdk-8-jdk gradle
RUN npm i -g --unsafe-perm @ionic/cli@${IONIC_VERSION}
RUN ionic config set -g daemon.updates false
RUN rm -rf /var/lib/apt/lists/* && apt-get clean

RUN chmod -R 777 /opt/android
