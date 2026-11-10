FROM php:8.4-fpm-alpine

# Установщик расширений: сам ставит системные зависимости
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions pdo_pgsql intl opcache zip

# git нужен Composer для некоторых пакетов
RUN apk add --no-cache git

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/api
