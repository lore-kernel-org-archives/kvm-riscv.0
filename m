From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 29 Mar 2024 17:26:24 +0800
Subject: [PATCH RFC 08/11] riscv: KVM: Add Sdtrig Extension Support for
 Guest/VM
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
Message-ID: <20240329-dev-maxh-lin-452-6-9-v1-8-1534f93b94a7@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Yong-Xuan Wang <yongxuan.wang@sifive.com>

We extend the KVM ISA extension ONE_REG interface to allow VMM
tools to detect and enable Sdtrig extension for Guest/VM. We
also save/restore the scontext CSR for guest VCPUs and set the
HSCONTEXT bit in hstateen0 CSR if the scontext CSR is available
for Guest/VM when the Smstateen extension is present.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Co-developed-by: Max Hsu <max.hsu@sifive.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/asm/kvm_host.h       | 11 +++++++++++
 arch/riscv/include/asm/kvm_vcpu_debug.h | 17 +++++++++++++++++
 arch/riscv/include/uapi/asm/kvm.h       |  1 +
 arch/riscv/kvm/Makefile                 |  1 +
 arch/riscv/kvm/vcpu.c                   |  8 ++++++++
 arch/riscv/kvm/vcpu_debug.c             | 29 +++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_onereg.c            |  1 +
 7 files changed, 68 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 484d04a92fa6..d495279d99e1 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -21,6 +21,7 @@
 #include <asm/kvm_vcpu_sbi.h>
 #include <asm/kvm_vcpu_timer.h>
 #include <asm/kvm_vcpu_pmu.h>
+#include <asm/kvm_vcpu_debug.h>
 
 #define KVM_MAX_VCPUS			1024
 
@@ -175,6 +176,10 @@ struct kvm_vcpu_smstateen_csr {
 	unsigned long sstateen0;
 };
 
+struct kvm_vcpu_sdtrig_csr {
+	unsigned long scontext;
+};
+
 struct kvm_vcpu_arch {
 	/* VCPU ran at least once */
 	bool ran_atleast_once;
@@ -197,6 +202,9 @@ struct kvm_vcpu_arch {
 	unsigned long host_senvcfg;
 	unsigned long host_sstateen0;
 
+	/* SCONTEXT of Host */
+	unsigned long host_scontext;
+
 	/* CPU context of Host */
 	struct kvm_cpu_context host_context;
 
@@ -209,6 +217,9 @@ struct kvm_vcpu_arch {
 	/* CPU Smstateen CSR context of Guest VCPU */
 	struct kvm_vcpu_smstateen_csr smstateen_csr;
 
+	/* CPU Sdtrig CSR context of Guest VCPU */
+	struct kvm_vcpu_sdtrig_csr sdtrig_csr;
+
 	/* CPU context upon Guest VCPU reset */
 	struct kvm_cpu_context guest_reset_context;
 
diff --git a/arch/riscv/include/asm/kvm_vcpu_debug.h b/arch/riscv/include/asm/kvm_vcpu_debug.h
new file mode 100644
index 000000000000..6e7ce6b408a6
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_vcpu_debug.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 SiFive
+ *
+ * Authors:
+ *	Yong-Xuan Wang <yongxuan.wang@sifive.com>
+ */
+
+#ifndef __KVM_VCPU_RISCV_DEBUG_H
+#define __KVM_VCPU_RISCV_DEBUG_H
+
+#include <linux/types.h>
+
+void kvm_riscv_debug_vcpu_swap_in_guest_context(struct kvm_vcpu *vcpu);
+void kvm_riscv_debug_vcpu_swap_in_host_context(struct kvm_vcpu *vcpu);
+
+#endif
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index b1c503c2959c..9f70da85ed51 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -167,6 +167,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZFA,
 	KVM_RISCV_ISA_EXT_ZTSO,
 	KVM_RISCV_ISA_EXT_ZACAS,
+	KVM_RISCV_ISA_EXT_SDTRIG,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index c9646521f113..387be968d9ea 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -15,6 +15,7 @@ kvm-y += vmid.o
 kvm-y += tlb.o
 kvm-y += mmu.o
 kvm-y += vcpu.o
+kvm-y += vcpu_debug.o
 kvm-y += vcpu_exit.o
 kvm-y += vcpu_fp.o
 kvm-y += vcpu_vector.o
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b5ca9f2e98ac..1d0e43ab0652 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -20,6 +20,7 @@
 #include <asm/csr.h>
 #include <asm/cacheflush.h>
 #include <asm/kvm_vcpu_vector.h>
+#include <asm/switch_to.h>
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
@@ -504,6 +505,9 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 					  SMSTATEEN0_AIA_ISEL;
 		if (riscv_isa_extension_available(isa, SMSTATEEN))
 			cfg->hstateen0 |= SMSTATEEN0_SSTATEEN0;
+
+		if (has_scontext())
+			cfg->hstateen0 |= SMSTATEEN0_HSCONTEXT;
 	}
 }
 
@@ -643,6 +647,8 @@ static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *
 	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
 		vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0,
 						     smcsr->sstateen0);
+
+	kvm_riscv_debug_vcpu_swap_in_guest_context(vcpu);
 }
 
 static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *vcpu)
@@ -656,6 +662,8 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
 	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
 		smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0,
 					    vcpu->arch.host_sstateen0);
+
+	kvm_riscv_debug_vcpu_swap_in_host_context(vcpu);
 }
 
 /*
diff --git a/arch/riscv/kvm/vcpu_debug.c b/arch/riscv/kvm/vcpu_debug.c
new file mode 100644
index 000000000000..e7e9263c2e30
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_debug.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 SiFive
+ */
+
+#include <linux/kvm_host.h>
+#include <asm/switch_to.h>
+
+void kvm_riscv_debug_vcpu_swap_in_guest_context(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_sdtrig_csr *csr = &vcpu->arch.sdtrig_csr;
+	unsigned long hcontext = vcpu->kvm->arch.hcontext;
+
+	if (has_hcontext())
+		csr_write(CSR_HCONTEXT, hcontext);
+	if (has_scontext())
+		vcpu->arch.host_scontext = csr_swap(CSR_SCONTEXT, csr->scontext);
+}
+
+void kvm_riscv_debug_vcpu_swap_in_host_context(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_sdtrig_csr *csr = &vcpu->arch.sdtrig_csr;
+
+	/* Hypervisor uses the hcontext ID 0 */
+	if (has_hcontext())
+		csr_write(CSR_HCONTEXT, 0);
+	if (has_scontext())
+		csr->scontext = csr_swap(CSR_SCONTEXT, vcpu->arch.host_scontext);
+}
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index f4a6124d25c9..10dda5ddc0a6 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -34,6 +34,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
 	[KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
 	/* Multi letter extensions (alphabetically sorted) */
+	KVM_ISA_EXT_ARR(SDTRIG),
 	KVM_ISA_EXT_ARR(SMSTATEEN),
 	KVM_ISA_EXT_ARR(SSAIA),
 	KVM_ISA_EXT_ARR(SSTC),

-- 
2.43.2


