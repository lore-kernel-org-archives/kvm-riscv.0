From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 11 Apr 2024 14:36:38 +0530
Subject: [PATCH 1/2] RISC-V: KVM: Share APLIC and IMSIC defines with irqchip drivers
In-Reply-To: <20240411090639.237119-1-apatel@ventanamicro.com>
References: <20240411090639.237119-1-apatel@ventanamicro.com>
Message-ID: <20240411090639.237119-2-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We have common APLIC and IMSIC headers available under
include/linux/irqchip/ directory which are used by APLIC
and IMSIC irqchip drivers. Let us replace the use of
kvm_aia_*.h headers with include/linux/irqchip/riscv-*.h
headers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_aia_aplic.h | 58 --------------------------
 arch/riscv/include/asm/kvm_aia_imsic.h | 38 -----------------
 arch/riscv/kvm/aia.c                   |  2 +-
 arch/riscv/kvm/aia_aplic.c             |  2 +-
 arch/riscv/kvm/aia_device.c            |  2 +-
 arch/riscv/kvm/aia_imsic.c             |  2 +-
 6 files changed, 4 insertions(+), 100 deletions(-)
 delete mode 100644 arch/riscv/include/asm/kvm_aia_aplic.h
 delete mode 100644 arch/riscv/include/asm/kvm_aia_imsic.h

diff --git a/arch/riscv/include/asm/kvm_aia_aplic.h b/arch/riscv/include/asm/kvm_aia_aplic.h
deleted file mode 100644
index 6dd1a4809ec1..000000000000
--- a/arch/riscv/include/asm/kvm_aia_aplic.h
+++ /dev/null
@@ -1,58 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2021 Western Digital Corporation or its affiliates.
- * Copyright (C) 2022 Ventana Micro Systems Inc.
- */
-#ifndef __KVM_RISCV_AIA_IMSIC_H
-#define __KVM_RISCV_AIA_IMSIC_H
-
-#include <linux/bitops.h>
-
-#define APLIC_MAX_IDC			BIT(14)
-#define APLIC_MAX_SOURCE		1024
-
-#define APLIC_DOMAINCFG			0x0000
-#define APLIC_DOMAINCFG_RDONLY		0x80000000
-#define APLIC_DOMAINCFG_IE		BIT(8)
-#define APLIC_DOMAINCFG_DM		BIT(2)
-#define APLIC_DOMAINCFG_BE		BIT(0)
-
-#define APLIC_SOURCECFG_BASE		0x0004
-#define APLIC_SOURCECFG_D		BIT(10)
-#define APLIC_SOURCECFG_CHILDIDX_MASK	0x000003ff
-#define APLIC_SOURCECFG_SM_MASK	0x00000007
-#define APLIC_SOURCECFG_SM_INACTIVE	0x0
-#define APLIC_SOURCECFG_SM_DETACH	0x1
-#define APLIC_SOURCECFG_SM_EDGE_RISE	0x4
-#define APLIC_SOURCECFG_SM_EDGE_FALL	0x5
-#define APLIC_SOURCECFG_SM_LEVEL_HIGH	0x6
-#define APLIC_SOURCECFG_SM_LEVEL_LOW	0x7
-
-#define APLIC_IRQBITS_PER_REG		32
-
-#define APLIC_SETIP_BASE		0x1c00
-#define APLIC_SETIPNUM			0x1cdc
-
-#define APLIC_CLRIP_BASE		0x1d00
-#define APLIC_CLRIPNUM			0x1ddc
-
-#define APLIC_SETIE_BASE		0x1e00
-#define APLIC_SETIENUM			0x1edc
-
-#define APLIC_CLRIE_BASE		0x1f00
-#define APLIC_CLRIENUM			0x1fdc
-
-#define APLIC_SETIPNUM_LE		0x2000
-#define APLIC_SETIPNUM_BE		0x2004
-
-#define APLIC_GENMSI			0x3000
-
-#define APLIC_TARGET_BASE		0x3004
-#define APLIC_TARGET_HART_IDX_SHIFT	18
-#define APLIC_TARGET_HART_IDX_MASK	0x3fff
-#define APLIC_TARGET_GUEST_IDX_SHIFT	12
-#define APLIC_TARGET_GUEST_IDX_MASK	0x3f
-#define APLIC_TARGET_IPRIO_MASK	0xff
-#define APLIC_TARGET_EIID_MASK	0x7ff
-
-#endif
diff --git a/arch/riscv/include/asm/kvm_aia_imsic.h b/arch/riscv/include/asm/kvm_aia_imsic.h
deleted file mode 100644
index da5881d2bde0..000000000000
--- a/arch/riscv/include/asm/kvm_aia_imsic.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2021 Western Digital Corporation or its affiliates.
- * Copyright (C) 2022 Ventana Micro Systems Inc.
- */
-#ifndef __KVM_RISCV_AIA_IMSIC_H
-#define __KVM_RISCV_AIA_IMSIC_H
-
-#include <linux/types.h>
-#include <asm/csr.h>
-
-#define IMSIC_MMIO_PAGE_SHIFT		12
-#define IMSIC_MMIO_PAGE_SZ		(1UL << IMSIC_MMIO_PAGE_SHIFT)
-#define IMSIC_MMIO_PAGE_LE		0x00
-#define IMSIC_MMIO_PAGE_BE		0x04
-
-#define IMSIC_MIN_ID			63
-#define IMSIC_MAX_ID			2048
-
-#define IMSIC_EIDELIVERY		0x70
-
-#define IMSIC_EITHRESHOLD		0x72
-
-#define IMSIC_EIP0			0x80
-#define IMSIC_EIP63			0xbf
-#define IMSIC_EIPx_BITS			32
-
-#define IMSIC_EIE0			0xc0
-#define IMSIC_EIE63			0xff
-#define IMSIC_EIEx_BITS			32
-
-#define IMSIC_FIRST			IMSIC_EIDELIVERY
-#define IMSIC_LAST			IMSIC_EIE63
-
-#define IMSIC_MMIO_SETIPNUM_LE		0x00
-#define IMSIC_MMIO_SETIPNUM_BE		0x04
-
-#endif
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index a944294f6f23..8ea51a791371 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -10,12 +10,12 @@
 #include <linux/kernel.h>
 #include <linux/bitops.h>
 #include <linux/irq.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/irqdomain.h>
 #include <linux/kvm_host.h>
 #include <linux/percpu.h>
 #include <linux/spinlock.h>
 #include <asm/cpufeature.h>
