From: Sean Christopherson <seanjc@google.com>
Date: Thu, 5 May 2022 23:00:39 +0000
Subject: [PATCH v4 08/20] KVM: x86/mmu: Pass memory caches to allocate
 SPs separately
In-Reply-To: <20220422210546.458943-9-dmatlack@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-9-dmatlack@google.com>
Message-ID: <YnRXFyTik32RIxNp@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 22, 2022, David Matlack wrote:
> Refactor kvm_mmu_alloc_shadow_page() to receive the caches from which it
> will allocate the various pieces of memory for shadow pages as a
> parameter, rather than deriving them from the vcpu pointer. This will be
> useful in a future commit where shadow pages are allocated during VM
> ioctls for eager page splitting, and thus will use a different set of
> caches.
> 
> Preemptively pull the caches out all the way to
> kvm_mmu_get_shadow_page() since eager page splitting will not be calling
> kvm_mmu_alloc_shadow_page() directly.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

...

>  static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu,
> +						      struct shadow_page_caches *caches,

Definitely work doing the "kvm" capture in an earlier patch, and doing the s/vcpu/kvm
here, the diff on top is tiny.  The shortlog/changelog would need minor tweaks, but
that's not a big deal.

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index da1c3cf91778..15784bab985f 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2084,13 +2084,12 @@ struct shadow_page_caches {
        struct kvm_mmu_memory_cache *gfn_array_cache;
 };

-static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu,
+static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm *kvm,
                                                      struct shadow_page_caches *caches,
                                                      gfn_t gfn,
                                                      struct hlist_head *sp_list,
                                                      union kvm_mmu_page_role role)
 {
-       struct kvm *kvm = vcpu->kvm;
        struct kvm_mmu_page *sp;

        sp = kvm_mmu_memory_cache_alloc(caches->page_header_cache);
@@ -2133,7 +2132,7 @@ static struct kvm_mmu_page *__kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
        sp = kvm_mmu_find_shadow_page(vcpu, gfn, sp_list, role);
        if (!sp) {
                created = true;
-               sp = kvm_mmu_alloc_shadow_page(vcpu, caches, gfn, sp_list, role);
+               sp = kvm_mmu_alloc_shadow_page(vcpu->kvm, caches, gfn, sp_list, role);
        }

        trace_kvm_mmu_get_page(sp, created);


