#-
# Copyright (c) 2004 Nate Lawson
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.
#
# $DragonFly: src/sys/dev/acpica5/acpi_if.m,v 1.3 2008/09/29 06:59:45 hasso Exp $
#

#include <sys/bus.h>
#include <sys/types.h>
#include "acpi.h"

INTERFACE acpi;

#
# Callback function for each child handle traversed in acpi_scan_children().
#
# ACPI_HANDLE h:  current child device being considered
#
# device_t *dev:  pointer to the child's original device_t or NULL if there
#   was none.  The callback should store a new device in *dev if it has
#   created one.  The method implementation will automatically clean up the
#   previous device and properly associate the current ACPI_HANDLE with it.
#
# level:  current level being scanned
#
# void *arg:  argument passed in original call to acpi_scan_children()
#
# Returns:  AE_OK if the scan should continue, otherwise an error
#
HEADER {
	typedef ACPI_STATUS (*acpi_scan_cb_t)(ACPI_HANDLE h, device_t *dev,
	    int level, void *arg);

	struct acpi_bif;
	struct acpi_bst;
};

#
# Default implementation for acpi_id_probe().
#
CODE {
	static char *
	acpi_generic_id_probe(device_t bus, device_t dev, char **ids)
	{
		return (NULL);
	}
};

#
# Check a device for a match in a list of ID strings.  The strings can be
# EISA PNP IDs or ACPI _HID/_CID values.
#
# device_t bus:  parent bus for the device
#
# device_t dev:  device being considered
#
# char **ids:  array of ID strings to consider
#
# Returns:  ID string matched or NULL if no match
#
METHOD char * id_probe {
	device_t	bus;
	device_t	dev;
	char		**ids;
} DEFAULT acpi_generic_id_probe;

#
# Query a given driver for its supported feature(s).  This should be
# called by the parent bus before the driver is probed.
#
# driver_t *driver:  child driver
#
# u_int *features:  returned bitmask of all supported features
#
STATICMETHOD int get_features {
	driver_t	*driver;
	u_int		*features;
};

#
# Read embedded controller (EC) address space
#
# device_t dev:  EC device
# u_int addr:  Address to read from in EC space
# ACPI_INTEGER *val:  Location to store read value
# int width:  Size of area to read in bytes
#
METHOD int ec_read {
	device_t	dev;
	u_int		addr;
	ACPI_INTEGER	*val;
	int		width;
};

#
# Write embedded controller (EC) address space
#
# device_t dev:  EC device
# u_int addr:  Address to write to in EC space
# ACPI_INTEGER val:  Value to write
# int width:  Size of value to write in bytes
#
METHOD int ec_write {
	device_t	dev;
	u_int		addr;
	ACPI_INTEGER	val;
	int		width;
};

#
# Get battery information (_BIF format)
#
# device_t dev:  Battery device
# struct acpi_bif *bif:  Pointer to storage for _BIF results
#
METHOD int batt_get_info {
	device_t	dev;
	struct acpi_bif	*bif;
};

#
# Get battery status (_BST format)
#
# device_t dev:  Battery device
# struct acpi_bst *bst:  Pointer to storage for _BST results
#
METHOD int batt_get_status {
	device_t	dev;
	struct acpi_bst	*bst;
};

