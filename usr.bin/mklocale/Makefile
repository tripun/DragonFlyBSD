#	@(#)Makefile	8.1 (Berkeley) 6/7/93
# $FreeBSD: src/usr.bin/mklocale/Makefile,v 1.21.2.2 2001/04/25 11:29:28 ru Exp $
# $DragonFly: src/usr.bin/mklocale/Makefile,v 1.5 2007/08/27 16:50:56 pavalos Exp $

PROG=		mklocale
SRCS=		yacc.y lex.l
CFLAGS+=-I. -I${.CURDIR} -I${.CURDIR}/../../lib/libc
YFLAGS=	-d

.include <bsd.prog.mk>
