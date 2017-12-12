FROM mediawiki:latest

RUN a2enmod rewrite
RUN apt-get install -y lua5.1
# Extensions setup
WORKDIR /var/www/html/extensions

RUN git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Scribunto.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/VisualEditor.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/UserMerge.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/MobileFrontend.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Popups.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/ApiFeatureUsage.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Collection.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/GlobalUsage.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CategoryTree.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CodeMirror.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/timeline.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/LabeledSectionTransclusion.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/RelatedArticles.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CodeEditor.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/TextExtracts.git \
&& git clone -b ${MEDIAWIKI_BRANCH} https://gerrit.wikimedia.org/r/p/mediawiki/extensions/PageImages.git \
&& cd VisualEditor \
&& git submodule update --init

WORKDIR /var/www/html
