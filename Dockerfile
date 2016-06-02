#Create a jenkins image with nodejs npm and meteor available
#designed to be used in china with alauda.cn
FROM index.alauda.cn/library/jenkins
MAINTAINER Jack Kavanagh (http://jackkav.github.io)
USER root
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash \
    && apt-get install -y nodejs && node -v && npm --version
RUN curl https://install.meteor.com/ | sh && export PATH=$PATH:$HOME/.meteor
