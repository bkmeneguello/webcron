FROM alpine:3.6 as build

RUN apk add --no-cache --virtual .build-deps \
    build-base \
    git \
    libev-dev \
    mariadb-dev \
    sqlite-dev \
    curl-dev \
    cmake
RUN git clone --recursive https://github.com/pschlan/cron-job.org.git /source
RUN cd /source/chronos && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make


FROM alpine:3.6

RUN apk add --no-cache \
    supervisor \
    gettext \
    libgcc \
    libstdc++ \
    sqlite-libs \
    libev \
    libcurl \
    mariadb-client-libs
COPY --from=build /source/chronos/build/chronos /usr/local/bin/chronos
COPY chronos.cfg.tpl /etc/chronos.cfg.tpl
COPY supervisord.conf /etc/supervisord.conf
COPY run.sh /run.sh

RUN adduser -SD -g '' chronos

ENV MYSQL_HOST=mysql \
    MYSQL_USER=chronos \
    MYSQL_PASS=chronos \
    MYSQL_DB=chronos

ENTRYPOINT ["/run.sh"]
