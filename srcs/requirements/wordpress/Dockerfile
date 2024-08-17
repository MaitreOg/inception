FROM debian:bullseye

#instal package
RUN apt update -y && apt upgrade -y
RUN apt install -y wget\
    php7.4-fpm \
    php7.4-mysql \
    php7.4-curl\
    mariadb-client

#create config directory
RUN mkdir -p /var/www/html


#dowload wordpress and set up it
RUN wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.4.3.tar.gz && rm -rf wordpress-6.4.3.tar.gz
RUN mv /var/www/wordpress /var/www/html

#add permission
RUN chown -R www-data:www-data /var/www/html

#copy cofig file && script shell
COPY tool/auto-config.sh     /usr/local/bin/auto-config.sh
COPY conf/www.conf /usr/local/etc/php-fpm.d/www.conf

#download cli and set up it
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

#execute script shell
RUN chmod +x /usr/local/bin/auto-config.sh
CMD ["/usr/local/bin/auto-config.sh"]