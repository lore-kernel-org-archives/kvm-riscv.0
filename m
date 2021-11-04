From: Sean Christopherson <seanjc@google.com>
Date: Thu,  4 Nov 2021 00:25:15 +0000
Subject: [PATCH v5.5 14/30] KVM: Stop passing kvm_userspace_memory_region to
 arch memslot hooks
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
Message-ID: <20211104002531.1176691-15-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Drop the @mem param from kvm_arch_{prepare,commit}_memory_region() now
that its use has been removed in all architectures.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c       | 2 --
 arch/mips/kvm/mips.c       | 2 --
 arch/powerpc/kvm/powerpc.c | 2 --
 arch/riscv/kvm/mmu.c       | 2 --
 arch/s390/kvm/kvm-s390.c   | 2 --
 arch/x86/kvm/x86.c         | 2 --
 include/linux/kvm_host.h   | 2 --
 virt/kvm/kvm_main.c        | 9 ++++-----
 8 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 21213cba7c47..a76718388cbd 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1463,7 +1463,6 @@ int kvm_mmu_init(u32 *hyp_va_bits)
 }
 
 void kvm_arch_commit_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   struct kvm_memory_slot *old,
 				   const struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
@@ -1486,7 +1485,6 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 }
 
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   const struct kvm_memory_slot *old,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index b7aa8fa4a5fb..47b7dc149032 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -233,7 +233,6 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 }
 
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   const struct kvm_memory_slot *old,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
@@ -242,7 +241,6 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 }
 
 void kvm_arch_commit_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   struct kvm_memory_slot *old,
 				   const struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 59342237e046..52ab1782b257 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -706,7 +706,6 @@ void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
 }
 
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   const struct kvm_memory_slot *old,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
@@ -715,7 +714,6 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 }
 
 void kvm_arch_commit_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   struct kvm_memory_slot *old,
 				   const struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index db5230ec6951..0732867d398c 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -456,7 +456,6 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 }
 
 void kvm_arch_commit_memory_region(struct kvm *kvm,
-				const struct kvm_userspace_memory_region *mem,
 				struct kvm_memory_slot *old,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change)
@@ -471,7 +470,6 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 }
 
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   const struct kvm_memory_slot *old,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index e69ad13612d9..81f90891db0f 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -5016,7 +5016,6 @@ vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
 
 /* Section: memory related */
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   const struct kvm_memory_slot *old,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
@@ -5044,7 +5043,6 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 }
 
 void kvm_arch_commit_memory_region(struct kvm *kvm,
-				const struct kvm_userspace_memory_region *mem,
 				struct kvm_memory_slot *old,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index c68e7de9f116..80e726f73dd7 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11727,7 +11727,6 @@ void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen)
 }
 
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   const struct kvm_memory_slot *old,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
@@ -11831,7 +11830,6 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
 }
 
 void kvm_arch_commit_memory_region(struct kvm *kvm,
-				const struct kvm_userspace_memory_region *mem,
 				struct kvm_memory_slot *old,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f8e79cf7584f..2ef946e94a73 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -826,12 +826,10 @@ int __kvm_set_memory_region(struct kvm *kvm,
 void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot);
 void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen);
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				const struct kvm_userspace_memory_region *mem,
 				const struct kvm_memory_slot *old,
 				struct kvm_memory_slot *new,
 				enum kvm_mr_change change);
 void kvm_arch_commit_memory_region(struct kvm *kvm,
-				const struct kvm_userspace_memory_region *mem,
 				struct kvm_memory_slot *old,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 389243120435..9c75691b98ba 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1535,7 +1535,6 @@ static void kvm_copy_memslots_arch(struct kvm_memslots *to,
 }
 
 static int kvm_set_memslot(struct kvm *kvm,
-			   const struct kvm_userspace_memory_region *mem,
 			   struct kvm_memory_slot *new,
 			   enum kvm_mr_change change)
 {
@@ -1621,7 +1620,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 		old.as_id = new->as_id;
 	}
 
-	r = kvm_arch_prepare_memory_region(kvm, mem, &old, new, change);
+	r = kvm_arch_prepare_memory_region(kvm, &old, new, change);
 	if (r)
 		goto out_slots;
 
@@ -1637,7 +1636,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 	else if (change == KVM_MR_CREATE)
 		kvm->nr_memslot_pages += new->npages;
 
-	kvm_arch_commit_memory_region(kvm, mem, &old, new, change);
+	kvm_arch_commit_memory_region(kvm, &old, new, change);
 
 	/* Free the old memslot's metadata.  Note, this is the full copy!!! */
 	if (change == KVM_MR_DELETE)
@@ -1722,7 +1721,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		new.id = id;
 		new.as_id = as_id;
 
-		return kvm_set_memslot(kvm, mem, &new, KVM_MR_DELETE);
+		return kvm_set_memslot(kvm, &new, KVM_MR_DELETE);
 	}
 
 	new.as_id = as_id;
@@ -1785,7 +1784,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 			bitmap_set(new.dirty_bitmap, 0, new.npages);
 	}
 
-	r = kvm_set_memslot(kvm, mem, &new, change);
+	r = kvm_set_memslot(kvm, &new, change);
 	if (r)
 		goto out_bitmap;
 
-- 
2.33.1.1089.g2158813163f-goog


