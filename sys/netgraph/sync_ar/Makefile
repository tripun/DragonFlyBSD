# $FreeBSD: src/sys/modules/netgraph/sync_ar/Makefile,v 1.2.2.1 2002/06/17 15:11:04 jhay Exp $
# $DragonFly: src/sys/netgraph/sync_ar/Makefile,v 1.3 2003/08/14 23:26:43 dillon Exp $
 
.PATH:  ${.CURDIR}/../../dev/netif/ar
KMOD    = ng_sync_ar
SRCS    = if_ar.c if_ar_isa.c if_ar_pci.c
SRCS    += device_if.h bus_if.h pci_if.h isa_if.h opt_netgraph.h
  
opt_netgraph.h:
	echo "#define NETGRAPH" > opt_netgraph.h

.include <bsd.kmod.mk>
