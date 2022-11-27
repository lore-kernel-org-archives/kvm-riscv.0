From: Anup Patel <anup@brainfault.org>
Date: Sun, 27 Nov 2022 17:34:15 +0530
Subject: [PATCH] RISC-V: KVM: use vma_lookup() instead of find_vma_intersection()
In-Reply-To: <20221101053811.5884-1-liubo03@inspur.com>
References: <20221101053811.5884-1-liubo03@inspur.com>
Message-ID: <CAAhSdy0t1XGTENidgNQkQ5m5emZOes+-2RXTPLEJ0tEZXuX2hA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 1, 2022 at 11:08 AM Bo Liu <liubo03@inspur.com> wrote:
>
> vma_lookup() finds the vma of a specific address with a cleaner interface
> and is more readable.
>
> Signed-off-by: Bo Liu <liubo03@inspur.com>

Looks good to me.

Queued this patch for Linux-6.2

Thanks,
Anup

> ---
>  arch/riscv/kvm/mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 3620ecac2fa1..5942d10c9736 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -632,7 +632,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>
>         mmap_read_lock(current->mm);
>
> -       vma = find_vma_intersection(current->mm, hva, hva + 1);
> +       vma = vma_lookup(current->mm, hva);
>         if (unlikely(!vma)) {
>                 kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
>                 mmap_read_unlock(current->mm);
> --
> 2.27.0
>

