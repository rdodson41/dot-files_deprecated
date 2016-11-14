SHELL = bash -o pipefail

home = home
home-all = $(shell find "$(home)" ! -type d)

root-home = $(HOME)
root-home-all = $(patsubst $(home)/%,$(root-home)/%,$(home-all))
install-all = $(root-home-all)

.PHONY: help usage
help usage:
	@echo "dot-files: usage: make [ help | pull | push | install | uninstall | reinstall | update ]" >&2

.PHONY: pull
pull:
	@git pull --verbose 2>&1 | sed -e "s/^/dot-files: git: /" >&2

.PHONY: push
push:
	@git push --verbose 2>&1 | sed -e "s/^/dot-files: git: /" >&2

.PHONY: install
install: $(install-all)

$(root-home)/%: $(home)/%
	@echo "dot-files: rsync: $(home) -> $(root-home)" >&2
	@rsync --verbose --archive --no-group --human-readable "$(home)/" "$(root-home)" 2>&1 | sed -e "s/^/dot-files: rsync: /" >&2

.PHONY: uninstall
uninstall:
	@echo "dot-files: rm: $(install-all)" >&2
	@rm -f $(install-all) 2>&1 | sed -e "s/^/dot-files: /" >&2

.PHONY: reinstall
reinstall: uninstall install

.PHONY: update
update: pull install
