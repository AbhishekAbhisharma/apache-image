# Use your custom Ubuntu image as a base
FROM ubuntu:latest

# Update package lists and install Apache2
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2

# Set DefaultRuntimeDir to a valid directory
RUN mkdir -p /var/run/apache2

# Expose port 80
EXPOSE 80

# Copy custom apache2.conf to the Apache configuration directory
COPY apache2.conf /etc/apache2/sites-available/000-default.conf

# Copy custom index.html to the Apache document root
COPY index.html /var/www/html/

# Start Apache2 in the foreground
CMD ["apache2", "-D", "FOREGROUND"]

