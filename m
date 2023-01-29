From: Anup Patel <anup@brainfault.org>
Date: Sun, 29 Jan 2023 18:05:55 +0530
Subject: [PATCH v3 09/14] RISC-V: KVM: Make PMU functionality depend on Sscofpmf
In-Reply-To: <20230127182558.2416400-10-atishp@rivosinc.com>
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-10-atishp@rivosinc.com>
Message-ID: <CAAhSdy086ftqg_WXoAJJuXF0WFRpdiM5ipkOG1=XodDa7cZAPg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 27, 2023 at 11:56 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> The privilege mode filtering feature must be available in the host so
> that the host can inhibit the counters while the execution is in HS mode.
> Otherwise, the guests may have access to critical guest information.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu_pmu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index d3fd551..7713927 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -79,6 +79,14 @@ int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>         struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
>         struct kvm_pmc *pmc;
>
> +       /*
> +        * PMU functionality should be only available to guests if privilege mode
> +        * filtering is available in the host. Otherwise, guest will always count
> +        * events while the execution is in hypervisor mode.
> +        */
> +       if (!riscv_isa_extension_available(NULL, SSCOFPMF))
> +               return 0;
> +
>         ret = riscv_pmu_get_hpm_info(&hpm_width, &num_hw_ctrs);
>         if (ret < 0)
>                 return ret;
> --
> 2.25.1
>

