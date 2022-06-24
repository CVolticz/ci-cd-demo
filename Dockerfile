# reference: https://hub.docker.com/_/ubuntu/
FROM python:3.8-slim

# meta data for container labeling
LABEL maintainer="Ken Trinh <ktrinh.particle@gmail.com>"

# env language -> standardized to utf8
# fix encoding issues
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update --fix-missing                                                            \
    && apt-get install -y git                                                               \
    && export DEBIAN_FRONTEND=noninteractive                                                \
    && apt-get update -y                                                                    \
    && apt-get -y install tmux                                                              \
    && apt-get install software-properties-common -y                                        \
############
            build-essential python-dev python3-dev curl wget                                \
            libssl-dev                                                                      \
            libffi-dev                                                                      \
            libkrb5-dev                                                                     \
            liblzma-dev                                                                     \
            unixodbc-dev                                                                    \
            unixodbc                                                                        \
            libpq-dev                                                                       \
            jq                                                                              \
            vim
############

#install python 3 in the image
RUN apt-get -y install python3-pip
RUN pip3 install --upgrade pip

# install python specific packages
COPY requirements.txt .
RUN pip3 install --user -r requirements.txt

# making stdout unbuffered (any non empty string works)
ENV PYTHONUNBUFFERED="cicdtesting"

# uncomment for production purposes
# COPY . .
# CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]