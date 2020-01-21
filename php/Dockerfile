FROM php:7.4-fpm

ADD sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y netcat \
            procps \
            coreutils \
            inetutils-ping \
            lrzsz \
            libzip4 \
            zip \
            unzip \
            git \
            libzip-dev
RUN docker-php-source extract \
    && apt install -y librdkafka-dev libmemcached-dev zlib1g-dev \
    && pecl install redis-5.1.1 \
    && pecl install yaf-3.0.9 \
    && pecl install swoole-4.4.15 \
    && pecl install xdebug-2.8.1 \
    && pecl install rdkafka-4.0.2 \
    && pecl install memcached-3.1.4 \
    && docker-php-ext-enable memcached redis xdebug rdkafka swoole yaf \
    && docker-php-source delete

RUN apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libsasl2-dev \
    libicu-dev \
    libgmp3-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install gmp pdo_mysql iconv intl pcntl opcache bcmath mbstring \
    && pecl update-channels

COPY conf /usr/local/etc

COPY composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

RUN /usr/local/bin/composer config -g repo.packagist composer https://packagist.laravel-china.org


RUN usermod -u 1000 www-data

RUN chown -R www-data.www-data /usr/local/var/log /usr/local/var/run

RUN touch /usr/local/var/log/php-fpm.log && chmod 777 /usr/local/var/log/php-fpm.log