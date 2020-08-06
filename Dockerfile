FROM beevelop/cordova:v9.0.0

ENV IONIC_VERSION 5.4.6

RUN apt-get update && apt-get install -y git bzip2 openssh-client gradle
RUN npm i -g --unsafe-perm ionic@${IONIC_VERSION}
RUN ionic config set -g daemon.updates false
RUN rm -rf /var/lib/apt/lists/* && apt-get clean

RUN chmod -R 777 /opt/android
