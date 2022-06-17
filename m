From: Sean Christopherson <seanjc@google.com>
Date: Fri, 17 Jun 2022 17:41:52 +0000
Subject: [PATCH v6 21/22] KVM: Allow for different capacities in
 kvm_mmu_memory_cache structs
In-Reply-To: <20220516232138.1783324-22-dmatlack@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-22-dmatlack@google.com>
Message-ID: <Yqy84GkGAdE1BzI6@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 16, 2022, David Matlack wrote:
> -int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
> +static int __kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int capacity, int min)

I still find it somewhat kludgy to have callers provide an capacity.  It's not
terrible while there's only a single call site, but if a use case comes along
for using an oversized cache with multiple call sites, it'll be gross.

Tweaking my idea of a "custom" wrapper, what about adding an "oversized" wrapper?
That yields clear, firm rules on when to use each helper, guards against calling
the "standard" flavor with an impossible @min, and addresses Mingwei's concern
that a misguided user could specify a nonsensically small capacity.

The only quirk is that kvm_mmu_topup_memory_cache_oversized() has a fixed min,
but IMO that's an acceptable tradeoff, and it's a non-issue until another user
pops up.

static int __kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc,
					int capacity, int min)
{
	gfp_t gfp = GFP_KERNEL_ACCOUNT;
	void *obj;

	if (mc->nobjs >= min)
		return 0;

	if (unlikely(!mc->objects)) {
		capacity = max(min, KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE);

		mc->objects = kvmalloc_array(sizeof(void *), capacity, gfp);
		if (!mc->objects)
			return -ENOMEM;

		mc->capacity = capacity;
	}

	/* It is illegal to request a different capacity across topups. */
	if (WARN_ON_ONCE(mc->capacity != capacity))
		return -EIO;

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

	if (WARN_ON_ONCE(min > capacity))
		min = capacity;

	return __kvm_mmu_topup_memory_cache(mc, capacity, min);
}

/* Oversized caches have a fixed size, i.e. min == capacity == size. */
int kvm_mmu_topup_memory_cache_oversized(struct kvm_mmu_memory_cache *mc, int size)
{
	if (WARN_ON_ONCE(size < KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE)
		size = KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE;

	return __kvm_mmu_topup_memory_cache(mc, size, size);
}

