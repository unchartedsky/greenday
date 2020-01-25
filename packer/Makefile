SHELL := /bin/bash

SRC = $(shell find . -type f -name 'build-*.json' -not -path ".")
GIT_COMMIT_ID=$(shell git rev-parse --short HEAD)
export GIT_COMMIT_ID
GIT_BRANCH=$(shell git describe --abbrev=1 --tags --always)
export GIT_BRANCH

default: validate

.PHONY: all
all: build

.PHONY: prepare
prepare:
	@ echo "GIT_BRANCH=$$GIT_BRANCH"
	@ echo "GIT_COMMIT_ID=$$GIT_COMMIT_ID"

.PHONY: validate
validate: prepare
	@ for src in $(SRC) ; do \
		echo packer validate $$src ; \
		packer validate $$src ; \
	done

.PHONY: validate
validate-syntax: prepare
	@ for src in $(SRC) ; do \
		echo packer validate -syntax-only $$src ; \
		packer validate -syntax-only $$src ; \
	done

.PHONY: build
build: prepare
	@ for src in $(SRC) ; do \
		echo packer build $$src ; \
		packer build $$src ; \
	done

.PHONY: debug
debug: prepare
	@ for src in $(SRC) ; do \
		echo packer build -debug $$src ; \
		packer build -debug $$src ; \
	done
