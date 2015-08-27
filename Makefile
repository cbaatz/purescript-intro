PATH:=node_modules/.bin:$(PATH)

default: compile

.PHONY: setup compile node clean psci 01 04 05 07

setup:
	npm install -g bower purescript
	bower install

compile: 01 04 05

01:
	psc       'bower_components/purescript-*/src/**/*.purs' \
	    --ffi 'bower_components/purescript-*/src/**/*.js' \
	          '01-infrastructure/src/purs/**/*.purs' \
	    --ffi '01-infrastructure/src/purs/**/*.js' \
	    --output purescript_modules/

04:
	psc       'bower_components/purescript-*/src/**/*.purs' \
	    --ffi 'bower_components/purescript-*/src/**/*.js' \
	          '04-foreign-export/src/purs/**/*.purs' \
	    --ffi '04-foreign-export/src/purs/**/*.js' \
	    --output purescript_modules/

05:
	psc       'bower_components/purescript-*/src/**/*.purs' \
	    --ffi 'bower_components/purescript-*/src/**/*.js' \
	          '05-foreign-import/src/purs/**/*.purs' \
	    --ffi '05-foreign-import/src/purs/**/*.js' \
	    --output purescript_modules/

07:
	psc       'bower_components/purescript-*/src/**/*.purs' \
	    --ffi 'bower_components/purescript-*/src/**/*.js' \
	          '07-effects/src/purs/**/*.purs' \
	    --ffi '07-effects/src/purs/**/*.js' \
	    --output purescript_modules/

psci:
	psci      'bower_components/purescript-*/src/**/*.purs' \
	    --ffi 'bower_components/purescript-*/src/**/*.js' \
	          '05-foreign-import/src/purs/**/*.purs' \
	    --ffi '05-foreign-import/src/purs/**/*.js' \
	          '07-effects/src/purs/**/*.purs' \
	    --ffi '07-effects/src/purs/**/*.js'

node: export NODE_PATH=purescript_modules
node:
	node

clean:
	rm -rf purescript_modules/
