FROM anthonymonori/android-ci-image:latest
RUN apt-get update -y
RUN apt-get install --reinstall util-linux
RUN apt-get upgrade -y
RUN apt-get install -y nodejs
RUN npm install -g n
RUN npm i -g react-native
RUN n latest
RUN node --version
RUN  wget https://services.gradle.org/distributions/gradle-7.2-bin.zip -P /tmp
RUN unzip -d /opt/gradle /tmp/gradle-*.zip
ENV GRADLE_HOME=/opt/gradle/gradle-7.2
ENV PATH=${GRADLE_HOME}/bin:${PATH}
RUN gradle -v
RUN yes | sdkmanager --licenses || true
