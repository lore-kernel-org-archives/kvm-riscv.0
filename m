From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:57 -0800
Subject: [RFC PATCH 37/37] KVM: MMU: Move the TDP MMU to common code
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-38-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move tdp_mmu.[ch] from arch/x86 and into the common code directories.
This will allow other architectures to use the TDP MMU in the future.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/Makefile                       | 2 +-
 arch/x86/kvm/mmu/mmu.c                      | 3 ++-
 {arch/x86/kvm/mmu => include/kvm}/tdp_mmu.h | 6 +++++-
 virt/kvm/Makefile.kvm                       | 1 +
 {arch/x86 => virt}/kvm/mmu/tdp_mmu.c        | 8 +++-----
 5 files changed, 12 insertions(+), 8 deletions(-)
 rename {arch/x86/kvm/mmu => include/kvm}/tdp_mmu.h (94%)
 rename {arch/x86 => virt}/kvm/mmu/tdp_mmu.c (99%)

diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index cb9ae306892a..06b61fdea539 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -18,7 +18,7 @@ ifdef CONFIG_HYPERV
 kvm-y			+= kvm_onhyperv.o
 endif
 
-kvm-$(CONFIG_X86_64) += mmu/tdp_pgtable.o mmu/tdp_mmu.o
+kvm-$(CONFIG_X86_64)	+= mmu/tdp_pgtable.o
 kvm-$(CONFIG_KVM_XEN)	+= xen.o
 kvm-$(CONFIG_KVM_SMM)	+= smm.o
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f2602ee1771f..8653776bca6f 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -19,7 +19,6 @@
 #include "ioapic.h"
 #include "mmu.h"
 #include "mmu_internal.h"
-#include "tdp_mmu.h"
 #include "x86.h"
 #include "kvm_cache_regs.h"
 #include "smm.h"
@@ -27,6 +26,8 @@
 #include "cpuid.h"
 #include "spte.h"
 
+#include <kvm/tdp_mmu.h>
+
 #include <linux/kvm_host.h>
 #include <linux/types.h>
 #include <linux/string.h>
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/include/kvm/tdp_mmu.h
similarity index 94%
rename from arch/x86/kvm/mmu/tdp_mmu.h
rename to include/kvm/tdp_mmu.h
index 607c1417abd1..538c848149c9 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/include/kvm/tdp_mmu.h
@@ -5,7 +5,11 @@
 
 #include <linux/kvm_host.h>
 
-#include "spte.h"
+#include <kvm/mmu_types.h>
+#include <kvm/mmu.h>
+#include <kvm/tdp_iter.h>
+#include <kvm/tdp_pgtable.h>
+#include <kvm/mmutrace.h>
 
 int kvm_mmu_init_tdp_mmu(struct kvm *kvm);
 void kvm_mmu_uninit_tdp_mmu(struct kvm *kvm);
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index 58b595ac9b8d..942681308140 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -14,3 +14,4 @@ kvm-$(CONFIG_HAVE_KVM_DIRTY_RING) += $(KVM)/dirty_ring.o
 kvm-$(CONFIG_HAVE_KVM_PFNCACHE) += $(KVM)/pfncache.o
 
 kvm-$(CONFIG_HAVE_TDP_MMU) += $(KVM)/mmu/tdp_iter.o
+kvm-$(CONFIG_HAVE_TDP_MMU) += $(KVM)/mmu/tdp_mmu.o
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/virt/kvm/mmu/tdp_mmu.c
similarity index 99%
rename from arch/x86/kvm/mmu/tdp_mmu.c
rename to virt/kvm/mmu/tdp_mmu.c
index c950d688afea..5ca8892ebef5 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/virt/kvm/mmu/tdp_mmu.c
@@ -1,11 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include "mmu.h"
-#include "mmu_internal.h"
-#include "tdp_mmu.h"
-#include "spte.h"
-
+#include <kvm/mmu_types.h>
+#include <kvm/mmu.h>
 #include <kvm/tdp_iter.h>
+#include <kvm/tdp_mmu.h>
 #include <kvm/tdp_pgtable.h>
 #include <kvm/mmutrace.h>
 
-- 
2.39.0.rc1.256.g54fd8350bd-goog


