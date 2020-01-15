FROM logstash
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
ENTRYPOINT ["/usr/share/logstash/bin/logstash", "-f", "/etc/logstash/conf.d/tcp.conf"]
ADD tcp.conf /etc/logstash/conf.d/
ENV CATALINA_HOME /usr/local/tomcat
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone