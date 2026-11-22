.PHONY: prepare prepare-ps1 prepare-ps2 shell-ps1 shell-ps2 help

COMPOSE ?= docker compose
export UID := $(shell id -u)
export GID := $(shell id -g)

help:
	@echo "psdevkit — toolchains PS1 (PSn00bSDK) + PS2 (ps2dev) via Docker"
	@echo ""
	@echo "  make prepare       Build both Docker images"
	@echo "  make prepare-ps1   Build PS1 image only"
	@echo "  make prepare-ps2   Build PS2 image only"
	@echo "  make shell-ps1     Interactive shell with PSn00bSDK"
	@echo "  make shell-ps2     Interactive shell with ps2dev"
	@echo ""
	@echo "Mount your game project into /workspace (this repo) or run compose"
	@echo "from another folder with -f pointing here."

prepare: prepare-ps1 prepare-ps2

prepare-ps1:
	$(COMPOSE) build ps1

prepare-ps2:
	$(COMPOSE) build ps2

shell-ps1:
	$(COMPOSE) run --rm ps1

shell-ps2:
	$(COMPOSE) run --rm ps2
