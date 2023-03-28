FROM postgres:latest

# Set the default environment variables
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB mydb

# Copy the initialization SQL script to the image
COPY init.sql /docker-entrypoint-initdb.d/
COPY *.csv /data/

# Change ownership and permissions of the initialization SQL script
RUN chown postgres:postgres /docker-entrypoint-initdb.d/init.sql && \
    chmod 755 /docker-entrypoint-initdb.d/init.sql && \
    chown postgres:postgres /data/*.csv && \
    chmod 755 /data/*.csv

    # && \
    # apt-get update -y && \
    # apt-get install -y locales locales-all && \
    # localedef -f CP1252 -i en_US English_United && \
    # localedef -f CP1252 -i en_US "English_United States.1252"

# Initialize the database during the image build process
RUN /usr/local/bin/docker-entrypoint.sh postgres & sleep 10 \
    && psql -h localhost -U $POSTGRES_USER -f /docker-entrypoint-initdb.d/init.sql $POSTGRES_DB

# Clean up after initialization
RUN rm /docker-entrypoint-initdb.d/init.sql && rm /data/*.csv
