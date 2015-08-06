FROM ubuntu:14.04

MAINTAINER David Roell <kibrael.roell@cfpb.gov>

RUN apt-get update
RUN apt-get install -y python python-dev python-distribute python-pip
RUN apt-get install -y software-properties-common

#mount data volumes for output
VOLUME /disclosure
VOLUME /aggregate

COPY aggregation.py /processing/
COPY builder.py /processing/
COPY connector.py /processing/
COPY constructor.py /processing/
COPY controller.py /processing/
COPY demographics_indexing.py /processing/
COPY file_check.py /processing/
COPY median_age_api.py /processing/
COPY msa_indexing.py /processing/
COPY MSAinputs2013.csv /processing/
COPY parsing.py /processing/
COPY queries.py /processing/
COPY report_list.py /processing/
COPY selector.py /processing/
COPY respondent_id_compiler.py /processing/
COPY /testing/* /testing/
COPY readme.md /processing/
COPY developer_documentation.md /processing/
COPY requirements.txt /processing/

RUN  pip install -r /processing/requirements.txt
RUN sudo apt-get install -y python-psycopg2

#docker run -it --name Mantis -v /Users/roellk/desktop/HMDA/hmda-viz-prototype/:/viz ubuntu:14.04
#https://github.com/cfpb/hmda-viz-prototype