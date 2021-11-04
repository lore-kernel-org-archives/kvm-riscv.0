From: Sean Christopherson <seanjc@google.com>
Date: Thu,  4 Nov 2021 16:41:06 +0000
Subject: [PATCH 1/2] KVM: RISC-V: Unmap stage2 mapping when deleting/moving a
 memslot
In-Reply-To: <20211104164107.1291793-1-seanjc@google.com>
References: <20211104164107.1291793-1-seanjc@google.com>
Message-ID: <20211104164107.1291793-2-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Unmap stage2 page tables when a memslot is being deleted or moved.  It's
the architectures' responsibility to ensure existing mappings are removed
when kvm_arch_flush_shadow_memslot() returns.

Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index d81bae8eb55e..fc058ff5f4b6 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -453,6 +453,12 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 				   struct kvm_memory_slot *slot)
 {
+	gpa_t gpa = slot->base_gfn << PAGE_SHIFT;
+	phys_addr_t size = slot->npages << PAGE_SHIFT;
+
+	spin_lock(&kvm->mmu_lock);
+	stage2_unmap_range(kvm, gpa, size, false);
+	spin_unlock(&kvm->mmu_lock);
 }
 
 void kvm_arch_commit_memory_region(struct kvm *kvm,
-- 
2.34.0.rc0.344.g81b53c2807-goog


