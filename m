From: Sean Christopherson <seanjc@google.com>
Date: Thu,  4 Nov 2021 00:25:04 +0000
Subject: [PATCH v5.5 03/30] KVM: Require total number of memslot pages to fit
 in an unsigned long
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
Message-ID: <20211104002531.1176691-4-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Explicitly disallow creating more memslot pages than can fit in an
unsigned long, KVM doesn't correctly handle a total number of memslot
pages that doesn't fit in an unsigned long and remedying that would be a
waste of time.

For a 64-bit kernel, this is a nop as memslots are not allowed to overlap
in the gfn address space.

With a 32-bit kernel, userspace can at most address 3gb of virtual memory,
whereas wrapping the total number of pages would require 4tb+ of guest
physical memory.  Even with x86's second address space for SMM, userspace
would need to alias all of guest memory more than one _thousand_ times.
And on older x86 hardware with MAXPHYADDR < 43, the guest couldn't
actually access any of those aliases even if userspace lied about
guest.MAXPHYADDR.

On 390 and arm64, this is a nop as they don't support 32-bit hosts.

On x86, practically speaking this is simply acknowledging reality as the
existing kvm_mmu_calculate_default_mmu_pages() assumes the total number
of pages fits in an "unsigned long".

On PPC, this is likely a nop as every flavor of PPC KVM assumes gfns (and
gpas!) fit in unsigned long.  arch/powerpc/kvm/book3s_32_mmu_host.c goes
a step further and fails the build if CONFIG_PTE_64BIT=y, which
presumably means that it does't support 64-bit physical addresses.

On MIPS, this is also likely a nop as the core MMU helpers assume gpas
fit in unsigned long, e.g. see kvm_mips_##name##_pte.

And finally, RISC-V is a "don't care" as it doesn't exist in any release,
i.e. there is no established ABI to break.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  1 +
 virt/kvm/kvm_main.c      | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 60a35d9fe259..d8e92d4a78d8 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -551,6 +551,7 @@ struct kvm {
 	 */
 	struct mutex slots_arch_lock;
 	struct mm_struct *mm; /* userspace tied to this vm */
+	unsigned long nr_memslot_pages;
 	struct kvm_memslots __rcu *memslots[KVM_ADDRESS_SPACE_NUM];
 	struct kvm_vcpu *vcpus[KVM_MAX_VCPUS];
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 83287730389f..264c4b16520b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1623,6 +1623,15 @@ static int kvm_set_memslot(struct kvm *kvm,
 	update_memslots(slots, new, change);
 	slots = install_new_memslots(kvm, as_id, slots);
 
+	/*
+	 * Update the total number of memslot pages before calling the arch
+	 * hook so that architectures can consume the result directly.
+	 */
+	if (change == KVM_MR_DELETE)
+		kvm->nr_memslot_pages -= old.npages;
+	else if (change == KVM_MR_CREATE)
+		kvm->nr_memslot_pages += new->npages;
+
 	kvm_arch_commit_memory_region(kvm, mem, &old, new, change);
 
 	/* Free the old memslot's metadata.  Note, this is the full copy!!! */
@@ -1653,6 +1662,9 @@ static int kvm_delete_memslot(struct kvm *kvm,
 	if (!old->npages)
 		return -EINVAL;
 
+	if (WARN_ON_ONCE(kvm->nr_memslot_pages < old->npages))
+		return -EIO;
+
 	memset(&new, 0, sizeof(new));
 	new.id = old->id;
 	/*
@@ -1736,6 +1748,13 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	if (!old.npages) {
 		change = KVM_MR_CREATE;
 		new.dirty_bitmap = NULL;
+
+		/*
+		 * To simplify KVM internals, the total number of pages across
+		 * all memslots must fit in an unsigned long.
+		 */
+		if ((kvm->nr_memslot_pages + new.npages) < kvm->nr_memslot_pages)
+			return -EINVAL;
 	} else { /* Modify an existing slot. */
 		if ((new.userspace_addr != old.userspace_addr) ||
 		    (new.npages != old.npages) ||
-- 
2.33.1.1089.g2158813163f-goog


