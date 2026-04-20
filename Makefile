SOURCE_FORMULAS := dryrun fixturize regresql
BINARY_FORMULAS := qshape
FORMULAS := $(SOURCE_FORMULAS) $(BINARY_FORMULAS)

.PHONY: update update-binary

## update a source-build formula to a new tag.
## usage: make update FORMULA=fixturize TAG=v0.4.0
update:
ifndef FORMULA
	$(error FORMULA is required ($(SOURCE_FORMULAS)). Usage: make update FORMULA=fixturize TAG=v0.4.0)
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

## update a binary-release formula to a new tag by pulling per-arch SHAs
## from the release's checksums.txt.
## usage: make update-binary FORMULA=qshape TAG=v0.1.0
update-binary:
ifndef FORMULA
	$(error FORMULA is required ($(BINARY_FORMULAS)). Usage: make update-binary FORMULA=qshape TAG=v0.1.0)
endif
ifndef TAG
	$(error TAG is required. Usage: make update-binary FORMULA=$(FORMULA) TAG=v0.1.0)
endif
	@VER=$$(echo "$(TAG)" | sed 's/^v//'); \
	SUMS_URL="https://github.com/boringSQL/$(FORMULA)/releases/download/$(TAG)/checksums.txt"; \
	echo "Fetching $$SUMS_URL ..."; \
	SUMS=$$(curl -sLf "$$SUMS_URL") || { echo "Error: could not fetch $$SUMS_URL"; exit 1; }; \
	echo "Updating Formula/$(FORMULA).rb to $(TAG)"; \
	sed -i '' "s|^  version \".*\"|  version \"$$VER\"|" Formula/$(FORMULA).rb; \
	for arch in darwin_arm64 darwin_amd64 linux_arm64 linux_amd64; do \
		FILE="$(FORMULA)_$${VER}_$${arch}.tar.gz"; \
		SHA=$$(printf '%s\n' "$$SUMS" | awk -v f="$$FILE" '$$2==f {print $$1}'); \
		if [ -z "$$SHA" ]; then echo "Error: no checksum for $$FILE"; exit 1; \
		fi; \
		awk -v arch="$$arch" -v sha="$$SHA" ' \
			$$0 ~ arch "\\.tar\\.gz" { seen=1 } \
			seen && /sha256 "/ { sub(/"[^"]*"/, "\"" sha "\""); seen=0 } \
			{ print }' Formula/$(FORMULA).rb > Formula/$(FORMULA).rb.tmp; \
		mv Formula/$(FORMULA).rb.tmp Formula/$(FORMULA).rb; \
	done; \
	echo "Done. Review with: git diff Formula/$(FORMULA).rb"
