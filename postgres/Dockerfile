# Dockerfile

FROM postgres:latest

# Optional: Set default env values (still overridable at runtime)
ENV POSTGRES_USER=placeholder
ENV POSTGRES_PASSWORD=placeholder123

# Copy custom configuration files (optional)
# COPY ./postgresql.conf /etc/postgresql/postgresql.conf
# COPY ./pg_hba.conf /etc/postgresql/pg_hba.conf

# Optional: Run initialization scripts
# Place .sql or .sh files in /docker-entrypoint-initdb.d/
# They will run automatically on container init (if data dir is empty)
COPY ./init.sql /docker-entrypoint-initdb.d/init.sql
