.PHONY:    all clean

SRC = mem.sh os.sh pkgs.sh res.sh \
      temp.sh upt.sh wm.sh
BIN = $(SRC:.sh=)
SCD = $(patsubst %.sh,man/%.1.scd,$(SRC))
MAN = $(patsubst %.1,%.1,$(SCD:.scd=))

all: $(MAN)

%.1: %.1.scd
	scdoc < $< > $(<:.scd=)

clean:
	rm -f $(MAN)
