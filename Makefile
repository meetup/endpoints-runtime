CI_BUILD_NUMBER ?= $(USER)-snapshot

VERSION = 1-0.0.$(CI_BUILD_NUMBER)

PUBLISH_TAG = "meetup/endpoints-runtime:$(VERSION)"

DATE = $(shell date +%Y-%m-%dT%H_%M_%S)

help:
	@echo Public targets:
	@grep -E '^[^_]{2}[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo "Private targets: (use at own risk)"
	@grep -E '^__[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[35m%-20s\033[0m %s\n", $$1, $$2}'

package: ## Create docker image.
	docker build -t $(PUBLISH_TAG) .

publish: package ## Create docker image and push to registry.
	docker push $(PUBLISH_TAG)

version:
	@echo $(VERSION)
