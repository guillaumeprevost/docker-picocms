FROM php:5.6-apache

# Install Dependencies
RUN apt-get update && apt-get install -y git-core zlib1g-dev && \
    docker-php-ext-install zip

# Install S6
RUN curl -sL "https://github.com/just-containers/s6-overlay/releases/download/v1.16.0.0/s6-overlay-amd64.tar.gz" \
    | tar xz -C /

#Copy php.ini
COPY docker/php.ini /usr/local/etc/php/

#Services
COPY docker/s6/services.d /etc/services.d
COPY docker/s6/init.sh /etc/cont-init.d/init.sh

# Configure Apache
COPY docker/vhost.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite && \
a2enmod setenvif

# Permission
RUN usermod -aG root www-data

#Setting up composer
RUN mkdir -p /root/.composer/ && \
   curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN git clone https://github.com/picocms/Pico.git  /home/sites/picocms/

WORKDIR /home/sites/picocms/

RUN composer install

RUN cp ./config/config.php.template ./config/config.php

# Install pico_edit plugin
RUN mkdir ./plugins/pico_edit
RUN git clone https://github.com/blocknotes/pico_edit.git ./plugins/pico_edit
RUN rm -rf ./plugins/pico_edit/.git/
RUN sed -i "s/''/'5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8'/g" ./plugins/pico_edit/config.php
RUN chown -R www-data:www-data ./plugins/pico_edit

# Saves folders that will be mounted as Docker Volumes into 'init' folder to restore them after container starts
RUN mkdir init
RUN mv ./themes/ init
RUN mv ./config/ init
RUN mv ./plugins/ init

EXPOSE 80

ADD docker/run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
