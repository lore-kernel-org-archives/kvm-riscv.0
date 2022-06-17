From: Sean Christopherson <seanjc@google.com>
Date: Fri, 17 Jun 2022 16:53:39 +0000
Subject: [PATCH v6 17/22] KVM: x86/mmu: Cache the access bits of shadowed
 translations
In-Reply-To: <20220516232138.1783324-18-dmatlack@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-18-dmatlack@google.com>
Message-ID: <Yqyxk59MwjM6wzZU@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 16, 2022, David Matlack wrote:

Please lead with what the patch actually does, e.g. move paragraphs three and four
ito the top and reword paragraph three to be a command.  I already know what this
patch does and still had a hard time finding that information in the changelog.

> Splitting huge pages requires allocating/finding shadow pages to replace
> the huge page. Shadow pages are keyed, in part, off the guest access
> permissions they are shadowing. For fully direct MMUs, there is no
> shadowing so the access bits in the shadow page role are always ACC_ALL.
> But during shadow paging, the guest can enforce whatever access
> permissions it wants.
> 
> When KVM is resolving a fault, it walks the guest pages tables to
> determine the guest access permissions. But that is difficult to plumb
> when splitting huge pages outside of a fault context, e.g. for eager
> page splitting.
> 
> To enable eager page splitting, KVM can cache the shadowed (guest)
> access permissions whenever it updates the shadow page tables (e.g.
> during fault, or FNAME(sync_page)). In fact KVM already does this to
> cache the shadowed GFN using the gfns array in the shadow page.
> The access bits only take up 3 bits, which leaves 61 bits left over for
> gfns, which is more than enough. So this change does not require any
> additional memory.
> 
> Now that the gfns array caches more information than just GFNs, rename
> it to shadowed_translation.
> 
> While here, preemptively fix up the WARN_ON() that detects gfn
> mismatches in direct SPs. The WARN_ON() was paired with a
> pr_err_ratelimited(), which means that users could sometimes see the
> WARN without the accompanying error message. Fix this by outputting the
> error message as part of the WARN splat.

If you're going do this cleanup, I vote to make them WARN_ONCE().  If these fire,
then they are all but guaranteed to fire _a lot_ and will bring down the kernel.
Spamming the log is unlikely to help debug problems, i.e. a single splat should
be sufficient to alert a downstream debugger that a VM crash was more than likely
due to a KVM MMU bug.

> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

...

> +static void kvm_mmu_page_set_translation(struct kvm_mmu_page *sp, int index, gfn_t gfn, u32 access)

"unsigned int access", and I would prefer that we are a bit more agressive in
wrapping, i.e. run past 80 chars only when it's silly to wrap or when not wrapping
is inarguably easier to read.

E.g. I completely agree that letting this

	sp->shadowed_translation = kvm_mmu_memory_cache_alloc(caches->shadowed_info_cache);

is better than

	sp->shadowed_translation =
		kvm_mmu_memory_cache_alloc(caches->shadowed_info_cache);

but I'd prefer we don't end up with function prototypes that have multiple parameters
ending after 80 chars.


diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 09135fcfbfcf..36176af6e4c3 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -743,7 +743,8 @@ static u32 kvm_mmu_page_get_access(struct kvm_mmu_page *sp, int index)
        return sp->role.access;
 }

-static void kvm_mmu_page_set_translation(struct kvm_mmu_page *sp, int index, gfn_t gfn, u32 access)
+static void kvm_mmu_page_set_translation(struct kvm_mmu_page *sp, int index,
+                                        gfn_t gfn, unsigned int access)
 {
        if (sp_has_gptes(sp)) {
                sp->shadowed_translation[index] = (gfn << PAGE_SHIFT) | access;
@@ -761,7 +762,8 @@ static void kvm_mmu_page_set_translation(struct kvm_mmu_page *sp, int index, gfn
             sp->gfn, kvm_mmu_page_get_gfn(sp, index), gfn);
 }

-static void kvm_mmu_page_set_access(struct kvm_mmu_page *sp, int index, u32 access)
+static void kvm_mmu_page_set_access(struct kvm_mmu_page *sp, int index,
+                                   unsigned int access)
 {
        gfn_t gfn = kvm_mmu_page_get_gfn(sp, index);

@@ -2201,7 +2203,8 @@ static struct kvm_mmu_page *kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
        return __kvm_mmu_get_shadow_page(vcpu->kvm, vcpu, &caches, gfn, role);
 }

-static union kvm_mmu_page_role kvm_mmu_child_role(u64 *sptep, bool direct, u32 access)
+static union kvm_mmu_page_role kvm_mmu_child_role(u64 *sptep, bool direct,
+                                                 unsigned int access)
 {
        struct kvm_mmu_page *parent_sp = sptep_to_sp(sptep);
        union kvm_mmu_page_role role;


> @@ -1054,12 +1055,15 @@ static int FNAME(sync_page)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp)
>  		if (sync_mmio_spte(vcpu, &sp->spt[i], gfn, pte_access))
>  			continue;
>  
> -		if (gfn != sp->gfns[i]) {
> +		if (gfn != kvm_mmu_page_get_gfn(sp, i)) {

This will conflict with kvm/queue, resolution is straightforward:

		if ((!pte_access && !shadow_present_mask) ||
		    gfn != kvm_mmu_page_get_gfn(sp, i)) {

>  			drop_spte(vcpu->kvm, &sp->spt[i]);
>  			flush = true;
>  			continue;
>  		}
>  
> +		/* Update the shadowed access bits in case they changed. */
> +		kvm_mmu_page_set_access(sp, i, pte_access);
> +
>  		sptep = &sp->spt[i];
>  		spte = *sptep;
>  		host_writable = spte & shadow_host_writable_mask;
> -- 
> 2.36.0.550.gb090851708-goog
> 

