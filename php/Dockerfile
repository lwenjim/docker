FROM php:7.4-fpm
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\
            deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\
            deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\
            deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\
            deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse\
            deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\
            deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\
            deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\
            deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\
            deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse\
            deb http://deb.debian.org/debian buster main\
            deb http://security.debian.org/debian-security buster/updates main\
            deb http://deb.debian.org/debian buster-updates main" >/etc/apt/source.list
RUN apt-get update
RUN apt-get install -y net-tools
RUN apt-get install -y vim
RUN apt-get install -y netcat
RUN apt-get install -y procps
RUN apt-get install -y coreutils
RUN apt-get install -y inetutils-ping
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN docker-php-source extract \
    && apt install librdkafka-dev && pecl install rdkafka-4.0.2 \
    && pecl install redis-5.1.1 \
    && pecl install yaf-3.0.9 \
    && pecl install swoole-4.4.15 \
    && pecl install xdebug-2.8.1 \
    && docker-php-ext-enable redis xdebug rdkafka swoole yaf \
    && apt-get install -y libmemcached-dev zlib1g-dev \
    && pecl install memcached-3.1.4 \
    && docker-php-ext-enable memcached \
    && docker-php-source delete

COPY conf /usr/local/etc
