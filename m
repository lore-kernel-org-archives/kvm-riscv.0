From: Sean Christopherson <seanjc@google.com>
Date: Thu,  4 Nov 2021 00:25:18 +0000
Subject: [PATCH v5.5 17/30] KVM: s390: Skip gfn/size sanity checks on memslot
 DELETE or FLAGS_ONLY
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
Message-ID: <20211104002531.1176691-18-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sanity check the hva, gfn, and size of a userspace memory region only if
any of those properties can change, i.e. skip the checks for DELETE and
FLAGS_ONLY.  KVM doesn't allow moving the hva or changing the size, a gfn
change shows up as a MOVE even if flags are being modified, and the
checks are pointless for the DELETE case as userspace_addr and gfn_base
are zeroed by common KVM.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/kvm-s390.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 81f90891db0f..c4d0ed5f3400 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -5020,7 +5020,14 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
 {
-	gpa_t size = new->npages * PAGE_SIZE;
+	gpa_t size;
+
+	/* When we are protected, we should not change the memory slots */
+	if (kvm_s390_pv_get_handle(kvm))
+		return -EINVAL;
+
+	if (change == KVM_MR_DELETE || change == KVM_MR_FLAGS_ONLY)
+		return 0;
 
 	/* A few sanity checks. We can have memory slots which have to be
 	   located/ended at a segment boundary (1MB). The memory in userland is
@@ -5030,15 +5037,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	if (new->userspace_addr & 0xffffful)
 		return -EINVAL;
 
+	size = new->npages * PAGE_SIZE;
 	if (size & 0xffffful)
 		return -EINVAL;
 
 	if ((new->base_gfn * PAGE_SIZE) + size > kvm->arch.mem_limit)
 		return -EINVAL;
 
-	/* When we are protected, we should not change the memory slots */
-	if (kvm_s390_pv_get_handle(kvm))
-		return -EINVAL;
 	return 0;
 }
 
-- 
2.33.1.1089.g2158813163f-goog


