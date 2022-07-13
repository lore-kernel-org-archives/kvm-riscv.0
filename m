From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 12 Jul 2022 18:26:41 -0700
Subject: [PATCH 3/5] RISC-V: KVM: Add G-stage ioremap() and iounmap() functions
In-Reply-To: <20220707145248.458771-4-apatel@ventanamicro.com>
References: <20220707145248.458771-1-apatel@ventanamicro.com> <20220707145248.458771-4-apatel@ventanamicro.com>
Message-ID: <CAOnJCU++MsxgPyGqumWMLrB7ihDk3UmzwwD_voW0Rfnf-BVPWQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 7, 2022 at 7:53 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The in-kernel AIA IMSIC support requires on-demand mapping / unmapping
> of Guest IMSIC address to Host IMSIC guest files. To help achieve this,
> we add kvm_riscv_stage2_ioremap() and kvm_riscv_stage2_iounmap()
> functions. These new functions for updating G-stage page table mappings
> will be called in atomic context so we have special "in_atomic" parameter
> for this purpose.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h |  5 +++++
>  arch/riscv/kvm/mmu.c              | 18 ++++++++++++++----
>  2 files changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 59a0cf2ca7b9..60c517e4d576 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -284,6 +284,11 @@ void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
>  void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
>                                unsigned long hbase, unsigned long hmask);
>
> +int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
> +                            phys_addr_t hpa, unsigned long size,
> +                            bool writable, bool in_atomic);
> +void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa,
> +                             unsigned long size);
>  int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>                          struct kvm_memory_slot *memslot,
>                          gpa_t gpa, unsigned long hva, bool is_write);
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index b75d4e200064..f7862ca4c4c6 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -343,8 +343,9 @@ static void gstage_wp_memory_region(struct kvm *kvm, int slot)
>         kvm_flush_remote_tlbs(kvm);
>  }
>
> -static int gstage_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
> -                         unsigned long size, bool writable)
> +int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
> +                            phys_addr_t hpa, unsigned long size,
> +                            bool writable, bool in_atomic)
>  {
>         pte_t pte;
>         int ret = 0;
> @@ -353,6 +354,7 @@ static int gstage_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
>         struct kvm_mmu_memory_cache pcache;
>
>         memset(&pcache, 0, sizeof(pcache));
> +       pcache.gfp_custom = (in_atomic) ? GFP_ATOMIC | __GFP_ACCOUNT : 0;
>         pcache.gfp_zero = __GFP_ZERO;
>
>         end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
> @@ -382,6 +384,13 @@ static int gstage_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
>         return ret;
>  }
>
> +void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa, unsigned long size)
> +{
> +       spin_lock(&kvm->mmu_lock);
> +       gstage_unmap_range(kvm, gpa, size, false);
> +       spin_unlock(&kvm->mmu_lock);
> +}
> +
>  void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
>                                              struct kvm_memory_slot *slot,
>                                              gfn_t gfn_offset,
> @@ -517,8 +526,9 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>                                 goto out;
>                         }
>
> -                       ret = gstage_ioremap(kvm, gpa, pa,
> -                                            vm_end - vm_start, writable);
> +                       ret = kvm_riscv_gstage_ioremap(kvm, gpa, pa,
> +                                                      vm_end - vm_start,
> +                                                      writable, false);
>                         if (ret)
>                                 break;
>                 }
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

