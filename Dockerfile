FROM mediawiki:latest

RUN a2enmod rewrite

# Extensions setup
WORKDIR /var/www/html/extensions

# Extension:UserMerge https://www.mediawiki.org/wiki/Extension:UserMerge
RUN curl -fSL "https://extdist.wmflabs.org/dist/extensions/UserMerge-REL1_29-de5f67d.tar.gz" -o UserMerge.tar.gz \
        && tar -xz -f UserMerge.tar.gz \
        && rm UserMerge.tar.gz

# Extension:MobileFrontend https://www.mediawiki.org/wiki/Extension:MobileFrontend
RUN curl -fSL "https://extdist.wmflabs.org/dist/extensions/MobileFrontend-REL1_29-4f7aee1.tar.gz" -o MobileFrontend.tar.gz \
        && tar -xz -f MobileFrontend.tar.gz \
        && rm MobileFrontend.tar.gz

# Extension:VisualEditor https://www.mediawiki.org/wiki/Extension:VisualEditor
RUN curl -fSL "https://extdist.wmflabs.org/dist/extensions/VisualEditor-REL1_29-b655946.tar.gz" -o VisualEditor.tar.gz \
        && tar -xz -f VisualEditor.tar.gz \
        && rm VisualEditor.tar.gz

WORKDIR /var/www/html
