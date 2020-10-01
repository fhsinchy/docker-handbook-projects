FROM ubuntu:latest

RUN apt-get update && \
    apt-get install build-essential\ 
                    libpcre3 \
                    libpcre3-dev \
                    zlib1g \
                    zlib1g-dev \
                    libssl-dev \
                    -y

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ARG DIRNAME="nginx"
ARG FILENAME="nginx-1.19.2"
ARG EXTENSION="tar.gz"

WORKDIR /${DIRNAME}

ADD https://nginx.org/download/${FILENAME}.${EXTENSION} .

RUN tar -xvf ${FILENAME}.${EXTENSION} && rm ${FILENAME}.${EXTENSION}

WORKDIR ${FILENAME}

RUN ./configure \
    --sbin-path=/usr/bin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --with-pcre \
    --pid-path=/var/run/nginx.pid \
    --with-http_ssl_module

RUN make

RUN make install

WORKDIR /

RUN rm -rf /${DIRNAME}

CMD ["nginx", "-g", "daemon off;"]