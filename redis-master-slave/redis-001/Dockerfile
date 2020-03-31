FROM daocloud.io/redis:latest
COPY sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y net-tools # ifconfig
RUN apt-get install -y netcat
RUN apt-get install -y coreutils
RUN apt-get install -y iputils-ping
COPY redis.conf /usr/local/etc/redis/redis.conf
COPY redis.conf /usr/local/etc/redis/sentinel.conf

CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
