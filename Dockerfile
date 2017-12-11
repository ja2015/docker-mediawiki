FROM mediawiki:latest

RUN a2enmod rewrite

# Extensions setup
WORKDIR /var/www/html/extensions

# Extension:UserMerge https://www.mediawiki.org/wiki/Extension:UserMerge
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Scribunto.git \
&& git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/VisualEditor.git \
&& git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/UserMerge.git \
&& git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/MobileFrontend.git \
&& git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Popups.git \
&& git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/ApiFeatureUsage.git \
&& git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Collection.git \
&& git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/GlobalUsage.git \
&& git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CategoryTree.git \
&& git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CodeMirror.git \
&& git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/timeline.git \
&& git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/LabeledSectionTransclusion.git \
&& git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/RelatedArticles.git \
&& git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CodeEditor.git \
&& git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/GeoData.git \
&& git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/TextExtracts.git \
&& git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/PageImages.git \
&& git submodule foreach 'git checkout -b REL1_29 origin/REL1_29 || :'

WORKDIR /var/www/html
