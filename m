From: Yan Zhao <yan.y.zhao@intel.com>
Date: Mon, 21 Oct 2024 16:49:34 +0800
Subject: [PATCH v13 19/85] KVM: Introduce kvm_follow_pfn() to eventually
 replace "gfn_to_pfn" APIs
In-Reply-To: <20241010182427.1434605-20-seanjc@google.com>
References: <20241010182427.1434605-1-seanjc@google.com>
 <20241010182427.1434605-20-seanjc@google.com>
Message-ID: <ZxYVnsW9WF1Wp8mx@yzhao56-desk.sh.intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 10, 2024 at 11:23:21AM -0700, Sean Christopherson wrote:
> --- a/virt/kvm/pfncache.c
> +++ b/virt/kvm/pfncache.c
> @@ -159,6 +159,12 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
>  	kvm_pfn_t new_pfn = KVM_PFN_ERR_FAULT;
>  	void *new_khva = NULL;
>  	unsigned long mmu_seq;
> +	struct kvm_follow_pfn kfp = {
> +		.slot = gpc->memslot,
> +		.gfn = gpa_to_gfn(gpc->gpa),
> +		.flags = FOLL_WRITE,
> +		.hva = gpc->uhva,
> +	};
Is .map_writable uninitialized?

>  
>  	lockdep_assert_held(&gpc->refresh_lock);
>  
> @@ -197,8 +203,7 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
>  			cond_resched();
>  		}
>  
> -		/* We always request a writable mapping */
> -		new_pfn = hva_to_pfn(gpc->uhva, false, false, true, NULL);
> +		new_pfn = hva_to_pfn(&kfp);
>  		if (is_error_noslot_pfn(new_pfn))
>  			goto out_error;
>  
> -- 
> 2.47.0.rc1.288.g06298d1525-goog
> 

