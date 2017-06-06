home = home
home-all = $(shell find "$(home)" -type f)

root-home = $(HOME)
root-home-all = $(patsubst $(home)/%,$(root-home)/%,$(home-all))

.PHONY: help
help:
	@echo "usage: make [ help | install | uninstall | pull | update ]" >&2

.PHONY: install
install: $(root-home-all)

$(root-home)/%: $(home)/%
	rsync --verbose --archive --no-group --human-readable "$(home)/" "$(root-home)"

.PHONY: uninstall
uninstall:
	rm --force $(root-home-all)

.PHONY: pull
pull:
	git pull --verbose

.PHONY: update
update: uninstall pull install
