PATH:=node_modules/.bin:$(PATH)

default: compile

.PHONY: setup compile node clean

setup:
	npm install -g bower purescript
	bower install

compile:
	psc       'bower_components/**/*.purs' \
	    --ffi 'bower_components/**/*.js' \
	          '04-import-functions/**/*.purs' \
	    --ffi '04-import-functions/**/*.js' \
	    --output purescript_modules/

node: export NODE_PATH=purescript_modules
node:
	node

clean:
	rm -rf purescript_modules/
