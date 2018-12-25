FROM scratch
COPY files /
WORKDIR /var/www/html
ENV PATH "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
ENV PHPIZE_DEPS "autoconf 		dpkg-dev 		file 		g++ 		gcc 		libc-dev 		make 		pkg-config 		re2c"
ENV PHP_INI_DIR "/usr/local/etc/php"
ENV APACHE_CONFDIR "/etc/apache2"
ENV APACHE_ENVVARS "/etc/apache2/envvars"
ENV PHP_EXTRA_BUILD_DEPS "apache2-dev"
ENV PHP_EXTRA_CONFIGURE_ARGS "--with-apxs2 --disable-cgi"
ENV PHP_CFLAGS "-fstack-protector-strong -fpic -fpie -O2"
ENV PHP_CPPFLAGS "-fstack-protector-strong -fpic -fpie -O2"
ENV PHP_LDFLAGS "-Wl,-O1 -Wl,--hash-style"
ENV GPG_KEYS "1729F83938DA44E27BA0F4D3DBDB397470D12172 B1B44D8F021E4E2D6021E995DC9FF8D3EE5AF27F"
ENV PHP_VERSION "7.2.13"
ENV PHP_URL "https://secure.php.net/get/php-7.2.13.tar.xz/from/this/mirror"
ENV PHP_ASC_URL "https://secure.php.net/get/php-7.2.13.tar.xz.asc/from/this/mirror"
ENV PHP_SHA256 "14b0429abdb46b65c843e5882c9a8c46b31dfbf279c747293b8ab950c2644a4b"
ENV PHP_MD5 ""
ENV MEDIAWIKI_MAJOR_VERSION "1.31"
ENV MEDIAWIKI_BRANCH "REL1_31"
ENV MEDIAWIKI_VERSION "1.31.1"
ENV MEDIAWIKI_SHA512 "ee49649cc37d0a7d45a7c6d90c822c2a595df290be2b5bf085affbec3318768700a458a6e5b5b7e437651400b9641424429d6d304f870c22ec63fae86ffc5152"
EXPOSE 80/tcp
ENTRYPOINT ["docker-php-entrypoint"]
CMD ["apache2-foreground"]
