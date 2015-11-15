# vim: set softtabstop=4 shiftwidth=4:
 MAKEFLAGS = -j1

SHELL = bash
BIN=./node_modules/.bin
BABEL_SETUP = --presets es2015
MOCHA_SETUP = --recursive --bail --require chai
BABEL_NODE = $(BIN)/babel-node $(BABEL_SETUP)
REPO ?= ""
ISPARTA_CMD = $(BIN)/isparta cover --root src
MOCHA_CMD = $(BIN)/_mocha
IN = src/index.js
OUT = dist/index.js
MIN = dist/index.min.js
SPECS = **/*[sS]pec.js

.PHONY: all install link doc clean uninstall test man release

clean:
	@rm -rf dist

clean-all: clean
	@npm cache clean
	@rm -rf node_modules

lint:
	@$(BIN)/eslint ./src

coverage:
	@$(BABEL_NODE) $(ISPARTA_CMD) \
		--report text \
		--report html \
		--dir "reports/coverage" \
		--excludes "$(SPECS)" \
	$(MOCHA_CMD) -- src/$(SPECS) $(MOCHA_SETUP)
test:
	@$(BABEL_NODE) $(MOCHA_CMD) $(MOCHA_SETUP) src/$(SPECS)

start:
	@$(BABEL_NODE) $(BABEL_SETUP) -- $(IN)

build:
	@mkdir -p ./dist && \
	$(BIN)/babel $(BABEL_SETUP) $(IN) \
	-o $(OUT) \
	--source-maps

install link: clean-all
	@npm $@

init:
	echo "Experimental"
	@git init && git remote add origin $(REPO) && \
	npm i -Dg husky commitizen semantic-release-cli && \
	$(call save_package,$(REPO)) && \
	commitizen init rb-conventional-changelog --save --force --save-exact && \
	semantic-release-cli setup

deploy: lint coverage build verify


verify: lint coverage

publish:
	@echo "@TODO : Publish"

release:
	@echo "@TODO : release"


define save_package
	node -e " var pck = require('./package.json'); \
	pck.repository = { \
		\"type\": \"git\", \
		\"url\": \"$(1)\" \
	}; \
	require('fs').writeFileSync('./package.json', JSON.stringify(pck, null, 2));"
endef
