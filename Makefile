M = $(shell printf "\033[34;1m▶\033[0m")
WORKSPACE  = $(basename ${PWD})/..

.DEFAULT_GOAL := all
.PHONY: all template-copy help

all: template-copy

template-copy: 
	$(info $(M) Executing initial setup of project: $(PROJECT))
	mkdir -p $(WORKSPACE)/$(PROJECT)
	cp -R ${PWD}/container-templates/$(TYPE)/$(OS)/.build $(WORKSPACE)/$(PROJECT)
	chmod 0744 -R $(WORKSPACE)/$(PROJECT)/

help:
	$(info $(M) Help)
	@printf "\033[34;1mDefault Parameters:\033[0m\\n"
	@echo ""
	@echo "WORKSPACE: $(WORKSPACE)"
	@echo ""
	@printf "\033[34;1mExecute:\033[0m\\n"
	@echo ""
	@echo "make PROJECT=<Project Name> \\"
	@echo "TYPE=<container-templates/<TYPE>/debian/.. \\"
	@echo "OS=<container-templates/go/<OS>/.."
	@echo ""
	@printf "\033[34;1mExample:\033[0m\\n"
	@echo ""
	@echo "make PROJECT=myproject \\"
	@echo "TYPE=go \\"
	@echo "OS=debian"
