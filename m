From: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Nov 2022 23:18:50 +0000
Subject: [PATCH 23/44] KVM: RISC-V: Tag init functions and data with __init, __ro_after_init
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
Message-ID: <20221102231911.3107438-24-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that KVM setup is handled directly in riscv_kvm_init(), tag functions
and data that are used/set only during init with __init/__ro_after_init.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/include/asm/kvm_host.h |  6 +++---
 arch/riscv/kvm/mmu.c              | 12 ++++++------
 arch/riscv/kvm/vmid.c             |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 8c771fc4f5d2..778ff0f282b7 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -295,11 +295,11 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
 void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
 void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
-void kvm_riscv_gstage_mode_detect(void);
-unsigned long kvm_riscv_gstage_mode(void);
+void __init kvm_riscv_gstage_mode_detect(void);
+unsigned long __init kvm_riscv_gstage_mode(void);
 int kvm_riscv_gstage_gpa_bits(void);
 
-void kvm_riscv_gstage_vmid_detect(void);
+void __init kvm_riscv_gstage_vmid_detect(void);
 unsigned long kvm_riscv_gstage_vmid_bits(void);
 int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
 bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 3620ecac2fa1..f42a34c7879a 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -20,12 +20,12 @@
 #include <asm/pgtable.h>
 
 #ifdef CONFIG_64BIT
-static unsigned long gstage_mode = (HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
-static unsigned long gstage_pgd_levels = 3;
+static unsigned long gstage_mode __ro_after_init = (HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
+static unsigned long gstage_pgd_levels __ro_after_init = 3;
 #define gstage_index_bits	9
 #else
-static unsigned long gstage_mode = (HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
-static unsigned long gstage_pgd_levels = 2;
+static unsigned long gstage_mode __ro_after_init = (HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
+static unsigned long gstage_pgd_levels __ro_after_init = 2;
 #define gstage_index_bits	10
 #endif
 
@@ -760,7 +760,7 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
 		kvm_riscv_local_hfence_gvma_all();
 }
 
-void kvm_riscv_gstage_mode_detect(void)
+void __init kvm_riscv_gstage_mode_detect(void)
 {
 #ifdef CONFIG_64BIT
 	/* Try Sv57x4 G-stage mode */
@@ -784,7 +784,7 @@ void kvm_riscv_gstage_mode_detect(void)
 #endif
 }
 
-unsigned long kvm_riscv_gstage_mode(void)
+unsigned long __init kvm_riscv_gstage_mode(void)
 {
 	return gstage_mode >> HGATP_MODE_SHIFT;
 }
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index 6cd93995fb65..5246da1c9167 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -17,10 +17,10 @@
 
 static unsigned long vmid_version = 1;
 static unsigned long vmid_next;
-static unsigned long vmid_bits;
+static unsigned long vmid_bits __ro_after_init;
 static DEFINE_SPINLOCK(vmid_lock);
 
-void kvm_riscv_gstage_vmid_detect(void)
+void __init kvm_riscv_gstage_vmid_detect(void)
 {
 	unsigned long old;
 
-- 
2.38.1.431.g37b22c650d-goog


