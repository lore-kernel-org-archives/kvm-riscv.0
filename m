From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 13 Nov 2022 14:52:54 +0100
Subject: [PATCH] RISC-V: KVM: Simplify kvm_arch_prepare_memory_region()
Message-ID: <c5e918630ba37273d7b0f4e4dbb6f90d4c2f321d.1668347565.git.christophe.jaillet@wanadoo.fr>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In kvm_arch_prepare_memory_region(), if no error occurs, a spin_lock()/
spin_unlock() call can be avoided.

Switch to kvm_riscv_gstage_iounmap() that is the same as the current code,
but with a better semantic.
It also embeds the locking logic. So it is avoided if ret == 0.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I don't use cross-compiler, so this patch is NOT even compile tested.
---
 arch/riscv/kvm/mmu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 3620ecac2fa1..c8834e463763 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -537,10 +537,8 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	if (change == KVM_MR_FLAGS_ONLY)
 		goto out;
 
-	spin_lock(&kvm->mmu_lock);
 	if (ret)
-		gstage_unmap_range(kvm, base_gpa, size, false);
-	spin_unlock(&kvm->mmu_lock);
+		kvm_riscv_gstage_iounmap(kvm, base_gpa, size);
 
 out:
 	mmap_read_unlock(current->mm);
-- 
2.34.1


