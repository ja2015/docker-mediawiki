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
ENV MEDIAWIKI_MAJOR_VERSION 1.31
ENV MEDIAWIKI_BRANCH REL1_31
ENV MEDIAWIKI_VERSION 1.31.1
ENV MEDIAWIKI_SHA512 ee49649cc37d0a7d45a7c6d90c822c2a595df290be2b5bf085affbec3318768700a458a6e5b5b7e437651400b9641424429d6d304f870c22ec63fae86ffc5152

# MediaWiki setup
WORKDIR /var/www/html
RUN curl -fSL "https://releases.wikimedia.org/mediawiki/${MEDIAWIKI_MAJOR_VERSION}/mediawiki-${MEDIAWIKI_VERSION}.tar.gz" -o mediawiki.tar.gz \
	&& echo "${MEDIAWIKI_SHA512} *mediawiki.tar.gz" | sha512sum -c - \
	&& tar -xz --strip-components=1 -f mediawiki.tar.gz \
	&& rm mediawiki.tar.gz \
	&& chown -R www-data:www-data extensions skins cache images

# Lua
RUN ln -fs /usr/bin/lua5.1 /usr/bin/lua
# Extensions setup
WORKDIR /var/www/html/extensions

RUN git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CodeMirror.git \
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
&& cd lib/ve \
&& rm -rf ./.git* ./LICENSE.txt ./README.md \
&& cd /var/www/html/extensions \
&& rm -rf ./*/.git* ./*/LICENSE.txt ./*/README.md


# Skins setup
WORKDIR /var/www/html/skins

RUN git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/skins/MinervaNeue.git \
&& rm -rf ./*/.git* ./*/LICENSE.txt ./*/README.md

# Setup finish
VOLUME /var/www/html
WORKDIR /var/www/html
