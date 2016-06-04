#Create a jenkins image with android from one with nodejs npm and meteor available
FROM ocasta/android-jenkins:latest
MAINTAINER Jack Kavanagh (http://jackkav.github.io)

#install node 4
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash && apt-get install -y nodejs

#install meteor
RUN curl https://install.meteor.com/ | sh && export PATH=$PATH:$HOME/.meteor

#TODO: add android-23 platform and expect to auto accept licenses
#android update sdk --no-ui --all --filter android-23
