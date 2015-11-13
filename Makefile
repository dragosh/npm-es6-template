# vim: set softtabstop=4 shiftwidth=4:
SHELL = bash
BIN=./node_modules/.bin

install link:
	@npm $@
clean:
	@npm cache clean
	@rm -rf node_modules
	@rm -rf dist

test:
	@$(BIN)/eslint ./src && \
	$(BIN)/mocha --compilers js:babel-core/register --require chai \
		--source-maps \
		--colors \
		--bail \
		--reporter spec ./src/**/*.spec.js

build:
	@mkdir -p ./dist && \
	$(BIN)/browserify ./src/index.js  -t babelify --outfile ./dist/index.js

.PHONY: all install link doc clean uninstall test man release
