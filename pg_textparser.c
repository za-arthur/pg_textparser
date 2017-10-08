/*-------------------------------------------------------------------------
 *
 * pg_textparser.c
 *	  Text search parser
 *
 *-------------------------------------------------------------------------
 */
#include "postgres.h"
#include "fmgr.h"

#include "pg_textparser.h"

PG_MODULE_MAGIC;

PG_FUNCTION_INFO_V1(textparser_start);
PG_FUNCTION_INFO_V1(textparser_nexttoken);
PG_FUNCTION_INFO_V1(textparser_end);
PG_FUNCTION_INFO_V1(textparser_lextype);
PG_FUNCTION_INFO_V1(textparser_headline);

Datum
textparser_start(PG_FUNCTION_ARGS)
{
	PG_RETURN_NULL();
}

Datum
textparser_nexttoken(PG_FUNCTION_ARGS)
{
	PG_RETURN_NULL();
}

Datum
textparser_end(PG_FUNCTION_ARGS)
{
	PG_RETURN_NULL();
}

Datum
textparser_lextype(PG_FUNCTION_ARGS)
{
	PG_RETURN_NULL();
}

Datum
textparser_headline(PG_FUNCTION_ARGS)
{
	PG_RETURN_NULL();
}
