FROM debian:bullseye

#instal package
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install nginx openssl -y

#create directory
RUN mkdir -p /etc/nginx/ssl /etc/nginx/conf.d

#run ssl
RUN openssl req -x509 -nodes \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=FR/ST=Perpignan/L=Perpignan/O=42/OU=42Perpignan/CN=smarty.42.fr/UID=login"

#copy config file
COPY conf/nginx.conf /etc/nginx/nginx.conf

#add permission
RUN chmod -R 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]