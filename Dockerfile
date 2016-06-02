FROM index.alauda.cn/jackkav/meteor-jenkins-ci:latest
MAINTAINER Jack Kavanagh (http://jackkav.github.io)
USER root
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash \
    && apt-get install -y nodejs && node -v && npm --version
