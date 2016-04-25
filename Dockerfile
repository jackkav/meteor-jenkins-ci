FROM jenkins
#MAINTAINER Jack Kavanagh (http://jackkav.github.io)
#RUN mkdir -p /usr/share/jenkins/ref/plugins
#ADD https://updates.jenkins-ci.org/download/plugins/ws-cleanup/latest/ws-cleanup.hpi /usr/share/jenkins/ref/plugins/ws-cleanup.hpi
#ADD https://updates.jenkins-ci.org/download/plugins/scm-api/latest/scm-api.hpi /usr/share/jenkins/ref/plugins/scm-api.hpi
#ADD https://updates.jenkins-ci.org/download/plugins/git-client/latest/git-client.hpi /usr/share/jenkins/ref/plugins/git-client.hpi
#ADD https://updates.jenkins-ci.org/download/plugins/git/latest/git.hpi /usr/share/jenkins/ref/plugins/git.hpi
USER root
#RUN chown -R jenkins /usr/share/jenkins/ref/plugins

RUN apt-get update \
        && apt-get install -y build-essential python-dev
# if this is called "PIP_VERSION", pip explodes with "ValueError: invalid truth value '<VERSION>'"
ENV PYTHON_PIP_VERSION 8.1.1

RUN set -ex \
        && curl -fSL 'https://bootstrap.pypa.io/get-pip.py' | python2 \
        && pip install --no-cache-dir --upgrade pip==$PYTHON_PIP_VERSION \
        && find /usr/local \
                \( -type d -a -name test -o -name tests \) \
                -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
                -exec rm -rf '{}' + \
        && rm -rf /usr/src/python ~/.cache

# install "virtualenv", since the vast majority of users of this image will want it
RUN pip install --no-cache-dir numpy scikit-learn keras pandas
