FROM postgres:11

# Set the default environment variables
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB mydb

# Copy the initialization SQL script to the image
COPY init.sql /docker-entrypoint-initdb.d/

# Change ownership and permissions of the initialization SQL script
RUN chown postgres:postgres /docker-entrypoint-initdb.d/init.sql && \
    chmod 755 /docker-entrypoint-initdb.d/init.sql

CMD ["postgres"]