SHELL := /bin/bash

ENC_SECRETS = $(shell find manifests/*/secrets "${SECRETS_DIR}" -type f -and \( -name '*.enc' -or -name '*.enc.*' \) -not -path ".")
SECRETS = $(shell find manifests/*/secrets "${SECRETS_DIR}" -type f -not \( -name '*.enc' -or -name '*.enc.*' \) -not -path ".")

# GIT_COMMIT_ID=$(shell git rev-parse --short HEAD)
# export GIT_COMMIT_ID
# GIT_BRANCH=$(shell git describe --abbrev=1 --tags --always)
# export GIT_BRANCH

default: help

.PHONY: help
help:
	@ echo "make decrypt"
	@ echo "make encrypt"

.PHONY: decrypt
decrypt:
	@ for FILE in $(ENC_SECRETS); do \
		DIRNAME="$$(dirname $${FILE})"; \
		FILENAME="$$(basename $${FILE})"; \
		TARGET_FILENAME=$${FILENAME//.enc/}; \
		sops -d "$${FILE}" > "$${DIRNAME}/$${TARGET_FILENAME}"; \
	done

.PHONY: encrypt
encrypt:
	@ for FILE in $(SECRETS); do \
		DIRNAME="$$(dirname $${FILE})"; \
		FILENAME="$$(basename $${FILE})"; \
		EXTENSION=".$${FILENAME##*.}"; \
		FILENAME="$${FILENAME%.*}"; \
		TARGET_FILENAME="$${FILENAME}.enc$${EXTENSION}"; \
		sops -e "$${FILE}" > "$${DIRNAME}/$${TARGET_FILENAME}"; \
	done
