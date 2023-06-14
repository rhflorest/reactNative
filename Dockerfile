FROM anthonymonori/android-ci-image:latest
RUN apt-get update -y
RUN dpkg --configure -a
RUN apt-get -o Dpkg::Options::="--force-confnew" install --reinstall util-linux
RUN apt-get upgrade -y
RUN apt-get install curl
RUN curl -fsSL https://deb.nodesource.com/setup_16.x
RUN apt-get install -y nodejs
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
RUN export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
RUN nvm use 16
RUN npm install -g n
RUN npm i -g react-native
RUN  wget https://services.gradle.org/distributions/gradle-7.2-bin.zip -P /tmp
RUN unzip -d /opt/gradle /tmp/gradle-*.zip
ENV GRADLE_HOME=/opt/gradle/gradle-7.2
ENV PATH=${GRADLE_HOME}/bin:${PATH}
RUN gradle -v
RUN yes | sdkmanager --licenses || true
