FROM php:7.2-apache

RUN a2enmod rewrite

# Update apt cache
RUN apt-get update

#Install dependencies for the operating system softwa
RUN apt-get install -y libpq-dev
        
# Install extensions for php
RUN docker-php-ext-install pdo_pgsql mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd \
    && apt-get install -y vim \
    && rm -rf /var/lib/apt/lists/*

COPY  . /var/www/html/
WORKDIR /var/www/html/

