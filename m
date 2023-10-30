From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Oct 2023 18:21:33 +0100
Subject: [PATCH v13 12/35] KVM: Prepare for handling only shared mappings
 in mmu_notifier events
In-Reply-To: <20231027182217.3615211-13-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-13-seanjc@google.com>
Message-ID: <077cec97-7920-4d20-8bd3-fe07ab8bcc29@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/27/23 20:21, Sean Christopherson wrote:
> @@ -635,6 +635,13 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
>  			 * the second or later invocation of the handler).
>  			 */
>  			gfn_range.arg = range->arg;
> +
> +			/*
> +			 * HVA-based notifications aren't relevant to private
> +			 * mappings as they don't have a userspace mapping.

It's confusing who "they" is.  Maybe

	 * HVA-based notifications provide a userspace address,
	 * and as such are only relevant for shared mappings.

Paolo

> +			 */
> +			gfn_range.only_private = false;
> +			gfn_range.only_shared = true;
>  			gfn_range.may_block = range->may_block;
>  
>  			/*



