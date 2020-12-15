From: Jiangyifei <jiangyifei@huawei.com>
Date: Tue, 15 Dec 2020 07:33:11 +0000
Subject: [PATCH RFC v4 07/15] hw/riscv: PLIC update external interrupt by
 KVM when kvm enabled
In-Reply-To: <CAKmqyKMXmCPyMmo_OHdeVZCjN1k_Lv9n_FVFe9pvbnoHhVSL1g@mail.gmail.com>
References: <20201203124703.168-1-jiangyifei@huawei.com>
 <20201203124703.168-8-jiangyifei@huawei.com>
 <CAKmqyKMXmCPyMmo_OHdeVZCjN1k_Lv9n_FVFe9pvbnoHhVSL1g@mail.gmail.com>
Message-ID: <9845536243684e55b20fb9336229babe@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Alistair Francis [mailto:alistair23 at gmail.com]
> Sent: Wednesday, December 9, 2020 6:30 AM
> To: Jiangyifei <jiangyifei@huawei.com>
> Cc: qemu-devel at nongnu.org Developers <qemu-devel@nongnu.org>; open
> list:RISC-V <qemu-riscv@nongnu.org>; Zhangxiaofeng (F)
> <victor.zhangxiaofeng@huawei.com>; Sagar Karandikar
> <sagark@eecs.berkeley.edu>; open list:Overall <kvm@vger.kernel.org>;
> libvir-list at redhat.com; Bastian Koppelmann
> <kbastian@mail.uni-paderborn.de>; Anup Patel <anup.patel@wdc.com>;
> yinyipeng <yinyipeng1@huawei.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; kvm-riscv at lists.infradead.org; Palmer Dabbelt
> <palmer@dabbelt.com>; dengkai (A) <dengkai1@huawei.com>; Wubin (H)
> <wu.wubin@huawei.com>; Zhanghailiang <zhang.zhanghailiang@huawei.com>
> Subject: Re: [PATCH RFC v4 07/15] hw/riscv: PLIC update external interrupt by
> KVM when kvm enabled
> 
> On Thu, Dec 3, 2020 at 4:47 AM Yifei Jiang <jiangyifei@huawei.com> wrote:
> >
> > Only support supervisor external interrupt currently.
> >
> > Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> > Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> > ---
> >  hw/intc/sifive_plic.c    | 31 ++++++++++++++++++++++---------
> >  target/riscv/kvm.c       | 19 +++++++++++++++++++
> >  target/riscv/kvm_riscv.h |  1 +
> >  3 files changed, 42 insertions(+), 9 deletions(-)
> >
> > diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c index
> > 97a1a27a9a..a419ca3a3c 100644
> > --- a/hw/intc/sifive_plic.c
> > +++ b/hw/intc/sifive_plic.c
> > @@ -31,6 +31,8 @@
> >  #include "target/riscv/cpu.h"
> >  #include "sysemu/sysemu.h"
> >  #include "migration/vmstate.h"
> > +#include "sysemu/kvm.h"
> > +#include "kvm_riscv.h"
> >
> >  #define RISCV_DEBUG_PLIC 0
> >
> > @@ -147,15 +149,26 @@ static void sifive_plic_update(SiFivePLICState *plic)
> >              continue;
> >          }
> >          int level = sifive_plic_irqs_pending(plic, addrid);
> > -        switch (mode) {
> > -        case PLICMode_M:
> > -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP,
> BOOL_TO_MASK(level));
> > -            break;
> > -        case PLICMode_S:
> > -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP,
> BOOL_TO_MASK(level));
> > -            break;
> > -        default:
> > -            break;
> > +        if (kvm_enabled()) {
> > +            if (mode == PLICMode_M) {
> > +                continue;
> > +            }
> > +#ifdef CONFIG_KVM
> > +            kvm_riscv_set_irq(RISCV_CPU(cpu), IRQ_S_EXT, level);
> > +#endif
> 
> What if kvm_enalbed() is true, but CONFIG_KVM isn't defined?
> 
> Alistair
> 

Impossible. It will cause compilation failure without CONFIG_KVM. We also
introduce kvm-stub.c to solve the compilation failure like other architectures.

We will introduce kvm-stub.c in next series.

Yifei

> > +        } else {
> > +            switch (mode) {
> > +            case PLICMode_M:
> > +                riscv_cpu_update_mip(RISCV_CPU(cpu),
> > +                                     MIP_MEIP,
> BOOL_TO_MASK(level));
> > +                break;
> > +            case PLICMode_S:
> > +                riscv_cpu_update_mip(RISCV_CPU(cpu),
> > +                                     MIP_SEIP,
> BOOL_TO_MASK(level));
> > +                break;
> > +            default:
> > +                break;
> > +            }
> >          }
> >      }
> >
> > diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c index
> > 6250ca0c7d..b01ff0754c 100644
> > --- a/target/riscv/kvm.c
> > +++ b/target/riscv/kvm.c
> > @@ -454,3 +454,22 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
> >      env->satp = 0;
> >  }
> >
> > +void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level) {
> > +    int ret;
> > +    unsigned virq = level ? KVM_INTERRUPT_SET :
> KVM_INTERRUPT_UNSET;
> > +
> > +    if (irq != IRQ_S_EXT) {
> > +        return;
> > +    }
> > +
> > +    if (!kvm_enabled()) {
> > +        return;
> > +    }
> > +
> > +    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_INTERRUPT, &virq);
> > +    if (ret < 0) {
> > +        perror("Set irq failed");
> > +        abort();
> > +    }
> > +}
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
> >
