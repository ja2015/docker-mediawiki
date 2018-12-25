FROM scratch
COPY files /
WORKDIR /var/www/html
ENV PATH "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
ENV PHPIZE_DEPS "autoconf 		dpkg-dev dpkg 		file 		g++ 		gcc 		libc-dev 		make 		pkgconf 		re2c"
ENV PHP_INI_DIR "/usr/local/etc/php"
ENV PHP_EXTRA_CONFIGURE_ARGS "--enable-fpm --with-fpm-user"
ENV PHP_CFLAGS "-fstack-protector-strong -fpic -fpie -O2"
ENV PHP_CPPFLAGS "-fstack-protector-strong -fpic -fpie -O2"
ENV PHP_LDFLAGS "-Wl,-O1 -Wl,--hash-style"
ENV GPG_KEYS "A917B1ECDA84AEC2B568FED6F50ABC807BD5DCD0 528995BFEDFBA7191D46839EF9BA0ADA31CBD89E 1729F83938DA44E27BA0F4D3DBDB397470D12172"
ENV PHP_VERSION "7.1.25"
ENV PHP_URL "https://secure.php.net/get/php-7.1.25.tar.xz/from/this/mirror"
ENV PHP_ASC_URL "https://secure.php.net/get/php-7.1.25.tar.xz.asc/from/this/mirror"
ENV PHP_SHA256 "0fd8dad1903cd0b2d615a1fe4209f99e53b7292403c8ffa1919c0f4dd1eada88"
ENV PHP_MD5 ""
ENV MEDIAWIKI_MAJOR_VERSION "1.31"
ENV MEDIAWIKI_BRANCH "REL1_31"
ENV MEDIAWIKI_VERSION "1.31.1"
ENV MEDIAWIKI_SHA512 "ee49649cc37d0a7d45a7c6d90c822c2a595df290be2b5bf085affbec3318768700a458a6e5b5b7e437651400b9641424429d6d304f870c22ec63fae86ffc5152"
EXPOSE 9000/tcp
ENTRYPOINT ["docker-php-entrypoint"]
CMD ["php-fpm"]
