FROM mariadb:10.11
# Copia la struttura DB nella cartella speciale di inizializzazione di MariaDB
COPY ./db.sql /docker-entrypoint-initdb.d/
