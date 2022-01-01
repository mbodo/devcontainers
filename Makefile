M = $(shell printf "\033[34;1m▶\033[0m")
VARIANT    = 1
USER_UID   = $(shell id -u)
TZ         = $(shell timedatectl --property=Timezone show | cut -d '=' -f2)
WORKSPACE  = $(basename ${PWD})/..

.DEFAULT_GOAL := all
.PHONY: all project clean

all: project

project: 
	$(info $(M) Executing initial setup of project: $(PROJECT))
	mkdir -p $(WORKSPACE)/$(PROJECT)
	cp -R ${PWD}/.devcontainer $(WORKSPACE)/$(PROJECT)
	chmod 0744 -R $(WORKSPACE)/$(PROJECT)/
	sed -i 's/<VARIANT>/$(VARIANT)/g' $(WORKSPACE)/$(PROJECT)/.devcontainer/devcontainer.json
	sed -i 's/<USER_UID>/$(USER_UID)/g' $(WORKSPACE)/$(PROJECT)/.devcontainer/devcontainer.json
	sed -i 's~<TZ>~$(TZ)~g' $(WORKSPACE)/$(PROJECT)/.devcontainer/devcontainer.json

clean:
	$(info $(M) Clean: $(PROJECT))
	rm -fR $(WORKSPACE)/$(PROJECT)
