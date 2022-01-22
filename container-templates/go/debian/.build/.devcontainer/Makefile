# Default
# V = 0 Not verbose, V= 1 Verbose
V = 0
Q = $(if $(filter 1,$V),,@)
M = $(shell printf "\033[34;1m▶\033[0m")

# Generated devcontainer.json
USER_UID    := $(shell id -u)
TZ          := $(shell timedatectl --property=Timezone show | cut -d '=' -f2)
WORKSPACE   := $(basename ${PWD})/..
PROJECT_DIR := $(shell realpath ${PWD}/../)
PROJECT     := $(shell basename $(PROJECT_DIR))
# Custom devcontainer.json
VARIANT     := 1

#TODO Create check for devcontainer-cli see https://stackoverflow.com/a/25668869/1025312

.DEFAULT_GOAL := all
.PHONY: all devcontainer-build devcontainer-clean

all: devcontainer-clean devcontainer-init devcontainer-build

devcontainer-init: 
	$(info $(M) Executing container init for project:  $(PROJECT))
	$Q cp devcontainer.json.build devcontainer.json; \
	sed -i 's/<VARIANT>/$(VARIANT)/g' devcontainer.json; \
	sed -i 's/<USER_UID>/$(USER_UID)/g' devcontainer.json; \
	sed -i 's~<TZ>~$(TZ)~g' devcontainer.json

# TODO Tag after build to get latest build use 'podman image ls --sort created -n --format "table {{.Repository}}" | head -1'
devcontainer-build:
	$(info $(M) Executing container build for project:  $(PROJECT))
	BUILDAH_FORMAT=docker devcontainer build ../

IMAGES=$(shell podman images --format "table {{.Repository}}" | grep -i $(PROJECT))

# TODO Find parent images in history "podman history localhost/vsc-myproject-f1ea14d4488f6b223026cace5e0ac3f6-uid --format "{{.Comment}}" | sed '/^$/d' | head -1 | cut -d' ' -f2"
devcontainer-clean:
	$(info $(M) Executing clean: $(PROJECT))
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
