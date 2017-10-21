# pg_textparser/Makefile

MODULE_big = pg_textparser
OBJS = pg_textparser.o textscan.o $(WIN32RES)

EXTENSION = pg_textparser
DATA = pg_textparser--1.0.sql
PGFILEDESC = "pg_textparser - text search parser"

REGRESS = pg_textparser

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/pg_textparser
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif

textscan.c: FLEXFLAGS = -Cfe -p -p
textscan.c: FLEX_NO_BACKUP=yes
textscan.c: FLEX_FIX_WARNING=yes

distprep: textscan.c

maintainer-clean:
	rm -f textscan.c
