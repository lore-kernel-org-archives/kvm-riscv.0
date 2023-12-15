From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 Dec 2023 14:37:32 +0530
Subject: [PATCH v2 06/13] RISC-V: KVM: Add SBI STA info to vcpu_arch
In-Reply-To: <20231214101552.100721-21-ajones@ventanamicro.com>
References: <20231214101552.100721-15-ajones@ventanamicro.com> <20231214101552.100721-21-ajones@ventanamicro.com>
Message-ID: <CAAhSdy2tWPqoq=tZXtfkvsksAf4PPXeR3DOoKMvcfw-2YaDSvQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 14, 2023 at 3:46?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> KVM's implementation of SBI STA needs to track the address of each
> VCPU's steal-time shared memory region as well as the amount of
> stolen time. Add a structure to vcpu_arch to contain this state
> and make sure that the address is always set to INVALID_GPA on
> vcpu reset. And, of course, ensure KVM won't try to update steal-
> time when the shared memory address is invalid.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h | 6 ++++++
>  arch/riscv/kvm/vcpu.c             | 2 ++
>  arch/riscv/kvm/vcpu_sbi_sta.c     | 4 ++++
>  3 files changed, 12 insertions(+)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 230b82c3118d..b10026fb6412 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -263,6 +263,12 @@ struct kvm_vcpu_arch {
>
>         /* 'static' configurations which are set only once */
>         struct kvm_vcpu_config cfg;
> +
> +       /* SBI steal-time accounting */
> +       struct {
> +               gpa_t shmem;
> +               u64 last_steal;
> +       } sta;
>  };
>
>  static inline void kvm_arch_sync_events(struct kvm *kvm) {}
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 6995b8b641e4..fec4f5fd0fa7 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -83,6 +83,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
>         vcpu->arch.hfence_tail = 0;
>         memset(vcpu->arch.hfence_queue, 0, sizeof(vcpu->arch.hfence_queue));
>
> +       vcpu->arch.sta.shmem = INVALID_GPA;
> +

I think we should also set last_steal to zero as well.

Also, let's add kvm_riscv_vcpu_sbi_sta_reset() in vcpu_sbi_sta.c
to reset VCPU STA state.

>         /* Reset the guest CSRs for hotplug usecase */
>         if (loaded)
>                 kvm_arch_vcpu_load(vcpu, smp_processor_id());
> diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
> index e28351c9488b..157c199be0b4 100644
> --- a/arch/riscv/kvm/vcpu_sbi_sta.c
> +++ b/arch/riscv/kvm/vcpu_sbi_sta.c
> @@ -10,6 +10,10 @@
>
>  void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
>  {
> +       gpa_t shmem = vcpu->arch.sta.shmem;
> +
> +       if (shmem == INVALID_GPA)
> +               return;
>  }
>
>  static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
> --
> 2.43.0
>

Apart from the above, it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

