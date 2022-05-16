From: Sean Christopherson <seanjc@google.com>
Date: Mon, 16 May 2022 14:49:19 +0000
Subject: [PATCH v5 20/21] KVM: Allow for different capacities in
 kvm_mmu_memory_cache structs
In-Reply-To: <20220513202819.829591-21-dmatlack@google.com>
References: <20220513202819.829591-1-dmatlack@google.com>
 <20220513202819.829591-21-dmatlack@google.com>
Message-ID: <YoJkb7oMEz0v1dnp@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 13, 2022, David Matlack wrote:
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 53ae2c0640bc..2f2ef6b60ff4 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -764,7 +764,10 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
>  {
>  	phys_addr_t addr;
>  	int ret = 0;
> -	struct kvm_mmu_memory_cache cache = { 0, __GFP_ZERO, NULL, };
> +	struct kvm_mmu_memory_cache cache = {
> +		.capacity = KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE,
> +		.gfp_zero = __GFP_ZERO,

I dislike requiring all users to specificy the capacity.  It largely defeats the
purpose of KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE, and bleeds details into code that
really doesn't care all that much about the details.

Rather than force the capacity to be set before topup, what about adding a custom
capacity topup helper?  That allows keeping a default capacity, better documents
the caches that are special, and provides an opportunity to sanity check that the
capacity isn't incorrectly changed by the user.  

And then I believe this code becomes:

	struct kvm_mmu_memory_cache cache = { .gfp_zero = __GFP_ZERO };

E.g. (completely untested)

static int __kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc,
					int capacity, int min)
{
	gfp_t gfp = GFP_KERNEL_ACCOUNT;
	void *obj;

	if (mc->nobjs >= min)
		return 0;

	if (likely(mc->capacity)) {
		if (WARN_ON_ONCE(mc->capacity != capacity || !mc->objects))
			return -EIO;
	} else {
		mc->objects = kvmalloc_array(sizeof(void *), capacity, gfp);
		if (!mc->objects)
			return -ENOMEM;

		mc->capacity = capacity;
	}

	while (mc->nobjs < mc->capacity) {
		obj = mmu_memory_cache_alloc_obj(mc, gfp);
		if (!obj)
			return mc->nobjs >= min ? 0 : -ENOMEM;
		mc->objects[mc->nobjs++] = obj;
	}
	return 0;
}

int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
{
	const int capacity = KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE;

	return __kvm_mmu_topup_memory_cache(mc, capacity, min);
}

int kvm_mmu_topup_custom_memory_cache(struct kvm_mmu_memory_cache *mc,
				      int capacity)
{
	return __kvm_mmu_topup_memory_cache(mc, capacity, capacity);
}


