# docker-mediawiki
MediaWiki Docker image / With Additional Extension - MobileFrontend, UserMerge, VisualEditor -  
.htaccess is enabled.
set the volume like below

docker-compose example
```
volumes:
  - /var/www/html/images
  - ./LocalSettings.php:/var/www/html/LocalSettings.php
  - ./.htaccess:/var/www/html/.htaccess
```

## How to use

### Basic usage
This image based from official mediawiki image.
See the fllowing link.
https://hub.docker.com/r/_/mediawiki/

### Additional Extension
Usage of extensions are in the fllowing links.

#### MobileFrontend
https://www.mediawiki.org/wiki/Extension:MobileFrontend

#### UserMerge
https://www.mediawiki.org/wiki/Extension:UserMerge

#### VisualEditor
https://www.mediawiki.org/wiki/Extension:VisualEditor
