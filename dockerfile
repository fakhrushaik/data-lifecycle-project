# Use the official Apache Airflow image as the base image
FROM apache/airflow:2.4.3

# Switch to the root user to install system dependencies
USER root

# Install any system dependencies if required (uncomment and modify as needed)
# RUN apt-get update && apt-get install -y <your-system-dependencies>

# Switch back to the airflow user
USER airflow

# Install additional Python packages in a single RUN command to optimize layering
RUN pip install --no-cache-dir \
    pytrends \
    beautifulsoup4 \
    requests \
    pandas \
    psycopg2

# Copy your DAGs into the container
COPY airflow/dags /opt/airflow/dags

# Set the entrypoint to the Airflow command-line interface
ENTRYPOINT ["airflow"]

# Set the default command to the webserver (can be overridden in docker-compose)
CMD ["webserver"]