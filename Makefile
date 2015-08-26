PATH:=node_modules/.bin:$(PATH)

default: compile

.PHONY: setup compile node clean 01 04

setup:
	npm install -g bower purescript
	bower install

compile: 01 04

01:
	psc       'bower_components/purescript-*/**/*.purs' \
	    --ffi 'bower_components/purescript-*/**/*.js' \
	          '01-infrastructure/src/purs/**/*.purs' \
	    --ffi '01-infrastructure/src/purs/**/*.js' \
	    --output purescript_modules/

04:
	psc       'bower_components/purescript-*/**/*.purs' \
	    --ffi 'bower_components/purescript-*/**/*.js' \
	          '04-foreign-export/src/purs/**/*.purs' \
	    --ffi '04-foreign-export/src/purs/**/*.purs.js' \
	    --output purescript_modules/

node: export NODE_PATH=purescript_modules
node:
	node

clean:
	rm -rf purescript_modules/
