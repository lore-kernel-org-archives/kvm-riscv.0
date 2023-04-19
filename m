From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:46 -0700
Subject: [RFC 18/48] RISC-V: KVM: Skip TLB management for TVMs
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-19-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

TSM manages the tlb entries for the TVMs. Thus, host can ignore
all the hfence requests or tlb updates for confidential guests.
Most of the hfence requests happen through vcpu requests which
are skipped for TVMs. Thus, we just need to take care of the
invocation from tlb management here.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/tlb.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index dff37b57..b007c02 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -15,6 +15,7 @@
 #include <asm/hwcap.h>
 #include <asm/insn-def.h>
 #include <asm/kvm_nacl.h>
+#include <asm/kvm_cove.h>
 
 #define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
 
@@ -72,6 +73,14 @@ void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
 
 void kvm_riscv_local_hfence_gvma_all(void)
 {
+	/* For TVMs, TSM will take care of hfence.
+	 * TODO: We can't skip unconditionally if cove is enabled
+	 * as the host may be running in HS-mode and need to issue hfence
+	 * for legacy VMs.
+	 */
+	if (kvm_riscv_cove_enabled())
+		return;
+
 	asm volatile(HFENCE_GVMA(zero, zero) : : : "memory");
 }
 
@@ -160,7 +169,7 @@ void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
 {
 	unsigned long vmid;
 
-	if (!kvm_riscv_gstage_vmid_bits() ||
+	if (is_cove_vcpu(vcpu) || !kvm_riscv_gstage_vmid_bits() ||
 	    vcpu->arch.last_exit_cpu == vcpu->cpu)
 		return;
 
-- 
2.25.1


