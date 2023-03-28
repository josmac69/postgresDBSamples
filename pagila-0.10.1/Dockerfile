FROM postgres:latest

# Set the default environment variables
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB mydb

# Copy the initialization SQL script to the image
COPY init1.sql /docker-entrypoint-initdb.d/
COPY init2.sql /docker-entrypoint-initdb.d/

# Change ownership and permissions of the initialization SQL script
RUN chown postgres:postgres /docker-entrypoint-initdb.d/*.sql && \
    chmod 755 /docker-entrypoint-initdb.d/*.sql

EXPOSE 5432

CMD ["postgres"]