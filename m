From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:48 -0800
Subject: [RFC PATCH 28/37] KVM: MMU: Stub out tracepoints on non-x86 architectures
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-29-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Create stub tracepoints outside of x86. The KVM MMU tracepoints can be
moved to common code, but will be deferred to a future commit.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c |  2 +-
 include/kvm/mmutrace.h     | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 include/kvm/mmutrace.h

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 891877a6fb78..72746b645e99 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -2,12 +2,12 @@
 
 #include "mmu.h"
 #include "mmu_internal.h"
-#include "mmutrace.h"
 #include "tdp_iter.h"
 #include "tdp_mmu.h"
 #include "spte.h"
 
 #include <kvm/tdp_pgtable.h>
+#include <kvm/mmutrace.h>
 
 #include <asm/cmpxchg.h>
 #include <trace/events/kvm.h>
diff --git a/include/kvm/mmutrace.h b/include/kvm/mmutrace.h
new file mode 100644
index 000000000000..e95a3cb47479
--- /dev/null
+++ b/include/kvm/mmutrace.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#if !defined(_TRACE_KVM_MMUTRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_KVM_MMUTRACE_H
+
+#ifdef CONFIG_X86
+#include "../../arch/x86/kvm/mmu/mmutrace.h"
+#else
+#define trace_mark_mmio_spte(...)		do {} while (0)
+#define trace_kvm_mmu_get_page(...)		do {} while (0)
+#define trace_kvm_mmu_prepare_zap_page(...)	do {} while (0)
+#define trace_kvm_mmu_set_spte(...)		do {} while (0)
+#define trace_kvm_mmu_spte_requested(...)	do {} while (0)
+#define trace_kvm_mmu_split_huge_page(...)	do {} while (0)
+#define trace_kvm_tdp_mmu_spte_changed(...)	do {} while (0)
+#endif
+
+#endif /* _TRACE_KVM_MMUTRACE_H */
-- 
2.39.0.rc1.256.g54fd8350bd-goog


