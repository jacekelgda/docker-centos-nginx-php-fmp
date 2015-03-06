FROM jacekelgda/docker-centos-nginx:latest

RUN \
  yum install -y yum-utils && \

  `# Install PHP 5.6` \
  rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
  yum-config-manager -q --enable remi && \
  yum-config-manager -q --enable remi-php56 && \
  yum install -y php-fpm php-bcmath php-cli php-gd php-intl php-mbstring \
  	php-mcrypt php-mysql php-opcache php-pdo && \
  yum install -y --disablerepo=epel php-pecl-redis php-pecl-yaml && \

  yum clean all

ADD docker/images/php/container-files /

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer

