import json
from fabric.api import local

def update():
    local('rm *.js')
    local('rm *.css')
    local('wget https://github.com/knsv/mermaid/archive/master.zip')
    local('unzip master.zip && rm master.zip')
    latest_version = json.loads(open('mermaid-master/bower.json').read())['version']
    local('cp mermaid-master/dist/mermaid.css .')
    local('cp mermaid-master/dist/mermaid.full.js .')
    local('rm -rf mermaid-master')
    print 'latest version: {0}'.format(latest_version)

def compress():
    local('uglifyjs mermaid.full.js --mangle --compress > mermaid.full.min.js')
