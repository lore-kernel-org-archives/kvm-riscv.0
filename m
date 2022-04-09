From: Sean Christopherson <seanjc@google.com>
Date: Sat, 9 Apr 2022 00:02:27 +0000
Subject: [PATCH v3 16/23] KVM: x86/mmu: Cache the access bits of shadowed
 translations
In-Reply-To: <20220401175554.1931568-17-dmatlack@google.com>
References: <20220401175554.1931568-1-dmatlack@google.com>
 <20220401175554.1931568-17-dmatlack@google.com>
Message-ID: <YlDNE55k9DNf/v2+@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 01, 2022, David Matlack wrote:
> @@ -733,7 +733,7 @@ static void mmu_free_pte_list_desc(struct pte_list_desc *pte_list_desc)
>  static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index)
>  {
>  	if (!sp->role.direct)
> -		return sp->gfns[index];
> +		return sp->shadowed_translation[index].gfn;
>  
>  	return sp->gfn + (index << ((sp->role.level - 1) * PT64_LEVEL_BITS));
>  }
> @@ -741,7 +741,7 @@ static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index)
>  static void kvm_mmu_page_set_gfn(struct kvm_mmu_page *sp, int index, gfn_t gfn)

This should be replaced with a single helper to set the gfn+access.  Under no
circumstance should _just_ the gfn change, and that will allow us to optimize
writing the entry.  More below.

