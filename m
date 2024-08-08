From: Alex Bennée <alex.bennee@linaro.org>
Date: Thu, 08 Aug 2024 13:00:00 +0100
Subject: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn()
 might sleep
In-Reply-To: <20240726235234.228822-14-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:22 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-14-seanjc@google.com>
Message-ID: <87bk23ql6n.fsf@draig.linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> Now that hva_to_pfn() no longer supports being called in atomic context,
> move the might_sleep() annotation from hva_to_pfn_slow() to
> hva_to_pfn().

The commentary for hva_to_pfn_fast disagrees.

  /*
   * The fast path to get the writable pfn which will be stored in @pfn,
   * true indicates success, otherwise false is returned.  It's also the
   * only part that runs if we can in atomic context.
   */
  static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)

At which point did it loose the ability to run in the atomic context? I
couldn't work it out from the commits.

>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/kvm_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 84c73b4fc804..03af1a0090b1 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2807,8 +2807,6 @@ static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
>  	struct page *page;
>  	int npages;
>  
> -	might_sleep();
> -
>  	if (writable)
>  		*writable = write_fault;
>  
> @@ -2947,6 +2945,8 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
>  	kvm_pfn_t pfn;
>  	int npages, r;
>  
> +	might_sleep();
> +
>  	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
>  		return pfn;

-- 
Alex Benn?e
Virtualisation Tech Lead @ Linaro

