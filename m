From: Sean Christopherson <seanjc@google.com>
Date: Fri, 17 Jun 2022 01:19:56 +0000
Subject: [PATCH v6 04/22] KVM: x86/mmu: Derive shadow MMU page role from
 parent
In-Reply-To: <20220516232138.1783324-5-dmatlack@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-5-dmatlack@google.com>
Message-ID: <YqvWvBv27fYzOFdE@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 16, 2022, David Matlack wrote:
> Instead of computing the shadow page role from scratch for every new
> page, derive most of the information from the parent shadow page.  This
> eliminates the dependency on the vCPU root role to allocate shadow page
> tables, and reduces the number of parameters to kvm_mmu_get_page().
> 
> Preemptively split out the role calculation to a separate function for
> use in a following commit.
> 
> Note that when calculating the MMU root role, we can take
> @role.passthrough, @role.direct, and @role.access directly from
> @vcpu->arch.mmu->root_role. Only @role.level and @role.quadrant still
> must be overridden for PAE page directories.

Nit, instead of "for PAE page directories", something like "when shadowing 32-bit
guest page tables with PAE page tables".  Not all PAE PDEs need to be overridden.

> No functional change intended.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c         | 98 +++++++++++++++++++++++-----------
>  arch/x86/kvm/mmu/paging_tmpl.h |  9 ++--
>  2 files changed, 71 insertions(+), 36 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index a9d28bcabcbb..515e0b33144a 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c

...

> -	if (level <= vcpu->arch.mmu->cpu_role.base.level)
> -		role.passthrough = 0;
> -
>  	sp_list = &vcpu->kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
>  	for_each_valid_sp(vcpu->kvm, sp, sp_list) {
>  		if (sp->gfn != gfn) {

...

> +static union kvm_mmu_page_role kvm_mmu_child_role(u64 *sptep, bool direct, u32 access)
> +{
> +	struct kvm_mmu_page *parent_sp = sptep_to_sp(sptep);
> +	union kvm_mmu_page_role role;
> +
> +	role = parent_sp->role;
> +	role.level--;
> +	role.access = access;
> +	role.direct = direct;
> +	role.passthrough = 0;

I don't love that this subtly relies on passthrough being limited to 5-level nNPT
with 4-level L1 NPT.  That's really just an implementation oddity, e.g. KVM can
and (hopefully) will eventually use passthrough pages for at least level=4 when
shadowing 3-level or 2-level NPT.

The easiest thing would be to add a WARN so that we don't forget to handle this
when this collides with Lai's series, and to document why KVM never sets "passthrough"
for child shadow pages.  The latter is especially confusing because it does have
other passthrough pages, they just don't happen to have an associated "struct kvm_mmu_page".

	/*
	 * KVM currently doesn't use "struct kvm_mmu_page" to track passthrough
	 * pages when the guest is using 3-level or 2-level NPT, and instead
	 * uses bare page allocations (see pml4/5_root and pae_root).  The only
	 * scenario where KVM uses a passthrough "struct kvm_mmu_page" is when
	 * shadowing 4-level NPT with 5-level nNPT.  So even though passthrough
	 * child pages do exist, such pages aren't tracked in the list of shadow
	 * pages and so don't need to compute a role.
	 */
	WARN_ON_ONCE(role.passthrough && role.level != PT64_ROOT_4LEVEL);
	role.passthrough = 0;

> +
> +	/*
> +	 * If the guest has 4-byte PTEs then that means it's using 32-bit,
> +	 * 2-level, non-PAE paging. KVM shadows such guests with PAE paging
> +	 * (i.e. 8-byte PTEs). The difference in PTE size means that KVM must
> +	 * shadow each guest page table with multiple shadow page tables, which
> +	 * requires extra bookkeeping in the role.
> +	 *
> +	 * Specifically, to shadow the guest's page directory (which covers a
> +	 * 4GiB address space), KVM uses 4 PAE page directories, each mapping

Nit, it's worth explicitly saying "virtual address space" at least once.

> +	 * 1GiB of the address space. @role.quadrant encodes which quarter of
> +	 * the address space each maps.
> +	 *
> +	 * To shadow the guest's page tables (which each map a 4MiB region), KVM
> +	 * uses 2 PAE page tables, each mapping a 2MiB region. For these,
> +	 * @role.quadrant encodes which half of the region they map.

Oof, so I really like this comment because it simplifies the concept, but it glosses
over one very crucial detail.  The 32-bit GPTE consumes bits 21:12, and the 64-bit PTE
consumes bits 20:12.  So while it's absolutely correct to state the the quadrant
encodes which half, bit 21 is consumed when doing a lookup in the _parent_, which
is the _least_ significant bit in when indexing PDEs, hence the quadrant essentially
becomes evens and odds.  Specifically, it does NOT split the parent PD down the middle.

Paolo's more concrete comment about bits helps a map things out explicit.  Paolo is
going to snag the above, so for your looming rebase, how about replacing the paragraph
below with a version of Paolo's concrete example to pair with your abstract definition?

	 *
	 * Concretely, a 4-byte PDE consumes bits 31:22, while an 8-byte PDE
	 * consumes bits 29:21.  To consume bits 31:30, KVM's uses 4 shadow
	 * PDPTEs; those 4 PAE page directories are pre-allocated and their
	 * quadrant is assigned in mmu_alloc_root().  To consume bit 21, KVM
	 * uses an additional PDE in every PD; the page table being configured
	 * here is what's pointed at by the PDE.  Thus, bit 21 is the _least_
	 * significant bit of the PDE index pointing at the shadow PT.
	 */

[*] https://lore.kernel.org/all/090e701d-6893-ea25-1237-233ff3dd01ee at redhat.com

> +	 *
> +	 * Note, the 4 PAE page directories are pre-allocated and the quadrant
> +	 * assigned in mmu_alloc_root(). So only page tables need to be handled
> +	 * here.
> +	 */
> +	if (role.has_4_byte_gpte) {
> +		WARN_ON_ONCE(role.level != PG_LEVEL_4K);
> +		role.quadrant = (sptep - parent_sp->spt) % 2;

Oh hell no.  LOL.  It took me a _long_ time to realize you're doing pointer arithmetic
on "u64 *".  I actually booted a 32-bit VM with printks and even then it still took
me a good 20 seconds wondering if I was having a brain fart and simply forgot how mod
works.

The calculation is also unnecessarily costly; not that anyone is likely to notice,
but still.  The compiler doesn't know that sptep and parent_sp->spt are intertwined
and so can't optimize, i.e. is forced to do the subtraction.

A more efficient equivalent that doesn't require pointer arithmetic:

	role.quadrant = ((unsigned long)sptep / sizeof(*sptep)) & 1;

