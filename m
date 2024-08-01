From: Alex Bennée <alex.bennee@linaro.org>
Date: Thu, 01 Aug 2024 10:20:59 +0100
Subject: [PATCH v12 05/84] KVM: Add kvm_release_page_unused() API to put
 pages that KVM never consumes
In-Reply-To: <20240726235234.228822-6-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:14 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-6-seanjc@google.com>
Message-ID: <87wml0egzo.fsf@draig.linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> Add an API to release an unused page, i.e. to put a page without marking
> it accessed or dirty.  The API will be used when KVM faults-in a page but
> bails before installing the guest mapping (and other similar flows).
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  include/linux/kvm_host.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 3d9617d1de41..c5d39a337aa3 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1201,6 +1201,15 @@ unsigned long gfn_to_hva_prot(struct kvm *kvm, gfn_t gfn, bool *writable);
>  unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot, gfn_t gfn);
>  unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gfn_t gfn,
>  				      bool *writable);
> +
> +static inline void kvm_release_page_unused(struct page *page)
> +{
> +	if (!page)
> +		return;
> +
> +	put_page(page);
> +}

I guess it's unfamiliarity with the mm layout but I was trying to find
where the get_pages come from to see the full pattern of allocate and
return. I guess somewhere in the depths of hva_to_pfn() from
hva_to_pfn_retry()? I think the indirection of the page walking confuses
me ;-)

Anyway the API seems reasonable enough given the other kvm_release_
functions.

Reviewed-by: Alex Benn?e <alex.bennee@linaro.org>

-- 
Alex Benn?e
Virtualisation Tech Lead @ Linaro

