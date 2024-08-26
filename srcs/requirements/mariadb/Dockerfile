FROM debian:bullseye

#install package
RUN apt-get update && \
    apt-get install -y mariadb-server

#add permission
RUN chown -R mysql:mysql /var/lib/mysql
RUN chmod -R 750 /var/lib/mysql

#copy config file
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

#run script shell
COPY tool/mariadb.sh /usr/local/bin/mariadb.sh  
RUN chmod +x /usr/local/bin/mariadb.sh

RUN echo "Vérification du script mariadb.sh :" && \
    ls -l /usr/local/bin/mariadb.sh

CMD /usr/local/bin/mariadb.sh