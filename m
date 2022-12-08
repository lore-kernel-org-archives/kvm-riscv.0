From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:54 -0800
Subject: [RFC PATCH 34/37] KVM: MMU: Move the TDP iterator to common code
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-35-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move arch/x86/kvm/mmu/tdp_iter.{c,h} to into common code so that it can
be used by other architectures in the future.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 MAINTAINERS                                  | 2 +-
 arch/x86/kvm/Makefile                        | 2 +-
 arch/x86/kvm/mmu/tdp_mmu.c                   | 2 +-
 arch/x86/kvm/mmu/tdp_pgtable.c               | 2 +-
 {arch/x86/kvm/mmu => include/kvm}/tdp_iter.h | 9 +++------
 virt/kvm/Makefile.kvm                        | 2 ++
 {arch/x86 => virt}/kvm/mmu/tdp_iter.c        | 4 +---
 7 files changed, 10 insertions(+), 13 deletions(-)
 rename {arch/x86/kvm/mmu => include/kvm}/tdp_iter.h (96%)
 rename {arch/x86 => virt}/kvm/mmu/tdp_iter.c (98%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e586d7ba78c..3c33eca85480 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11206,7 +11206,7 @@ F:	include/uapi/asm-generic/kvm*
 F:	include/uapi/linux/kvm*
 F:	tools/kvm/
 F:	tools/testing/selftests/kvm/
-F:	virt/kvm/*
+F:	virt/kvm/
 
 KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)
 M:	Marc Zyngier <maz@kernel.org>
diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index c294ae51caba..cb9ae306892a 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -18,7 +18,7 @@ ifdef CONFIG_HYPERV
 kvm-y			+= kvm_onhyperv.o
 endif
 
-kvm-$(CONFIG_X86_64) += mmu/tdp_pgtable.o mmu/tdp_iter.o mmu/tdp_mmu.o
+kvm-$(CONFIG_X86_64) += mmu/tdp_pgtable.o mmu/tdp_mmu.o
 kvm-$(CONFIG_KVM_XEN)	+= xen.o
 kvm-$(CONFIG_KVM_SMM)	+= smm.o
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 1f1f511cd1a0..c035c051161c 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -2,10 +2,10 @@
 
 #include "mmu.h"
 #include "mmu_internal.h"
-#include "tdp_iter.h"
 #include "tdp_mmu.h"
 #include "spte.h"
 
+#include <kvm/tdp_iter.h>
 #include <kvm/tdp_pgtable.h>
 #include <kvm/mmutrace.h>
 
diff --git a/arch/x86/kvm/mmu/tdp_pgtable.c b/arch/x86/kvm/mmu/tdp_pgtable.c
index cc7b10f703e1..fb40abdb9234 100644
--- a/arch/x86/kvm/mmu/tdp_pgtable.c
+++ b/arch/x86/kvm/mmu/tdp_pgtable.c
@@ -2,10 +2,10 @@
 
 #include <linux/kvm_types.h>
 #include <kvm/tdp_pgtable.h>
+#include <kvm/tdp_iter.h>
 
 #include "mmu.h"
 #include "spte.h"
-#include "tdp_iter.h"
 
 /* Removed SPTEs must not be misconstrued as shadow present PTEs. */
 static_assert(!(REMOVED_TDP_PTE & SPTE_MMU_PRESENT_MASK));
diff --git a/arch/x86/kvm/mmu/tdp_iter.h b/include/kvm/tdp_iter.h
similarity index 96%
rename from arch/x86/kvm/mmu/tdp_iter.h
rename to include/kvm/tdp_iter.h
index 6e3c38532d1d..0a154fcf2664 100644
--- a/arch/x86/kvm/mmu/tdp_iter.h
+++ b/include/kvm/tdp_iter.h
@@ -1,14 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#ifndef __KVM_X86_MMU_TDP_ITER_H
-#define __KVM_X86_MMU_TDP_ITER_H
+#ifndef __KVM_TDP_ITER_H
+#define __KVM_TDP_ITER_H
 
 #include <linux/kvm_host.h>
 #include <kvm/tdp_pgtable.h>
 
-#include "mmu.h"
-#include "spte.h"
-
 /*
  * TDP MMU SPTEs are RCU protected to allow paging structures (non-leaf SPTEs)
  * to be zapped while holding mmu_lock for read, and to allow TLB flushes to be
@@ -117,4 +114,4 @@ void tdp_iter_start(struct tdp_iter *iter, struct kvm_mmu_page *root,
 void tdp_iter_next(struct tdp_iter *iter);
 void tdp_iter_restart(struct tdp_iter *iter);
 
-#endif /* __KVM_X86_MMU_TDP_ITER_H */
+#endif /* __KVM_TDP_ITER_H */
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index 2c27d5d0c367..58b595ac9b8d 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -12,3 +12,5 @@ kvm-$(CONFIG_KVM_ASYNC_PF) += $(KVM)/async_pf.o
 kvm-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
 kvm-$(CONFIG_HAVE_KVM_DIRTY_RING) += $(KVM)/dirty_ring.o
 kvm-$(CONFIG_HAVE_KVM_PFNCACHE) += $(KVM)/pfncache.o
+
+kvm-$(CONFIG_HAVE_TDP_MMU) += $(KVM)/mmu/tdp_iter.o
diff --git a/arch/x86/kvm/mmu/tdp_iter.c b/virt/kvm/mmu/tdp_iter.c
similarity index 98%
rename from arch/x86/kvm/mmu/tdp_iter.c
rename to virt/kvm/mmu/tdp_iter.c
index d5f024b7f6e4..674d93f91979 100644
--- a/arch/x86/kvm/mmu/tdp_iter.c
+++ b/virt/kvm/mmu/tdp_iter.c
@@ -1,8 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include "mmu_internal.h"
-#include "tdp_iter.h"
-#include "spte.h"
+#include <kvm/tdp_iter.h>
 
 /*
  * Recalculates the pointer to the SPTE for the current GFN and level and
-- 
2.39.0.rc1.256.g54fd8350bd-goog


