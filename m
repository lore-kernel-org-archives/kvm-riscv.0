From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:11 -0700
Subject: [PATCH v12 62/84] KVM: PPC: Book3S: Mark "struct page" pfns
 dirty/accessed after installing PTE
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-63-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mark pages/folios dirty/accessed after installing a PTE, and more
specifically after acquiring mmu_lock and checking for an mmu_notifier
invalidation.  Marking a page/folio dirty after it has been written back
can make some filesystems unhappy (backing KVM guests will such filesystem
files is uncommon, and the race is minuscule, hence the lack of complaints).
See the link below for details.

This will also allow converting Book3S to kvm_release_faultin_page(),
which requires that mmu_lock be held (for the aforementioned reason).

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes at gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_64_mmu_host.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_host.c b/arch/powerpc/kvm/book3s_64_mmu_host.c
index bc6a381b5346..d0e4f7bbdc3d 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_host.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_host.c
@@ -121,13 +121,10 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 
 	vpn = hpt_vpn(orig_pte->eaddr, map->host_vsid, MMU_SEGSIZE_256M);
 
-	kvm_set_pfn_accessed(pfn);
 	if (!orig_pte->may_write || !writable)
 		rflags |= PP_RXRX;
-	else {
+	else
 		mark_page_dirty(vcpu->kvm, gfn);
-		kvm_set_pfn_dirty(pfn);
-	}
 
 	if (!orig_pte->may_execute)
 		rflags |= HPTE_R_N;
@@ -202,8 +199,11 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 	}
 
 out_unlock:
+	if (!orig_pte->may_write || !writable)
+		kvm_release_pfn_clean(pfn);
+	else
+		kvm_release_pfn_dirty(pfn);
 	spin_unlock(&kvm->mmu_lock);
-	kvm_release_pfn_clean(pfn);
 	if (cpte)
 		kvmppc_mmu_hpte_cache_free(cpte);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


