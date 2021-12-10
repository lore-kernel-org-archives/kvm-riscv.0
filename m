From: Jiangyifei <jiangyifei@huawei.com>
Date: Fri, 10 Dec 2021 09:58:52 +0000
Subject: [PATCH v1 05/12] target/riscv: Implement kvm_arch_put_registers
In-Reply-To: <CAAhSdy0umeb2Qu=6hJZGy4g1FhW-bsYL=80Msao_pULsJ0+2mw@mail.gmail.com>
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-6-jiangyifei@huawei.com>
 <CAAhSdy0umeb2Qu=6hJZGy4g1FhW-bsYL=80Msao_pULsJ0+2mw@mail.gmail.com>
Message-ID: <240d9fa6bf214abf8169816e6901fd90@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Anup Patel [mailto:anup at brainfault.org]
> Sent: Friday, December 3, 2021 2:22 PM
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
> Subject: Re: [PATCH v1 05/12] target/riscv: Implement kvm_arch_put_registers
> 
> On Sat, Nov 20, 2021 at 1:17 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
> >
> > Put GPR CSR and FP registers to kvm by KVM_SET_ONE_REG ioctl
> >
> > Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> > Signed-off-by: Mingwang Li <limingwang@huawei.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/kvm.c | 141
> > ++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 140 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c index
> > b49c24be0a..5fe5ca4434 100644
> > --- a/target/riscv/kvm.c
> > +++ b/target/riscv/kvm.c
> > @@ -90,6 +90,31 @@ static int kvm_riscv_get_regs_core(CPUState *cs)
> >      return ret;
> >  }
> >
> > +static int kvm_riscv_put_regs_core(CPUState *cs) {
> > +    int ret = 0;
> > +    int i;
> > +    target_ulong reg;
> > +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> > +
> > +    reg = env->pc;
> > +    ret = kvm_set_one_reg(cs, RISCV_CORE_REG(env, regs.pc), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    for (i = 1; i < 32; i++) {
> > +        uint64_t id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, i);
> > +        reg = env->gpr[i];
> > +        ret = kvm_set_one_reg(cs, id, &reg);
> > +        if (ret) {
> > +            return ret;
> > +        }
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> >  static int kvm_riscv_get_regs_csr(CPUState *cs)  {
> >      int ret = 0;
> > @@ -153,6 +178,69 @@ static int kvm_riscv_get_regs_csr(CPUState *cs)
> >      return ret;
> >  }
> >
> > +static int kvm_riscv_put_regs_csr(CPUState *cs) {
> > +    int ret = 0;
> > +    target_ulong reg;
> > +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> > +
> > +    reg = env->mstatus;
> > +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, sstatus), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    reg = env->mie;
> > +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, sie), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    reg = env->stvec;
> > +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, stvec), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    reg = env->sscratch;
> > +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, sscratch), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    reg = env->sepc;
> > +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, sepc), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    reg = env->scause;
> > +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, scause), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    reg = env->stval;
> > +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, stval), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    reg = env->mip;
> > +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, sip), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    reg = env->satp;
> > +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, satp), &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> 
> Same as the previous patch, there is a common pattern in above
> kvm_set_one_reg() calls. Please use a macro to simplify.
> 
> Regards,
> Anup
> 

Thanks, it will be modified in the next series.

Yifei

> > +
> > +    return ret;
> > +}
> > +
> >  static int kvm_riscv_get_regs_fp(CPUState *cs)  {
> >      int ret = 0;
> > @@ -186,6 +274,40 @@ static int kvm_riscv_get_regs_fp(CPUState *cs)
> >      return ret;
> >  }
> >
> > +static int kvm_riscv_put_regs_fp(CPUState *cs) {
> > +    int ret = 0;
> > +    int i;
> > +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> > +
> > +    if (riscv_has_ext(env, RVD)) {
> > +        uint64_t reg;
> > +        for (i = 0; i < 32; i++) {
> > +            reg = env->fpr[i];
> > +            ret = kvm_set_one_reg(cs, RISCV_FP_D_REG(env, i), &reg);
> > +            if (ret) {
> > +                return ret;
> > +            }
> > +        }
> > +        return ret;
> > +    }
> > +
> > +    if (riscv_has_ext(env, RVF)) {
> > +        uint32_t reg;
> > +        for (i = 0; i < 32; i++) {
> > +            reg = env->fpr[i];
> > +            ret = kvm_set_one_reg(cs, RISCV_FP_F_REG(env, i), &reg);
> > +            if (ret) {
> > +                return ret;
> > +            }
> > +        }
> > +        return ret;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +
> >  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
> >      KVM_CAP_LAST_INFO
> >  };
> > @@ -214,7 +336,24 @@ int kvm_arch_get_registers(CPUState *cs)
> >
> >  int kvm_arch_put_registers(CPUState *cs, int level)  {
> > -    return 0;
> > +    int ret = 0;
> > +
> > +    ret = kvm_riscv_put_regs_core(cs);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    ret = kvm_riscv_put_regs_csr(cs);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    ret = kvm_riscv_put_regs_fp(cs);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    return ret;
> >  }
> >
> >  int kvm_arch_release_virq_post(int virq)
> > --
> > 2.19.1
> >
> >
> > --
> > kvm-riscv mailing list
> > kvm-riscv at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv
