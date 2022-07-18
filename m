From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 Jul 2022 09:37:05 +0530
Subject: [PATCH 4/5] RISC-V: KVM: Use PAGE_KERNEL_IO in kvm_riscv_gstage_ioremap()
In-Reply-To: <CAOnJCUKjFMMsrNWR=hzB+qbw4SECWS3+DOJDun90emnM-Vkpiw@mail.gmail.com>
References: <20220707145248.458771-1-apatel@ventanamicro.com>
 <20220707145248.458771-5-apatel@ventanamicro.com> <CAOnJCUKjFMMsrNWR=hzB+qbw4SECWS3+DOJDun90emnM-Vkpiw@mail.gmail.com>
Message-ID: <CAAhSdy2WZ9Gq9n53u+0FY2SAsXrmgDGdsHjbTJDYRNG+yNw3bw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 13, 2022 at 6:53 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Thu, Jul 7, 2022 at 7:53 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > When the host has Svpbmt extension, we should use page based memory
> > type 2 (i.e. IO) for IO mappings in the G-stage page table.
> >
> > To achieve this, we replace use of PAGE_KERNEL with PAGE_KERNEL_IO
> > in the kvm_riscv_gstage_ioremap().
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/kvm/mmu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> > index f7862ca4c4c6..bc545aef6034 100644
> > --- a/arch/riscv/kvm/mmu.c
> > +++ b/arch/riscv/kvm/mmu.c
> > @@ -361,7 +361,7 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
> >         pfn = __phys_to_pfn(hpa);
> >
> >         for (addr = gpa; addr < end; addr += PAGE_SIZE) {
> > -               pte = pfn_pte(pfn, PAGE_KERNEL);
> > +               pte = pfn_pte(pfn, PAGE_KERNEL_IO);
> >
> >                 if (!writable)
> >                         pte = pte_wrprotect(pte);
> > --
> > 2.34.1
> >
>
> LGTM.
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Queued this patch for 5.20.

Thanks,
Anup

