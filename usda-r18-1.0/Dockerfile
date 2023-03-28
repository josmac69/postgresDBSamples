FROM postgres:latest

# Set the default environment variables
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB mydb

# Copy the initialization SQL script to the image
COPY init.sql /docker-entrypoint-initdb.d/

# Change ownership and permissions of the initialization SQL script
RUN chown postgres:postgres /docker-entrypoint-initdb.d/init.sql && \
    chmod 755 /docker-entrypoint-initdb.d/init.sql

    # && \
    # apt-get update -y && \
    # apt-get install -y locales locales-all && \
    # localedef -f CP1252 -i en_US English_United && \
    # localedef -f CP1252 -i en_US "English_United States.1252"

# Initialize the database during the image build process
RUN /usr/local/bin/docker-entrypoint.sh postgres & sleep 10 \
    && psql -h localhost -U postgres -f /docker-entrypoint-initdb.d/init.sql mydb

# Clean up after initialization
RUN rm /docker-entrypoint-initdb.d/init.sql
