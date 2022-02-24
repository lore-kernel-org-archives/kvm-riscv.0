From: Marc Zyngier <maz@kernel.org>
Date: Thu, 24 Feb 2022 14:07:02 +0000
Subject: [PATCH v3 10/19] KVM: Create helper for setting a system event
 exit
In-Reply-To: <20220223041844.3984439-11-oupton@google.com>
References: <20220223041844.3984439-1-oupton@google.com>
 <20220223041844.3984439-11-oupton@google.com>
Message-ID: <87v8x42wah.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 23 Feb 2022 04:18:35 +0000,
Oliver Upton <oupton@google.com> wrote:

> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index f11039944c08..9085a1b1569a 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2202,6 +2202,13 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
>  }
>  #endif /* CONFIG_KVM_XFER_TO_GUEST_WORK */
>  
> +static inline void kvm_vcpu_set_system_event_exit(struct kvm_vcpu *vcpu, u32 type)
> +{
> +	memset(&vcpu->run->system_event, 0, sizeof(vcpu->run->system_event));
> +	vcpu->run->system_event.type = type;
> +	vcpu->run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
> +}
> +

nit: does this really deserve an inline function? I'd stick that in
kvm_main.c, really. Or is that getting in the way of building KVM as a
module on 'the other architecture'?

	M.

-- 
Without deviation from the norm, progress is not possible.

