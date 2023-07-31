From: Oliver Upton <oliver.upton@linux.dev>
Date: Mon, 31 Jul 2023 17:37:37 +0000
Subject: [PATCH] KVM: Wrap kvm_{gfn,hva}_range.pte in a per-action union
In-Reply-To: <20230729004144.1054885-1-seanjc@google.com>
References: <20230729004144.1054885-1-seanjc@google.com>
Message-ID: <ZMfxYR41K71UV/84@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 28, 2023 at 05:41:44PM -0700, Sean Christopherson wrote:
> Wrap kvm_{gfn,hva}_range.pte in a union so that future notifier events can
> pass event specific information up and down the stack without needing to
> constantly expand and churn the APIs.  Lockless aging of SPTEs will pass
> around a bitmap, and support for memory attributes will pass around the
> new attributes for the range.
> 
> Add a "KVM_NO_ARG" placeholder to simplify handling events without an
> argument (creating a dummy union variable is midly annoying).
> 
> Opportunstically drop explicit zero-initialization of the "pte" field, as
> omitting the field (now a union) has the same effect.
> 
> Cc: Yu Zhao <yuzhao@google.com>
> Link: https://lore.kernel.org/all/CAOUHufagkd2Jk3_HrVoFFptRXM=hX2CV8f+M-dka-hJU4bP8kw at mail.gmail.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Looks good, and I don't think it'll conflict with anything on the arm64
side.

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

> ---
> 
> If this looks good, my thought is to squeeze it into 6.6 so that the MGLRU
> and guest_memfd() series can build on it.  Or those series could just
> include it?

Eh, I'm not a huge fan of having two series independently reposting a
common base. It can be a bit annoying when the two authors have slightly
different interpretations on how to improve it...

> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index dfbaafbe3a00..f84ef9399aee 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -526,7 +526,7 @@ typedef void (*on_unlock_fn_t)(struct kvm *kvm);
>  struct kvm_hva_range {
>  	unsigned long start;
>  	unsigned long end;
> -	pte_t pte;
> +	union kvm_mmu_notifier_arg arg;
>  	hva_handler_t handler;
>  	on_lock_fn_t on_lock;
>  	on_unlock_fn_t on_unlock;
> @@ -547,6 +547,8 @@ static void kvm_null_fn(void)
>  }
>  #define IS_KVM_NULL_FN(fn) ((fn) == (void *)kvm_null_fn)
>  
> +static const union kvm_mmu_notifier_arg KVM_NO_ARG;
> +

I'm guessing you were trying to keep this short, but it might be nice to
use MMU_NOTIFIER_ (or similar) as the prefix to make the scope
immediately obvious.

-- 
Thanks,
Oliver

