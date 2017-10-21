/*-------------------------------------------------------------------------
 *
 * pg_textparser.h
 *	  Exported definitions for pg_textparser
 *
 *-------------------------------------------------------------------------
 */
#ifndef __PG_TEXTPARSER_H__
#define __PG_TEXTPARSER_H__

/* in textscan.l */
extern void text_scanner_init(const char *str, int len);
extern void text_scanner_finish(void);

#endif   /* __PG_TEXTPARSER_H__ */