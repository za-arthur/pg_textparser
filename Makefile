# pg_textparser/Makefile

MODULE_big = pg_textparser
OBJS = pg_textparser.o $(WIN32RES)

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