>  {
>  	if (!sp->role.direct) {
> -		sp->gfns[index] = gfn;
> +		sp->shadowed_translation[index].gfn = gfn;
>  		return;
>  	}
>  
> @@ -752,6 +752,47 @@ static void kvm_mmu_page_set_gfn(struct kvm_mmu_page *sp, int index, gfn_t gfn)
>  				   kvm_mmu_page_get_gfn(sp, index), gfn);
>  }
>  
> +static void kvm_mmu_page_set_access(struct kvm_mmu_page *sp, int index, u32 access)
> +{
> +	if (!sp->role.direct) {
> +		sp->shadowed_translation[index].access = access;
> +		return;
> +	}
> +
> +	if (WARN_ON(access != sp->role.access))
> +		pr_err_ratelimited("access mismatch under direct page %llx "

LOL, I realize this is not your code, but ratelimiting under a WARN ain't gonna
help much :-)

This also generates a warning and fails to compile with KVM_WERROR=y, though I
believe the test bots already reported that.


arch/x86/kvm/mmu/mmu.c: In function ?kvm_mmu_page_set_access?:
include/linux/kern_levels.h:5:25: error: format ?%llx? expects argument of type ?long long unsigned int?, but argument 3 has type ?int? [-Werror=format=]
    5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
      |                         ^~~~~~
include/linux/printk.h:418:25: note: in definition of macro ?printk_index_wrap?
  418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
      |                         ^~~~
include/linux/printk.h:640:17: note: in expansion of macro ?printk?
  640 |                 printk(fmt, ##__VA_ARGS__);                             \
      |                 ^~~~~~
include/linux/printk.h:654:9: note: in expansion of macro ?printk_ratelimited?
  654 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~
include/linux/kern_levels.h:11:25: note: in expansion of macro ?KERN_SOH?
   11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
      |                         ^~~~~~~~
include/linux/printk.h:654:28: note: in expansion of macro ?KERN_ERR?
  654 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |                            ^~~~~~~~
arch/x86/kvm/mmu/mmu.c:763:17: note: in expansion of macro ?pr_err_ratelimited?
  763 |                 pr_err_ratelimited("access mismatch under direct page %llx "
      |                 ^~~~~~~~~~~~~~~~~~


> +				   "(expected %llx, got %llx)\n",
> +				   kvm_mmu_page_get_gfn(sp, index),
> +				   sp->role.access, access);
> +}
> +
> +/*
> + * For leaf SPTEs, fetch the *guest* access permissions being shadowed. Note
> + * that the SPTE itself may have a more constrained access permissions that
> + * what the guest enforces. For example, a guest may create an executable
> + * huge PTE but KVM may disallow execution to mitigate iTLB multihit.
> + */
> +static u32 kvm_mmu_page_get_access(struct kvm_mmu_page *sp, int index)
> +{
> +	if (!sp->role.direct)
> +		return sp->shadowed_translation[index].access;
> +
> +	/*
> +	 * For direct MMUs (e.g. TDP or non-paging guests) there are no *guest*
> +	 * access permissions being shadowed. So we can just return ACC_ALL
> +	 * here.
> +	 *
> +	 * For indirect MMUs (shadow paging), direct shadow pages exist when KVM
> +	 * is shadowing a guest huge page with smaller pages, since the guest
> +	 * huge page is being directly mapped. In this case the guest access
> +	 * permissions being shadowed are the access permissions of the huge
> +	 * page.
> +	 *
> +	 * In both cases, sp->role.access contains exactly what we want.
> +	 */
> +	return sp->role.access;
> +}

...

> diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
> index b6e22ba9c654..3f76f4c1ae59 100644
> --- a/arch/x86/kvm/mmu/mmu_internal.h
> +++ b/arch/x86/kvm/mmu/mmu_internal.h
> @@ -32,6 +32,18 @@ extern bool dbg;
>  
>  typedef u64 __rcu *tdp_ptep_t;
>  
> +/*
> + * Stores the result of the guest translation being shadowed by an SPTE. KVM
> + * shadows two types of guest translations: nGPA -> GPA (shadow EPT/NPT) and
> + * GVA -> GPA (traditional shadow paging). In both cases the result of the
> + * translation is a GPA and a set of access constraints.
> + */
> +struct shadowed_translation_entry {
> +	/* Note, GFNs can have at most 64 - PAGE_SHIFT = 52 bits. */
> +	u64 gfn:52;
> +	u64 access:3;

A bitfield is completely unnecessary and generates bad code.  As is, it generates
_really_ bad code because extracting and setting requires non-standard 64-bit value
masks, multiple operations, and accesses to unaligned data.  The generated code can
be made slightly less awful by using a fully byte for access and 64 bits for GFN,
but it still sucks compared to what we can hand generate.

The other aspect of this is that retrieving the GFN is a frequent operation,
whereas the access is almost never read.  I.e. we should bias for reading the GFN
above all else.

The simple and obvious thing is to not reinvent the wheel.  GFN = (GPA >> PAGE_SHIFT),
and ignoring NX, access lives in the lower 12 bits of a PTE.  Then reading the GFN is
a simple SHR, and reading access info is a simple AND.

We might also be able to optimize FNAME(sync_page), but I don't care much about
that, it's rarely used for nested TDP.

So, keep translation_entry a gfn_t *, then do:

static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index)
{
	if (!sp->role.direct)
		return sp->shadowed_translation[index] >> PAGE_SHIFT;

	return sp->gfn + (index << ((sp->role.level - 1) * PT64_LEVEL_BITS));
}

static void kvm_mmu_page_set_translation(struct kvm_mmu_page *sp, int index,
					 gfn_t gfn, unsigned int access)
{
	if (!sp->role.direct) {
		sp->shadowed_translation[index] = (gfn << PAGE_SHIFT) | access;
		return;
	}

	if (WARN_ON(gfn != kvm_mmu_page_get_gfn(sp, index)))
		pr_err_ratelimited("gfn mismatch under direct page %llx "
				   "(expected %llx, got %llx)\n",
				   sp->gfn,
				   kvm_mmu_page_get_gfn(sp, index), gfn);
}

static void kvm_mmu_page_set_access(struct kvm_mmu_page *sp, int index,
				    unsigned int access)
{
	if (sp->role.direct)
		return;

	sp->shadowed_translation[index] &= PAGE_MASK;
	sp->shadowed_translation[index] |= access;
}


