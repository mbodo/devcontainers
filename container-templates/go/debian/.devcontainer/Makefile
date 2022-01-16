# Default
M = $(shell printf "\033[34;1m▶\033[0m")

# devcontainer.json
# 
# Place the custom variables for devcontainer.json at the end of section
USER_UID    := $(shell id -u)
TZ          := $(shell timedatectl --property=Timezone show | cut -d '=' -f2)
WORKSPACE   := $(basename ${PWD})/..
PROJECT_DIR := $(shell realpath ${PWD}/../)
PROJECT     := $(shell basename $(PROJECT_DIR))
VARIANT     := 1

#TODO Create check for devcontainer-cli see https://stackoverflow.com/a/25668869/1025312

.DEFAULT_GOAL := all
.PHONY: all devcontainer-build devcontainer-clean

all: devcontainer-clean devcontainer-init devcontainer-build

#TODO  devcontainer.json should be generate from devcontainer.json.template for repeatability
devcontainer-init: 
	$(info $(M) Executing container init for project:  $(PROJECT))
# TODO copy devcontainer.json.template as devcontainer.json 
	sed -i 's/<VARIANT>/$(VARIANT)/g' devcontainer.json
	sed -i 's/<USER_UID>/$(USER_UID)/g' devcontainer.json
	sed -i 's~<TZ>~$(TZ)~g' devcontainer.json

devcontainer-build:
	$(info $(M) Executing container build for project:  $(PROJECT))
	BUILDAH_FORMAT=docker devcontainer build ../

IMAGES=$(shell podman images --format "table {{.Repository}}" | grep -i $(PROJECT))

devcontainer-clean:
	$(info $(M) Executing clean: $(PROJECT))
	#@echo ""
	#@readarray <<$(IMAGES)
	#@printf "${MAPFILE[0]}\n ${MAPFILE[1]}\n"
	#if [[ -n "$(IMAGES)" ]]; then \
	#	echo $(IMAGES) | cut -d " " -f1 | xargs podman image rm; \
	#	echo $(IMAGES) | cut -d " " -f2 | xargs podman image rm; \
	#fi
	#rm -fR $(WORKSPACE)/$(PROJECT)


#TODO Container clean before upgrade
#podman ps --all --format "table {{.Image}} {{.ID}}" | \
#grep -i $(PROJECT) | cut -d " " -f3 | \
#xargs podman rm && \
