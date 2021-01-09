FROM python:3-buster

WORKDIR /zone

RUN apt-get update && \
    apt-get install git -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install git+https://github.com/fhsinchy/rmbyext.git#egg=rmbyext

RUN apt-get remove --purge git -y

RUN useradd human && \
    chown -R human /zone

USER human

ENTRYPOINT [ "rmbyext" ]