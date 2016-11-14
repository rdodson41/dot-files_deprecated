#  Set shell to Bash
SHELL = bash -o pipefail

#  Set build targets
home = home
home-all = $(shell find "$(home)" ! -type d)

#  Set install targets
root-home = $(HOME)
root-home-all = $(patsubst $(home)/%,$(root-home)/%,$(home-all))
install-all = $(root-home-all)

#  Print usage to standard error
.PHONY: help usage
help usage:
	@echo "dot-files: usage: make [ help | pull | push | install | uninstall | reinstall | update ]" >&2

#  Pull repository
.PHONY: pull
pull:
	@git pull --verbose 2>&1 | sed -e "s/^/dot-files: git: /" >&2

#  Push repository
.PHONY: push
push:
	@git push --verbose 2>&1 | sed -e "s/^/dot-files: git: /" >&2

#  Install targets
.PHONY: install
install: $(install-all)

$(root-home)/%: $(home)/%
	@echo "dot-files: rsync: $(home) -> $(root-home)" >&2
	@rsync --verbose --archive --no-group --human-readable "$(home)/" "$(root-home)" 2>&1 | sed -e "s/^/dot-files: rsync: /" >&2

#  Uninstall targets
.PHONY: uninstall
uninstall:
	@echo "dot-files: rm: $(install-all)" >&2
	@rm -f $(install-all) 2>&1 | sed -e "s/^/dot-files: /" >&2

#  Reinstall targets
.PHONY: reinstall
reinstall: uninstall install

#  Update targets
.PHONY: update
update: pull install