-#include <asm/kvm_aia_imsic.h>
 
 struct aia_hgei_control {
 	raw_spinlock_t lock;
diff --git a/arch/riscv/kvm/aia_aplic.c b/arch/riscv/kvm/aia_aplic.c
index b467ba5ed910..da6ff1bade0d 100644
--- a/arch/riscv/kvm/aia_aplic.c
+++ b/arch/riscv/kvm/aia_aplic.c
@@ -7,12 +7,12 @@
  *	Anup Patel <apatel@ventanamicro.com>
  */
 
+#include <linux/irqchip/riscv-aplic.h>
 #include <linux/kvm_host.h>
 #include <linux/math.h>
 #include <linux/spinlock.h>
 #include <linux/swab.h>
 #include <kvm/iodev.h>
-#include <asm/kvm_aia_aplic.h>
 
 struct aplic_irq {
 	raw_spinlock_t lock;
diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 0eb689351b7d..308b3bbede33 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -8,9 +8,9 @@
  */
 
 #include <linux/bits.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/kvm_host.h>
 #include <linux/uaccess.h>
-#include <asm/kvm_aia_imsic.h>
 
 static void unlock_vcpus(struct kvm *kvm, int vcpu_lock_idx)
 {
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index e808723a85f1..0a1e859323b4 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -9,13 +9,13 @@
 
 #include <linux/atomic.h>
 #include <linux/bitmap.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/kvm_host.h>
 #include <linux/math.h>
 #include <linux/spinlock.h>
 #include <linux/swab.h>
 #include <kvm/iodev.h>
 #include <asm/csr.h>
-#include <asm/kvm_aia_imsic.h>
 
 #define IMSIC_MAX_EIX	(IMSIC_MAX_ID / BITS_PER_TYPE(u64))
 
-- 
2.34.1


