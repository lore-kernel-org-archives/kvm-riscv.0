From: Jiangyifei <jiangyifei@huawei.com>
Date: Mon, 20 Dec 2021 13:01:06 +0000
Subject: [PATCH v2 07/12] target/riscv: Support setting external interrupt
 by KVM
In-Reply-To: <CAAhSdy0q3iuURMcW9+wV4oyB1O=Mj19UaT9P31fLHAYZ_wU3pg@mail.gmail.com>
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-8-jiangyifei@huawei.com>
 <CAAhSdy0q3iuURMcW9+wV4oyB1O=Mj19UaT9P31fLHAYZ_wU3pg@mail.gmail.com>
Message-ID: <96124a6ed69f4cf8b905826218359bc3@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Anup Patel [mailto:anup at brainfault.org]
> Sent: Monday, December 13, 2021 12:33 PM
> To: Jiangyifei <jiangyifei@huawei.com>
> Cc: QEMU Developers <qemu-devel@nongnu.org>; open list:RISC-V
> <qemu-riscv@nongnu.org>; kvm-riscv at lists.infradead.org; KVM General
> <kvm@vger.kernel.org>; libvir-list at redhat.com; Anup Patel
> <anup.patel@wdc.com>; Palmer Dabbelt <palmer@dabbelt.com>; Alistair
> Francis <Alistair.Francis@wdc.com>; Bin Meng <bin.meng@windriver.com>;
> Fanliang (EulerOS) <fanliang@huawei.com>; Wubin (H)
> <wu.wubin@huawei.com>; Wanghaibin (D) <wanghaibin.wang@huawei.com>;
> wanbo (G) <wanbo13@huawei.com>; limingwang (A)
> <limingwang@huawei.com>
> Subject: Re: [PATCH v2 07/12] target/riscv: Support setting external interrupt
> by KVM
> 
> On Fri, Dec 10, 2021 at 3:37 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
> >
> > When KVM is enabled, set the S-mode external interrupt through
> > kvm_riscv_set_irq function.
> >
> > Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> > Signed-off-by: Mingwang Li <limingwang@huawei.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/cpu.c       |  6 +++++-
> >  target/riscv/kvm-stub.c  |  5 +++++
> >  target/riscv/kvm.c       | 17 +++++++++++++++++
> >  target/riscv/kvm_riscv.h |  1 +
> >  4 files changed, 28 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c index
> > 1c944872a3..71a7ac6831 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -603,7 +603,11 @@ static void riscv_cpu_set_irq(void *opaque, int irq,
> int level)
> >      case IRQ_S_EXT:
> >      case IRQ_VS_EXT:
> >      case IRQ_M_EXT:
> > -        riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
> > +        if (kvm_enabled() && (irq & IRQ_M_EXT) ) {
> > +            kvm_riscv_set_irq(cpu, IRQ_S_EXT, level);
> > +        } else {
> > +            riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
> > +        }
> 
> This does not look right.
> 
> I suggest the following:
> 
> if (kvm_enabled()) {
>     kvm_riscv_set_irq(cpu, irq, level);
> } else {
>    riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level)); }
> 

The M-mode PLIC context is not deleted. Therefore, IRQ_M_EXT needs to
be converted to IRQ_S_EXT. The M-mode PLIC contexts will be removed in
the next series, so it will be modified as suggested.

Yifei

> >          break;
> >      default:
> >          g_assert_not_reached();
> > diff --git a/target/riscv/kvm-stub.c b/target/riscv/kvm-stub.c index
> > 39b96fe3f4..4e8fc31a21 100644
> > --- a/target/riscv/kvm-stub.c
> > +++ b/target/riscv/kvm-stub.c
> > @@ -23,3 +23,8 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)  {
> >      abort();
> >  }
> > +
> > +void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level) {
> > +    abort();
> > +}
> > diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c index
> > db6d8a5b6e..0027f11f45 100644
> > --- a/target/riscv/kvm.c
> > +++ b/target/riscv/kvm.c
> > @@ -383,6 +383,23 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
> >      env->satp = 0;
> >  }
> >
> > +void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level) {
> > +    int ret;
> > +    unsigned virq = level ? KVM_INTERRUPT_SET :
> KVM_INTERRUPT_UNSET;
> > +
> > +    if (irq != IRQ_S_EXT) {
> > +        perror("kvm riscv set irq != IRQ_S_EXT\n");
> > +        abort();
> > +    }
> > +
> > +    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_INTERRUPT, &virq);
> > +    if (ret < 0) {
> > +        perror("Set irq failed");
> > +        abort();
> > +    }
> > +}
> > +
> >  bool kvm_arch_cpu_check_are_resettable(void)
> >  {
> >      return true;
> > diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h index
> > f38c82bf59..ed281bdce0 100644
> > --- a/target/riscv/kvm_riscv.h
> > +++ b/target/riscv/kvm_riscv.h
> > @@ -20,5 +20,6 @@
> >  #define QEMU_KVM_RISCV_H
> >
> >  void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
> > +void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
> >
> >  #endif
> > --
> > 2.19.1
> >
> 
> Regards,
> Anup
