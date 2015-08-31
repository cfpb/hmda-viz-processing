FROM ubuntu:14.04

MAINTAINER David Roell <kibrael.roell@cfpb.gov>

RUN apt-get update \
        && apt-get install -y python python-dev python-distribute python-pip \
        && apt-get install -y software-properties-common


#mount data volumes for output
VOLUME /disclosure
VOLUME /aggregate

COPY requirements.txt /processing/
RUN  pip install -r /processing/requirements.txt

RUN sudo apt-get install -y python-psycopg2
COPY *.py  /processing/
COPY MSAinputs2013.csv /processing/
COPY /testing/* /testing/
COPY readme.md /processing/
COPY developer_documentation.md /processing/


#docker run -it --name Mantis -v /Users/roellk/desktop/HMDA/hmda-viz-prototype/:/viz ubuntu:14.04
#https://github.com/cfpb/hmda-viz-prototype
# docker run -it --name mantis --link db:db mantis