FROM python:3-alpine

WORKDIR /zone

RUN apk add --no-cache git

RUN pip install git+https://github.com/fhsinchy/rmbyext.git#egg=rmbyext

RUN apk del git

ENTRYPOINT [ "rmbyext" ]