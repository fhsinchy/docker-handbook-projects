FROM ubuntu:latest

EXPOSE 80

RUN apt-get update && \
    apt-get install build-essential\ 
    libpcre3 \
    libpcre3-dev \
    zlib1g \
    zlib1g-dev \
    libssl1.0 \
    libssl-dev \
    -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY nginx-1.20.2.tar.gz .

RUN tar -xvf nginx-1.20.2.tar.gz && rm nginx-1.20.2.tar.gz

RUN cd nginx-1.20.2 && \
    ./configure \
    --sbin-path=/usr/bin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --with-pcre \
    --pid-path=/var/run/nginx.pid \
    --with-http_ssl_module && \
    make && make install

RUN rm -rf /nginx-1.20.2

CMD [ "nginx", "-g", "daemon off;" ]
