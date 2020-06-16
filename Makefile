#
# fetchutils: some fetch utilities
#
# (c) Kiëd Llaentenn and contributors
# See the COPYING file for copyright information.
#

DESTDIR =
PREFIX  = /usr/local

CMD = @
SRC = disk.sh editor.sh \
      mem.sh os.sh pkgs.sh res.sh \
      temp.sh upt.sh wm.sh
SCD = man/fetchutils.1.scd \
      $(patsubst %.sh,man/%.1.scd,$(SRC))
MAN = $(SCD:.scd=)

all: $(MAN)

%.1: %.1.scd
	@printf "    %-8s %s\n" "SCDOC" "$@"
	$(CMD)scdoc < $< > $(<:.scd=)
clean:
	@printf "    %-8s man/*.1\n" "CLEAN"
	$(CMD)rm -f man/*.1

install: $(MAN)
	$(CMD)cat etc/manifest.txt | \
		while read -r src dest mode; \
		do \
			printf "    %-8s %s\n" "INSTALL" \
				$(DESTDIR)$(PREFIX)$$dest; \
			install -Dm$$mode $$src \
				$(DESTDIR)$(PREFIX)$$dest; \
		done

uninstall:
	$(CMD)cat etc/manifest.txt | \
		while read -r _ dest _; \
		do \
			printf "    %-8s %s\n" "CLEAN" \
				$(DESTDIR)$(PREFIX)$$dest; \
			rm -f $(DESTDIR)$(PREFIX)$$dest; \
		done

chk:
	$(CMD)tests/main.sh

.PHONY: all clean install uninstall chk

