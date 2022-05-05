From: Sean Christopherson <seanjc@google.com>
Date: Thu, 5 May 2022 23:33:00 +0000
Subject: [PATCH v4 11/20] KVM: x86/mmu: Allow for NULL vcpu pointer in
 __kvm_mmu_get_shadow_page()
In-Reply-To: <20220422210546.458943-12-dmatlack@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-12-dmatlack@google.com>
Message-ID: <YnRerE5+FpwkUdQE@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 22, 2022, David Matlack wrote:
> Allow the vcpu pointer in __kvm_mmu_get_shadow_page() to be NULL. Rename
> it to vcpu_or_null to prevent future commits from accidentally taking
> dependency on it without first considering the NULL case.
> 
> The vcpu pointer is only used for syncing indirect shadow pages in
> kvm_mmu_find_shadow_page(). A vcpu pointer it not required for
> correctness since unsync pages can simply be zapped. But this should
> never occur in practice, since the only use-case for passing a NULL vCPU
> pointer is eager page splitting which will only request direct shadow
> pages (which can never be unsync).
> 
> Even though __kvm_mmu_get_shadow_page() can gracefully handle a NULL
> vcpu, add a WARN() that will fire if __kvm_mmu_get_shadow_page() is ever
> called to get an indirect shadow page with a NULL vCPU pointer, since
> zapping unsync SPs is a performance overhead that should be considered.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 40 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 04029c01aebd..21407bd4435a 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -1845,16 +1845,27 @@ static void kvm_mmu_commit_zap_page(struct kvm *kvm,
>  	  &(_kvm)->arch.mmu_page_hash[kvm_page_table_hashfn(_gfn)])	\
>  		if ((_sp)->gfn != (_gfn) || (_sp)->role.direct) {} else
>  
> -static int kvm_sync_page(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
> -			 struct list_head *invalid_list)
> +static int __kvm_sync_page(struct kvm *kvm, struct kvm_vcpu *vcpu_or_null,
> +			   struct kvm_mmu_page *sp,
> +			   struct list_head *invalid_list)
>  {
> -	int ret = vcpu->arch.mmu->sync_page(vcpu, sp);
> +	int ret = -1;
> +
> +	if (vcpu_or_null)

This should never happen.  I like the idea of warning early, but I really don't
like that the WARN is far removed from the code that actually depends on @vcpu
being non-NULL. Case in point, KVM should have bailed on the WARN and never
reached this point.  And the inner __kvm_sync_page() is completely unnecessary.

I also don't love the vcpu_or_null terminology; I get the intent, but it doesn't
really help because understand why/when it's NULL.

I played around with casting, e.g. to/from an unsigned long or void *, to prevent
usage, but that doesn't work very well because 'unsigned long' ends up being
awkward/confusing, and 'void *' is easily lost on a function call.  And both
lose type safety :-(

All in all, I think I'd prefer this patch to simply be a KVM_BUG_ON() if
kvm_mmu_find_shadow_page() encounters an unsync page.  Less churn, and IMO there's
no real loss in robustness, e.g. we'd really have to screw up code review and
testing to introduce a null vCPU pointer dereference in this code.

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 3d102522804a..5aed9265f592 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2041,6 +2041,13 @@ static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm *kvm,
                        goto out;

                if (sp->unsync) {
+                       /*
+                        * Getting indirect shadow pages without a vCPU pointer
+                        * is not supported, i.e. this should never happen.
+                        */
+                       if (KVM_BUG_ON(!vcpu, kvm))
+                               break;
+
                        /*
                         * The page is good, but is stale.  kvm_sync_page does
                         * get the latest guest state, but (unlike mmu_unsync_children)


