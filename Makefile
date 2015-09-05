DOCKER=$(shell which docker)
IMAGENAME=spredsheet-bulk-loader

build:
	$(DOCKER) build -t $(IMAGENAME) .

start:
	@$(DOCKER) images |grep $(IMAGENAME) > /dev/null || $(make) build 
	@$(DOCKER) run -i -t $(IMAGENAME) /bin/bash
