/*
 * $FreeBSD: src/sys/boot/efi/include/efi.h,v 1.3 2002/05/19 03:17:20 marcel Exp $
 * $DragonFly: src/sys/boot/efi/include/efi.h,v 1.1 2003/11/10 06:08:32 dillon Exp $
 */
/*++

Copyright (c) 1998  Intel Corporation

Module Name:

    efi.h

Abstract:

    Public EFI header files



Revision History

--*/

/*
 * Build flags on input
 *  EFI32
 *  EFI_DEBUG               - Enable debugging code
 *  EFI_NT_EMULATOR         - Building for running under NT
 */

#ifndef _EFI_INCLUDE_
#define _EFI_INCLUDE_

#define EFI_FIRMWARE_VENDOR         L"INTEL"
#define EFI_FIRMWARE_MAJOR_REVISION 12
#define EFI_FIRMWARE_MINOR_REVISION 33
#define EFI_FIRMWARE_REVISION ((EFI_FIRMWARE_MAJOR_REVISION <<16) | (EFI_FIRMWARE_MINOR_REVISION))

#include "efibind.h"
#include "efidef.h"
#include "efidevp.h"
#include "efiprot.h"
#include "eficon.h"
#include "efiser.h"
#include "efi_nii.h"
#include "efipxebc.h"
#include "efinet.h"
#include "efiapi.h"
#include "efifs.h"
#include "efifpswa.h"
#include "efierr.h"

#endif
