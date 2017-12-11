FROM mediawiki:latest

RUN a2enmod rewrite

# Extensions setup
WORKDIR /var/www/html/extensions
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Scribunto.git
WORKDIR /var/www/html/extensions/Scribunto
RUN git checkout -b ${MEDIAWIKI_BRANCH} origin/${MEDIAWIKI_BRANCH}

WORKDIR /var/www/html/extensions
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/VisualEditor.git
WORKDIR /var/www/html/extensions/VisualEditor
RUN git checkout -b ${MEDIAWIKI_BRANCH} origin/${MEDIAWIKI_BRANCH}

WORKDIR /var/www/html/extensions
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/UserMerge.git
WORKDIR /var/www/html/extensions/UserMerge
RUN git checkout -b ${MEDIAWIKI_BRANCH} origin/${MEDIAWIKI_BRANCH}

WORKDIR /var/www/html/extensions
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/MobileFrontend.git
WORKDIR /var/www/html/extensions/MobileFrontend
RUN git checkout -b ${MEDIAWIKI_BRANCH} origin/${MEDIAWIKI_BRANCH}

WORKDIR /var/www/html/extensions
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Popups.git
WORKDIR /var/www/html/extensions/Popups
RUN git checkout -b ${MEDIAWIKI_BRANCH} origin/${MEDIAWIKI_BRANCH}

WORKDIR /var/www/html/extensions
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/ApiFeatureUsage.git
WORKDIR /var/www/html/extensions/ApiFeatureUsage
RUN git checkout -b ${MEDIAWIKI_BRANCH} origin/${MEDIAWIKI_BRANCH}

WORKDIR /var/www/html/extensions
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Collection.git
WORKDIR /var/www/html/extensions/Collection
RUN git checkout -b ${MEDIAWIKI_BRANCH} origin/${MEDIAWIKI_BRANCH}

WORKDIR /var/www/html/extensions
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/GlobalUsage.git
WORKDIR /var/www/html/extensions/GlobalUsage
RUN git checkout -b ${MEDIAWIKI_BRANCH} origin/${MEDIAWIKI_BRANCH}

WORKDIR /var/www/html/extensions
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CategoryTree.git
WORKDIR /var/www/html/extensions/CategoryTree
RUN git checkout -b ${MEDIAWIKI_BRANCH} origin/${MEDIAWIKI_BRANCH}

WORKDIR /var/www/html/extensions
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CodeMirror.git
WORKDIR /var/www/html/extensions/CodeMirror
RUN git checkout -b ${MEDIAWIKI_BRANCH} origin/${MEDIAWIKI_BRANCH}

WORKDIR /var/www/html/extensions
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/timeline.git
WORKDIR /var/www/html/extensions/timeline
RUN git checkout -b ${MEDIAWIKI_BRANCH} origin/${MEDIAWIKI_BRANCH}

WORKDIR /var/www/html/extensions
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/LabeledSectionTransclusion.git
WORKDIR /var/www/html/extensions/LabeledSectionTransclusion
RUN git checkout -b ${MEDIAWIKI_BRANCH} origin/${MEDIAWIKI_BRANCH}

WORKDIR /var/www/html/extensions
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/RelatedArticles.git
WORKDIR /var/www/html/extensions/RelatedArticles
RUN git checkout -b ${MEDIAWIKI_BRANCH} origin/${MEDIAWIKI_BRANCH}

WORKDIR /var/www/html/extensions
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CodeEditor.git
WORKDIR /var/www/html/extensions/CodeEditor
RUN git checkout -b ${MEDIAWIKI_BRANCH} origin/${MEDIAWIKI_BRANCH}

WORKDIR /var/www/html/extensions
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/GeoData.git
WORKDIR /var/www/html/extensions/GeoData
RUN git checkout -b ${MEDIAWIKI_BRANCH} origin/${MEDIAWIKI_BRANCH}

WORKDIR /var/www/html/extensions
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/TextExtracts.git
WORKDIR /var/www/html/extensions/TextExtracts
RUN git checkout -b ${MEDIAWIKI_BRANCH} origin/${MEDIAWIKI_BRANCH}

WORKDIR /var/www/html/extensions
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/PageImages.git
WORKDIR /var/www/html/extensions/PageImages
RUN git checkout -b ${MEDIAWIKI_BRANCH} origin/${MEDIAWIKI_BRANCH}

WORKDIR /var/www/html
