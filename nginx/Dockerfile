FROM nginx
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\
            deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\
            deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\
            deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\
            deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse\
            deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\
            deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\
            deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\
            deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\
            deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse" >/etc/apt/source.list
RUN apt-get update
RUN apt-get install -y net-tools
RUN apt-get install -y vim
RUN apt-get install -y netcat
RUN apt-get install -y procps
RUN apt-get install -y coreutils
RUN apt-get install -y inetutils-ping
COPY conf /etc/nginx