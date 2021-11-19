From: Anup Patel <anup@brainfault.org>
Date: Fri, 19 Nov 2021 17:50:58 +0530
Subject: [PATCH] RISC-V: KVM: Fix incorrect KVM_MAX_VCPUS value
In-Reply-To: <CAOnJCU+KZn2JnZg-FZcJ7PXRpGo5SyOmdUYFeJgBenPO9xxE1w@mail.gmail.com>
References: <20211117060241.611391-1-anup.patel@wdc.com>
 <CAOnJCU+KZn2JnZg-FZcJ7PXRpGo5SyOmdUYFeJgBenPO9xxE1w@mail.gmail.com>
Message-ID: <CAAhSdy0jaPPBNkXkt5-jj+LWCm+XiC0G2udK2C7n1f2TqBPCmg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 18, 2021 at 1:23 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Tue, Nov 16, 2021 at 10:03 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The KVM_MAX_VCPUS value is supposed to be aligned with number of
> > VMID bits in the hgatp CSR but the current KVM_MAX_VCPUS value
> > is aligned with number of ASID bits in the satp CSR.
> >
> > Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  arch/riscv/include/asm/kvm_host.h | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > index 25ba21f98504..2639b9ee48f9 100644
> > --- a/arch/riscv/include/asm/kvm_host.h
> > +++ b/arch/riscv/include/asm/kvm_host.h
> > @@ -12,14 +12,12 @@
> >  #include <linux/types.h>
> >  #include <linux/kvm.h>
> >  #include <linux/kvm_types.h>
> > +#include <asm/csr.h>
> >  #include <asm/kvm_vcpu_fp.h>
> >  #include <asm/kvm_vcpu_timer.h>
> >
> > -#ifdef CONFIG_64BIT
> > -#define KVM_MAX_VCPUS                  (1U << 16)
> > -#else
> > -#define KVM_MAX_VCPUS                  (1U << 9)
> > -#endif
> > +#define KVM_MAX_VCPUS                  \
> > +       ((HGATP_VMID_MASK >> HGATP_VMID_SHIFT) + 1)
> >
> >  #define KVM_HALT_POLL_NS_DEFAULT       500000
> >
> > --
> > 2.25.1
> >
>
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

I have queued this patch for fixes.

Thanks,
Anup

>
> --
> Regards,
> Atish

