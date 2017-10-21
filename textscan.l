%{
/*-------------------------------------------------------------------------
 * textscan.l
 * 	  A scanner for text search
 *
 *-------------------------------------------------------------------------
 */
#include "postgres.h"

#include "textdata.h"

/*
 * We must have a typedef YYSTYPE for yylex's first argument, but this lexer
 * doesn't presently make use of that argument, so just declare it as int.
 */
typedef int YYSTYPE;

/* Handles to the buffer that the lexer uses internally */
static YY_BUFFER_STATE scanbufhandle;
static char *scanbuf;
static int	scanbuflen;
%}

%option 8bit
%option never-interactive
%option nodefault
%option noinput
%option nounput
%option noyywrap
%option warn
%option prefix="text_yy"

digit		[0-9]

other		.

%%

{digit}	return 0;

%%

void
yyerror(void *result, const char *message)
{
	if (*yytext == YY_END_OF_BUFFER_CHAR)
	{
		ereport(ERROR,
				(errcode(ERRCODE_SYNTAX_ERROR),
				 errmsg("bad text representation"),
				 /* translator: %s is typically "syntax error" */
				 errdetail("%s at end of input", message)));
	}
	else
	{
		ereport(ERROR,
				(errcode(ERRCODE_SYNTAX_ERROR),
				 errmsg("bad text representation"),
				 /* translator: first %s is typically "syntax error" */
				 errdetail("%s at or near \"%s\"", message, yytext)));
	}
}

/*
 * Called before any actual parsing is done
 */
void
text_scanner_init(const char *str, int len)
{
	/*
	 * Might be left over after ereport()
	 */
	if (YY_CURRENT_BUFFER)
		yy_delete_buffer(YY_CURRENT_BUFFER);

	/*
	 * Make a scan buffer with special termination needed by flex.
	 */
	scanbuflen = len;
	scanbuf = palloc(len + 2);
	memcpy(scanbuf, str, len);
	scanbuf[len] = scanbuf[len + 1] = YY_END_OF_BUFFER_CHAR;
	scanbufhandle = yy_scan_buffer(scanbuf, len + 2);

	BEGIN(INITIAL);
}

/*
 * Called after parsing is done to clean up after text_scanner_init()
 */
void
text_scanner_finish(void)
{
	yy_delete_buffer(scanbufhandle);
	pfree(scanbuf);
}