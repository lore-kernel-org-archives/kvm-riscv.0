From: Jiangyifei <jiangyifei@huawei.com>
Date: Fri, 10 Dec 2021 10:03:08 +0000
Subject: [PATCH v1 10/12] target/riscv: Add kvm_riscv_get/put_regs_timer
In-Reply-To: <CAAhSdy075GcmcMTsVsvgXN+W9Cf7EKCrycnOG9BZAkfKfp3J-w@mail.gmail.com>
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-11-jiangyifei@huawei.com>
 <CAAhSdy075GcmcMTsVsvgXN+W9Cf7EKCrycnOG9BZAkfKfp3J-w@mail.gmail.com>
Message-ID: <f68f51d29e5748fa9fe31370640e047c@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Anup Patel [mailto:anup at brainfault.org]
> Sent: Friday, December 3, 2021 5:38 PM
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
> Subject: Re: [PATCH v1 10/12] target/riscv: Add kvm_riscv_get/put_regs_timer
> 
> On Sat, Nov 20, 2021 at 1:17 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
> >
> > Add kvm_riscv_get/put_regs_timer to synchronize virtual time context
> > from KVM.
> >
> > To set register of RISCV_TIMER_REG(state) will occur a error from KVM
> > on kvm_timer_state == 0. It's better to adapt in KVM, but it doesn't
> > matter that adaping in QEMU.
> >
> > Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> > Signed-off-by: Mingwang Li <limingwang@huawei.com>
> > ---
> >  target/riscv/cpu.h |  6 ++++
> >  target/riscv/kvm.c | 72
> > ++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 78 insertions(+)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h index
> > e7dba35acb..dea49e53f0 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -259,6 +259,12 @@ struct CPURISCVState {
> >
> >      hwaddr kernel_addr;
> >      hwaddr fdt_addr;
> > +
> > +    /* kvm timer */
> > +    bool kvm_timer_dirty;
> > +    uint64_t kvm_timer_time;
> > +    uint64_t kvm_timer_compare;
> > +    uint64_t kvm_timer_state;
> 
> We should also include kvm_timer_frequency here.
> 
> Currently, it is read-only but in-future KVM RISC-V will allow setting
> timer_frequency using SBI para-virt time scaling extension.
> 
> Regards,
> Anup
> 

Ok, added.

> >  };
> >
> >  OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass, diff --git
> > a/target/riscv/kvm.c b/target/riscv/kvm.c index 6d419ba02e..e5725770f2
> > 100644
> > --- a/target/riscv/kvm.c
> > +++ b/target/riscv/kvm.c
> > @@ -64,6 +64,9 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env,
> > uint64_t type, uint64_t idx  #define RISCV_CSR_REG(env, name)
> kvm_riscv_reg_id(env, KVM_REG_RISCV_CSR, \
> >                   KVM_REG_RISCV_CSR_REG(name))
> >
> > +#define RISCV_TIMER_REG(env, name)  kvm_riscv_reg_id(env,
> KVM_REG_RISCV_TIMER, \
> > +                 KVM_REG_RISCV_TIMER_REG(name))
> > +
> >  #define RISCV_FP_F_REG(env, idx)  kvm_riscv_reg_id(env,
> > KVM_REG_RISCV_FP_F, idx)
> >
> >  #define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env,
> > KVM_REG_RISCV_FP_D, idx) @@ -310,6 +313,75 @@ static int
> kvm_riscv_put_regs_fp(CPUState *cs)
> >      return ret;
> >  }
> >
> > +static void kvm_riscv_get_regs_timer(CPUState *cs) {
> > +    int ret;
> > +    uint64_t reg;
> > +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> > +
> > +    if (env->kvm_timer_dirty) {
> > +        return;
> > +    }
> > +
> > +    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, time), &reg);
> > +    if (ret) {
> > +        abort();
> > +    }
> > +    env->kvm_timer_time = reg;
> > +
> > +    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, compare), &reg);
> > +    if (ret) {
> > +        abort();
> > +    }
> > +    env->kvm_timer_compare = reg;
> > +
> > +    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, state), &reg);
> > +    if (ret) {
> > +        abort();
> > +    }
> > +    env->kvm_timer_state = reg;
> > +
> > +    env->kvm_timer_dirty = true;
> > +}
> > +
> > +static void kvm_riscv_put_regs_timer(CPUState *cs) {
> > +    int ret;
> > +    uint64_t reg;
> > +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> > +
> > +    if (!env->kvm_timer_dirty) {
> > +        return;
> > +    }
> > +
> > +    reg = env->kvm_timer_time;
> > +    ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, time), &reg);
> > +    if (ret) {
> > +        abort();
> > +    }
> > +
> > +    reg = env->kvm_timer_compare;
> > +    ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, compare), &reg);
> > +    if (ret) {
> > +        abort();
> > +    }
> > +
> > +    /*
> > +     * To set register of RISCV_TIMER_REG(state) will occur a error from
> KVM
> > +     * on env->kvm_timer_state == 0, It's better to adapt in KVM, but it
> > +     * doesn't matter that adaping in QEMU now.
> > +     * TODO If KVM changes, adapt here.
> > +     */
> > +    if (env->kvm_timer_state) {
> > +        reg = env->kvm_timer_state;
> > +        ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, state), &reg);
> > +        if (ret) {
> > +            abort();
> > +        }
> > +    }
> > +
> > +    env->kvm_timer_dirty = false;
> > +}
> >
> >  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
> >      KVM_CAP_LAST_INFO
> > --
> > 2.19.1
> >
> >
> > --
> > kvm-riscv mailing list
> > kvm-riscv at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv
