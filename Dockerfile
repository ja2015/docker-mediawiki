FROM mediawiki:latest

RUN a2enmod rewrite

# Extensions setup
WORKDIR /var/www/html/extensions

RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Scribunto.git
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/VisualEditor.git
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/UserMerge.git
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/MobileFrontend.git
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Popups.git
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/ApiFeatureUsage.git
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Collection.git
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/GlobalUsage.git
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CategoryTree.git
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CodeMirror.git
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/timeline.git
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/LabeledSectionTransclusion.git
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/RelatedArticles.git
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CodeEditor.git
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/GeoData.git
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/TextExtracts.git
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/PageImages.git
RUN git submodule foreach 'git checkout -b REL1_29 origin/REL1_29 || :'

WORKDIR /var/www/html
