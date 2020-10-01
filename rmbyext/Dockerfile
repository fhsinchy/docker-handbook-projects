FROM python:3-buster

WORKDIR /zone

RUN apt-get update && \
    apt-get install git -y

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install git+https://github.com/fhsinchy/rmbyext.git#egg=rmbyext

ENTRYPOINT [ "rmbyext" ]