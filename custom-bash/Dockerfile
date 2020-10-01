FROM alpine

RUN apk add --update alpine-sdk

ARG DIRNAME="bash"
ARG FILENAME="bash-5.0"
ARG EXTENSION="tar.gz"

WORKDIR /${DIRNAME}

ADD https://ftp.gnu.org/gnu/bash/${FILENAME}.${EXTENSION} .

RUN tar -xvf ${FILENAME}.${EXTENSION} && rm ${FILENAME}.${EXTENSION}

WORKDIR ${FILENAME}

RUN ./configure  \
    --prefix=/usr \
    --bindir=/bin \
    --htmldir=/usr/share/doc/${FILENAME} \
    --without-bash-malloc \
    --with-installed-readline

RUN make

RUN make install

WORKDIR /

RUN rm -rf /${DIRNAME}

ENTRYPOINT [ "bash", "-c" ]