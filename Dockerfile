FROM composer
MAINTAINER jeff.tunessen@gmail.com

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /srv

RUN echo "install packages" \
    && composer global require squizlabs/php_codesniffer:^4.0 --no-suggest --no-ansi --no-interaction \
    && ln -s /srv/vendor/bin/phpcpd /usr/local/bin/phpcpd

ENTRYPOINT ["pdepend"]
CMD ["-"]