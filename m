From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri,  5 Aug 2022 15:02:56 +0200
Subject: [PATCH] RISC-V: KVM: Fix compile after merge
Message-ID: <20220805130256.683070-1-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The compiler usually complains that we've forgotten to dot our i's and
cross our t's, but this time it was complaining that we dotted our
commas. Undot the commas (a.k.a change ; to ,) to restore compilation.

Applies to kvm/queue.

Fixes: 24688433d2ef ("Merge remote-tracking branch 'kvm/next' into kvm-next-5.20")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index f9edfe31656c..3a35b2d95697 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -352,8 +352,8 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
 	unsigned long pfn;
 	phys_addr_t addr, end;
 	struct kvm_mmu_memory_cache pcache = {
-		.gfp_custom = (in_atomic) ? GFP_ATOMIC | __GFP_ACCOUNT : 0;
-		.gfp_zero = __GFP_ZERO;
+		.gfp_custom = (in_atomic) ? GFP_ATOMIC | __GFP_ACCOUNT : 0,
+		.gfp_zero = __GFP_ZERO,
 	};
 
 	end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
-- 
2.37.1


