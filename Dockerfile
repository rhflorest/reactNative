FROM fabernovel/android:api-33-v1.7.0
RUN apt-get update -y
RUN dpkg --configure -a
RUN apt-get -o Dpkg::Options::="--force-confnew" install --reinstall util-linux
RUN apt-get upgrade -y
RUN apt-get install curl
RUN curl -fsSL https://deb.nodesource.com/setup_16.x
RUN apt-get install -y nodejs
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
ENV NVM_DIR /root/.nvm
ENV SHIPPABLE_NODE_VERSION 16
RUN . "$NVM_DIR/nvm.sh" && nvm install $SHIPPABLE_NODE_VERSION && nvm use $SHIPPABLE_NODE_VERSION
RUN . "$NVM_DIR/nvm.sh" && nvm alias default $SHIPPABLE_NODE_VERSION
RUN . "$NVM_DIR/nvm.sh" && npm install -g npm
RUN . "$NVM_DIR/nvm.sh" && npm install -g n
RUN . "$NVM_DIR/nvm.sh" && npm i -g react-native
RUN  wget https://services.gradle.org/distributions/gradle-7.3.1-bin.zip -P /tmp
RUN unzip -d /opt/gradle /tmp/gradle-*.zip
ENV GRADLE_HOME=/opt/gradle/gradle-7.2
ENV PATH=${GRADLE_HOME}/bin:${PATH}
RUN gradle -v
RUN yes | sdkmanager --licenses || true
