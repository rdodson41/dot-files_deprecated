home = home
home-all = $(shell find "$(home)" -type f)

root-home = $(HOME)
root-home-all = $(patsubst $(home)/%,$(root-home)/%,$(home-all))

.PHONY: help
help:
	@echo "usage: make [ help | pull | install | update | uninstall | reinstall ]" >&2

.PHONY: pull
pull:
	git pull --verbose

.PHONY: install
install: $(root-home-all)

$(root-home)/%: $(home)/%
	rsync --verbose --archive --no-group --human-readable "$(home)/" "$(root-home)"

.PHONY: update
update: pull install

.PHONY: uninstall
uninstall:
	rm $(root-home-all)

.PHONY: reinstall
reinstall: uninstall install
