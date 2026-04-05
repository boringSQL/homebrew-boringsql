FORMULAS := dryrun fixturize regresql

.PHONY: update

## update formula to a new tag.
## usage: make update FORMULA=fixturize TAG=v0.4.0
update:
ifndef FORMULA
	$(error FORMULA is required ($(FORMULAS)). Usage: make update FORMULA=fixturize TAG=v0.4.0)
endif
ifndef TAG
	$(error TAG is required. Usage: make update FORMULA=$(FORMULA) TAG=v0.4.0)
endif
	@URL="https://github.com/boringSQL/$(FORMULA)/archive/refs/tags/$(TAG).tar.gz"; \
	echo "Fetching $$URL ..."; \
	STATUS=$$(curl -sL -o /dev/null -w '%{http_code}' "$$URL"); \
	if [ "$$STATUS" != "200" ]; then \
		echo "Error: tag $(TAG) not found for $(FORMULA) (HTTP $$STATUS)"; exit 1; \
	fi; \
	SHA=$$(curl -sL "$$URL" | shasum -a 256 | cut -d' ' -f1); \
	echo "Updating Formula/$(FORMULA).rb to $(TAG) (sha256: $$SHA)"; \
	sed -i '' "s|url \".*\"|url \"$$URL\"|" Formula/$(FORMULA).rb; \
	sed -i '' "s|sha256 \".*\"|sha256 \"$$SHA\"|" Formula/$(FORMULA).rb; \
	echo "Done. Review with: git diff Formula/$(FORMULA).rb"
