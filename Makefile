help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

enter: ## Enter a nix shell
	nix develop

start: ## Start the server
	cd thelinklist && hugo server --disableFastRender --buildDrafts --bind=0.0.0.0

deploy: ## Deploy the application
	bin/deploy.sh
