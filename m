From: Guo Ren <guoren@kernel.org>
Date: Mon, 5 Dec 2022 08:52:35 +0800
Subject: [PATCH v2 12/13] riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()
In-Reply-To: <20221204174632.3677-13-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org> <20221204174632.3677-13-jszhang@kernel.org>
Message-ID: <CAJF2gTRRjnnQLvCtvmwf0rGJgoc08s3JGq4PSe4sYfrq2bsqDA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reviewed-by: Guo Ren <guoren@kernel.org>

On Mon, Dec 5, 2022 at 1:57 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> From: Andrew Jones <ajones@ventanamicro.com>
>
> Switch has_svinval() from static branch to the new helper
> riscv_has_extension_unlikely().
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kvm/tlb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index 309d79b3e5cd..aa3da18ad873 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -15,8 +15,7 @@
>  #include <asm/hwcap.h>
>  #include <asm/insn-def.h>
>
> -#define has_svinval()  \
> -       static_branch_unlikely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_SVINVAL])
> +#define has_svinval()  riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
>
>  void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
>                                           gpa_t gpa, gpa_t gpsz,
> --
> 2.37.2
>


-- 
Best Regards
 Guo Ren

