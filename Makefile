# Colors for pretty output
BLUE := \033[36m
BOLD := \033[1m
RESET := \033[0m

.DEFAULT_GOAL := help

.PHONY: venv
venv:
	@printf "$(BLUE)Creating virtual environment...$(RESET)\n"
	@uv venv --python 3.12

.PHONY: install
install: venv ## install all dependencies using uv
	@printf "$(BLUE)Installing dependencies...$(RESET)\n"
	@uv sync --frozen

.PHONY: jupyter
jupyter: install ## start a jupyter server
	@uv pip install jupyter
	@mkdir figures
	@uv run jupyter lab

.PHONY: clean
clean: ## clean generated files and directories
	@printf "$(BLUE)Cleaning project...$(RESET)\n"
	@git clean -d -X -f

.PHONY: help
help: ## display this help message
	@printf "$(BOLD)Usage:$(RESET)\n"
	@printf "  make $(BLUE)<target>$(RESET)\n\n"
	@printf "$(BOLD)Targets:$(RESET)\n"
	@awk 'BEGIN {FS = ":.*##"; printf ""} /^[a-zA-Z_-]+:.*?##/ { printf "  $(BLUE)%-15s$(RESET) %s\n", $$1, $$2 } /^##@/ { printf "\n$(BOLD)%s$(RESET)\n", substr($$0, 5) }' $(MAKEFILE_LIST)