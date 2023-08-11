FROM php:8.2.8-fpm-alpine
RUN docker-php-ext-install pdo pdo_mysql
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY ./app /var/www/html
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN composer install --no-interaction && composer update
