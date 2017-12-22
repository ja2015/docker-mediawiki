FROM php:7.1-fpm-alpine

# System Dependencies.
RUN apk add --no-cache \
		git \
		imagemagick \
		icu-dev \
		lua5.1 \
		lua5.1-dev \
		# Required for SyntaxHighlighting
		python

# Install the PHP extensions we need
RUN docker-php-ext-install mbstring mysqli opcache intl

# Install the default object cache.
RUN pecl channel-update pecl.php.net \
	&& apk add --no-cache --virtual .build-deps \
		$PHPIZE_DEPS \
	&& pecl install apcu \
	&& docker-php-ext-enable apcu

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

# SQLite Directory Setup
RUN mkdir -p /var/www/data \
	&& chown -R www-data:www-data /var/www/data

# Version
ENV MEDIAWIKI_MAJOR_VERSION 1.30
ENV MEDIAWIKI_BRANCH REL1_30
ENV MEDIAWIKI_VERSION 1.30.0
ENV MEDIAWIKI_SHA512 ec4aeb08c18af0e52aaf99124d43cd357328221934d593d87f38da804a2f4a5b172a114659f87f6de58c2140ee05ae14ec6a270574f655e7780a950a51178643

# MediaWiki setup
WORKDIR /var/www/html
RUN curl -fSL "https://releases.wikimedia.org/mediawiki/${MEDIAWIKI_MAJOR_VERSION}/mediawiki-${MEDIAWIKI_VERSION}.tar.gz" -o mediawiki.tar.gz \
	&& echo "${MEDIAWIKI_SHA512} *mediawiki.tar.gz" | sha512sum -c - \
	&& tar -xz --strip-components=1 -f mediawiki.tar.gz \
	&& rm mediawiki.tar.gz \
	&& chown -R www-data:www-data extensions skins cache images

# Lua
RUN ln -s /usr/bin/lua5.1 /usr/bin/lua
# Extensions setup
WORKDIR /var/www/html/extensions

RUN git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CategoryTree.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CodeEditor.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CodeMirror.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/GeoData.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/intersection.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/LabeledSectionTransclusion.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/MobileFrontend.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/PageImages.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Popups.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/RelatedArticles.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Scribunto.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/TextExtracts.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/timeline.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/UserMerge.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/VisualEditor.git \
&& cd VisualEditor \
&& git submodule update --init \
&& cd .. \
&& rm -rf ./*/.git* ./*/LICENSE.txt ./*/README.md


# Skins setup
WORKDIR /var/www/html/skins

RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/skins/MinervaNeue.git

# Setup finish
VOLUME /var/www/html
WORKDIR /var/www/html
