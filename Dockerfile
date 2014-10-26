FROM tutum/apache-php:latest
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -yq php5-sqlite git
RUN rm -fr /app && git clone https://github.com/munkireport/munkireport-php.git /app
ADD config.php /app/
ADD run.sh /
RUN chmod +x /run.sh

EXPOSE 80
CMD ["/run.sh"]