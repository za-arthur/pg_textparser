/* pg_textparser/pg_textparser--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION pg_textparser" to load this file. \quit

CREATE OR REPLACE FUNCTION textparser_start(internal, int4)
RETURNS internal
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION textparser_nexttoken(internal, internal, internal)
RETURNS internal
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION textparser_end(internal)
RETURNS void
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION textparser_lextype(internal)
RETURNS internal
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT;

CREATE TEXT SEARCH PARSER textparser (
	START    = textparser_start,
	GETTOKEN = textparser_nexttoken,
	END      = textparser_end,
	HEADLINE = textparser_headline
);

COMMENT ON TEXT SEARCH PARSER textparser IS 'parser for text search';