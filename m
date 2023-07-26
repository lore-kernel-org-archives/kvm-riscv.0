From: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Jul 2023 13:22:22 -0700
Subject: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a per-action union
In-Reply-To: <711f74d6-fe15-6bd4-a9b9-c4f178d95bf3@redhat.com>
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-2-seanjc@google.com>
 <711f74d6-fe15-6bd4-a9b9-c4f178d95bf3@redhat.com>
Message-ID: <ZMGAfvzEkVphWPdZ@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 19, 2023, Paolo Bonzini wrote:
> On 7/19/23 01:44, Sean Christopherson wrote:
> > +	BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(gfn_range.arg.raw));
> > +	BUILD_BUG_ON(sizeof(range->arg) != sizeof(range->arg.raw));
> 
> I think these should be static assertions near the definition of the
> structs.  However another possibility is to remove 'raw' and just assign the
> whole union.

Duh, and use a named union.  I think when I first proposed this I forgot that
a single value would be passed between kvm_hva_range *and* kvm_gfn_range, and so
created an anonymous union without thinking about the impliciations.

A named union is _much_ cleaner.  I'll post a complete version of the below
snippet as a standalone non-RFC patch.

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9d3ac7720da9..9125d0ab642d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -256,11 +256,15 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 #endif
 
 #ifdef KVM_ARCH_WANT_MMU_NOTIFIER
+union kvm_mmu_notifier_arg {
+       pte_t pte;
+};
+
 struct kvm_gfn_range {
        struct kvm_memory_slot *slot;
        gfn_t start;
        gfn_t end;
-       pte_t pte;
+       union kvm_mmu_notifier_arg arg;
        bool may_block;
 };
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index dfbaafbe3a00..f84ef9399aee 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -526,7 +526,7 @@ typedef void (*on_unlock_fn_t)(struct kvm *kvm);
 struct kvm_hva_range {
        unsigned long start;
        unsigned long end;
-       pte_t pte;
+       union kvm_mmu_notifier_arg arg;
        hva_handler_t handler;
        on_lock_fn_t on_lock;
        on_unlock_fn_t on_unlock;
@@ -547,6 +547,8 @@ static void kvm_null_fn(void)
 }
 #define IS_KVM_NULL_FN(fn) ((fn) == (void *)kvm_null_fn)
 
+static const union kvm_mmu_notifier_arg KVM_NO_ARG;
+
 /* Iterate over each memslot intersecting [start, last] (inclusive) range */
 #define kvm_for_each_memslot_in_hva_range(node, slots, start, last)         \
        for (node = interval_tree_iter_first(&slots->hva_tree, start, last); \
@@ -591,7 +593,7 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
                         * bother making these conditional (to avoid writes on
                         * the second or later invocation of the handler).
                         */
-                       gfn_range.pte = range->pte;
+                       gfn_range.arg = range->arg;
                        gfn_range.may_block = range->may_block;
 
                        /*


