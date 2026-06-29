FROM mysql:8

ENV MYSQL_ROOT_PASSWORD=admin123
ENV MYSQL_DATABASE=innovatech

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306