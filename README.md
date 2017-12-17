# docker-mediawiki
MediaWiki Docker image / With Additional Extension  
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
- CategoryTree
- CodeEditor
- CodeMirror
- GeoData
- DynamicPageList (Wikimedia)
- LabeledSectionTransclusion
- MobileFrontend
- PageImages
- Popups
- RelatedArticles
- Scribunto (Lua standalone)
- TextExtracts
- EasyTimeline
- UserMerge
- VisualEditor (Need Parsoid)
