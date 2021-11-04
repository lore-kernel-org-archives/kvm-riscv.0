From: Sean Christopherson <seanjc@google.com>
Date: Thu,  4 Nov 2021 00:25:12 +0000
Subject: [PATCH v5.5 11/30] KVM: s390: Use "new" memslot instead of userspace
 memory region
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
Message-ID: <20211104002531.1176691-12-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Get the gfn, size, and hva from the new memslot instead of the userspace
memory region when preparing/committing memory region changes.  This will
allow a future commit to drop the @mem param.

Note, this has a subtle functional change as KVM would previously reject
DELETE if userspace provided a garbage userspace_addr or guest_phys_addr,
whereas KVM zeros those fields in the "new" memslot when deleting an
existing memslot.  Arguably the old behavior is more correct, but there's
zero benefit into requiring userspace to provide sane values for hva and
gfn.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---

If we want to keep the checks for DELETE, my vote would be to add an
arch hook that is dedicated to validated the userspace memory region
so that the prepare/commit hooks operate only on KVM-generate objects.

 arch/s390/kvm/kvm-s390.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index d766d764d24c..e69ad13612d9 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -5021,18 +5021,20 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
 {
+	gpa_t size = new->npages * PAGE_SIZE;
+
 	/* A few sanity checks. We can have memory slots which have to be
 	   located/ended at a segment boundary (1MB). The memory in userland is
 	   ok to be fragmented into various different vmas. It is okay to mmap()
 	   and munmap() stuff in this slot after doing this call at any time */
 
-	if (mem->userspace_addr & 0xffffful)
+	if (new->userspace_addr & 0xffffful)
 		return -EINVAL;
 
-	if (mem->memory_size & 0xffffful)
+	if (size & 0xffffful)
 		return -EINVAL;
 
-	if (mem->guest_phys_addr + mem->memory_size > kvm->arch.mem_limit)
+	if ((new->base_gfn * PAGE_SIZE) + size > kvm->arch.mem_limit)
 		return -EINVAL;
 
 	/* When we are protected, we should not change the memory slots */
@@ -5061,8 +5063,9 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 			break;
 		fallthrough;
 	case KVM_MR_CREATE:
-		rc = gmap_map_segment(kvm->arch.gmap, mem->userspace_addr,
-				      mem->guest_phys_addr, mem->memory_size);
+		rc = gmap_map_segment(kvm->arch.gmap, new->userspace_addr,
+				      new->base_gfn * PAGE_SIZE,
+				      new->npages * PAGE_SIZE);
 		break;
 	case KVM_MR_FLAGS_ONLY:
 		break;
-- 
2.33.1.1089.g2158813163f-goog


