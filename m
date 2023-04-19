From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:44 -0700
Subject: [RFC 16/48] RISC-V: KVM: Skip most VCPU requests for TVMs
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-17-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, KVM manages TLB shootdown, hgatp updates and
fence.i through vcpu requests.

TLB shootdown for the TVMs happens in co-ordination with TSM.
The fence.i & hgatp updates are directly managed by the TSM.
There is no need to issue these requests directly for TVMs.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index c53bf98..3b600c6 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -22,6 +22,7 @@
 #include <asm/kvm_nacl.h>
 #include <asm/hwcap.h>
 #include <asm/sbi.h>
+#include <asm/kvm_cove.h>
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
@@ -1078,6 +1079,15 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
 		if (kvm_check_request(KVM_REQ_VCPU_RESET, vcpu))
 			kvm_riscv_reset_vcpu(vcpu);
 
+		if (is_cove_vcpu(vcpu)) {
+			/*
+			 * KVM doesn't need to do anything special here
+			 * as the TSM is expected track the tlb version and issue
+			 * hfence when vcpu is scheduled again.
+			 */
+			return;
+		}
+
 		if (kvm_check_request(KVM_REQ_UPDATE_HGATP, vcpu))
 			kvm_riscv_gstage_update_hgatp(vcpu);
 
-- 
2.25.1


