From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Dec 2022 00:11:38 +0100
Subject: [RFC PATCH 02/37] KVM: MMU: Move struct kvm_mmu_page_role into
 common code
In-Reply-To: <20221208193857.4090582-3-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-3-dmatlack@google.com>
Message-ID: <48f4df00-8ef6-042f-c9ae-4023c4f70058@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/8/22 20:38, David Matlack wrote:
> +/*
> + * kvm_mmu_page_role tracks the properties of a shadow page (where shadow page
> + * also includes TDP pages) to determine whether or not a page can be used in
> + * the given MMU context.
> + */
> +union kvm_mmu_page_role {
> +	u32 word;
> +	struct {
> +		struct {
> +			/* The address space ID mapped by the page. */
> +			u16 as_id:8;
> +
> +			/* The level of the page in the page table hierarchy. */
> +			u16 level:4;
> +
> +			/* Whether the page is invalid, i.e. pending destruction. */
> +			u16 invalid:1;
> +		};
> +
> +		/* Architecture-specific properties. */
> +		struct kvm_mmu_page_role_arch arch;
> +	};
> +};
> +

Have you considered adding a tdp_mmu:1 field to the arch-independent 
part?  I think that as long as _that_ field is the same, there's no need 
to have any overlap between TDP MMU and shadow MMU roles.

I'm not even sure if the x86 TDP MMU needs _any_ other role bit.  It 
needs of course the above three, and it also needs "direct" but it is 
used exactly to mean "is this a TDP MMU page".  So we could have

union {
	struct {
		u32 tdp_mmu:1;
		u32 invalid:1;
		u32 :6;
		u32 level:8;
		u32 arch:8;
		u32 :8;
	} tdp;
	/* the first field must be "u32 tdp_mmu:1;" */
	struct kvm_mmu_page_role_arch shadow;
};

Paolo


