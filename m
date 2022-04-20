From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 20 Apr 2022 14:16:45 +0530
Subject: [PATCH 1/2] RISC-V: KVM: Remove 's' & 'u' as valid ISA extension
In-Reply-To: <CAOnJCU+r8KhhQP-LZN+oGGCDkdQt9ZbF+LCTtZWY8r=qwmSOng@mail.gmail.com>
References: <20220420013258.3639264-1-atishp@rivosinc.com>
 <20220420013258.3639264-2-atishp@rivosinc.com>
 <CAOnJCU+r8KhhQP-LZN+oGGCDkdQt9ZbF+LCTtZWY8r=qwmSOng@mail.gmail.com>
Message-ID: <CAK9=C2WHwRLyRHw4AVFpZcYJsDdGwaza_cpQsaMz-4qVamc+VQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 20, 2022 at 1:14 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Tue, Apr 19, 2022 at 6:33 PM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > There are no ISA extension defined as 's' & 'u' in RISC-V specifications.
> > The misa register defines 's' & 'u' bit as Supervisor/User privilege mode
> > enabled. But it should not appear in the ISA extension in the device tree.
> >
> > Remove those from the allowed ISA extension for kvm.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/kvm/vcpu.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index 6785aef4cbd4..2e25a7b83a1b 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -43,9 +43,7 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
> >                                  riscv_isa_extension_mask(d) | \
> >                                  riscv_isa_extension_mask(f) | \
> >                                  riscv_isa_extension_mask(i) | \
> > -                                riscv_isa_extension_mask(m) | \
> > -                                riscv_isa_extension_mask(s) | \
> > -                                riscv_isa_extension_mask(u))
> > +                                riscv_isa_extension_mask(m))
> >
> >  static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
> >  {
> > --
> > 2.25.1
> >
>
> Sorry. Forgot to add the fixes tag.
>
> Fixes: a33c72faf2d7 (RISC-V: KVM: Implement VCPU create, init and
> destroy functions)

I have queued this for fixes.

Thanks,
Anup

>
> --
> Regards,
> Atish
>
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

