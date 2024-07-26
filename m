From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:06 -0700
Subject: [PATCH v12 57/84] KVM: RISC-V: Mark "struct page" pfns accessed
 before dropping mmu_lock
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-58-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that RISC-V can convert to kvm_release_faultin_page() without tripping
its lockdep assertion on mmu_lock being held.  Marking pages accessed
outside of mmu_lock is ok (not great, but safe), but marking pages _dirty_
outside of mmu_lock can make filesystems unhappy.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 06aa5a0d056d..806f68e70642 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -683,10 +683,10 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 out_unlock:
 	if ((!ret || ret == -EEXIST) && writable)
 		kvm_set_pfn_dirty(hfn);
+	else
+		kvm_release_pfn_clean(hfn);
 
 	spin_unlock(&kvm->mmu_lock);
-	kvm_set_pfn_accessed(hfn);
-	kvm_release_pfn_clean(hfn);
 	return ret;
 }
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


