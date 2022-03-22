From: Reiji Watanabe <reijiw@google.com>
Date: Mon, 21 Mar 2022 23:21:15 -0700
Subject: [PATCH v4 08/15] KVM: arm64: Return a value from
 check_vcpu_requests()
In-Reply-To: <20220311174001.605719-9-oupton@google.com>
References: <20220311174001.605719-1-oupton@google.com>
 <20220311174001.605719-9-oupton@google.com>
Message-ID: <CAAeT=FwmU1Ej8zc4wB15TRRH6dH9xK7621gO12ib2QjHW11=NA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Oliver,

On Fri, Mar 11, 2022 at 9:41 AM Oliver Upton <oupton@google.com> wrote:
>
> A subsequent change to KVM will introduce a vCPU request that could
> result in an exit to userspace. Change check_vcpu_requests() to return a
> value and document the function. Unconditionally return 1 for now.
>
> Signed-off-by: Oliver Upton <oupton@google.com>
> ---
>  arch/arm64/kvm/arm.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 7c297ddc8177..8eed0556ccaa 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -648,7 +648,16 @@ void kvm_vcpu_wfi(struct kvm_vcpu *vcpu)
>         preempt_enable();
>  }
>
> -static void check_vcpu_requests(struct kvm_vcpu *vcpu)
> +/**
> + * check_vcpu_requests - check and handle pending vCPU requests
> + * @vcpu:      the VCPU pointer
> + *
> + * Return: 1 if we should enter the guest
> + *        0 if we should exit to userspace
> + *        <= 0 if we should exit to userspace, where the return value indicates
> + *        an error

Nit: Shouldn't "<= 0" be "< 0" ?

Thanks,
Reiji


> + */
> +static int check_vcpu_requests(struct kvm_vcpu *vcpu)
>  {
>         if (kvm_request_pending(vcpu)) {
>                 if (kvm_check_request(KVM_REQ_SLEEP, vcpu))
> @@ -678,6 +687,8 @@ static void check_vcpu_requests(struct kvm_vcpu *vcpu)
>                         kvm_pmu_handle_pmcr(vcpu,
>                                             __vcpu_sys_reg(vcpu, PMCR_EL0));
>         }
> +
> +       return 1;
>  }
>
>  static bool vcpu_mode_is_bad_32bit(struct kvm_vcpu *vcpu)
> @@ -793,7 +804,8 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>                 if (!ret)
>                         ret = 1;
>
> -               check_vcpu_requests(vcpu);
> +               if (ret > 0)
> +                       ret = check_vcpu_requests(vcpu);
>
>                 /*
>                  * Preparing the interrupts to be injected also
> --
> 2.35.1.723.g4982287a31-goog
>

