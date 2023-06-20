From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 20 Jun 2023 18:05:59 +0800
Subject: [PATCH v3 10/10] KVM: riscv: selftests: Add get-reg-list test
In-Reply-To: <20230609-fba04b424a4d46574e04e587@orel>
References: <cover.1686275310.git.haibo1.xu@intel.com> <8cd4ce50f5f4a639f4508085959aae222d4d4386.1686275310.git.haibo1.xu@intel.com>
 <20230609-fba04b424a4d46574e04e587@orel>
Message-ID: <CAJve8okjRZEt6_6SB9EWm+6c7utpExzenfWo2T1N-J6G9w9czQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 9, 2023 at 9:35?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Fri, Jun 09, 2023 at 10:12:18AM +0800, Haibo Xu wrote:
> > +static struct vcpu_reg_list aia_config = {
> > +     .sublists = {
> > +     BASE_SUBLIST,
> > +     AIA_REGS_SUBLIST,
> > +     {0},
> > +     },
> > +};
> > +
> > +static struct vcpu_reg_list fp_f_d_config = {
> > +     .sublists = {
> > +     BASE_SUBLIST,
> > +     FP_F_REGS_SUBLIST,
> > +     FP_D_REGS_SUBLIST,
> > +     {0},
> > +     },
> > +};
> > +
> > +struct vcpu_reg_list *vcpu_configs[] = {
> > +     &zicbo_config,
> > +     &aia_config,
> > +     &fp_f_d_config,
> > +};
> > +int vcpu_configs_n = ARRAY_SIZE(vcpu_configs);
> > --
> > 2.34.1
> >
>
> I see we have a bit of a problem with the configs for riscv. Since we
> don't disable anything we're not testing, then for any test that is
> missing, for example, the f and d registers, we'll get output like
> "There are 66 new registers. Consider adding them to the blessed reg
> list with the following lines:" and then a dump of all the f and d
> registers. The test doesn't fail, but it's messy and confusing. Ideally
> we'd disable all registers of all sublists not in the config, probably
> by starting by disabling everything and then only reenabling the ones
> in the config.
>
> Anything that can't be disabled is either a KVM bug, i.e. we should
> be able to disable it, because we can't expect every host to have it,
> or it needs to be in the base register sublist (meaning every host
> will always have it).
>

HI Andrew,

I found several multi-letters ISA EXT(AIA/SSTC etc) were not allowed
to be disabled.
Is it a bug? shall we fix it?

Thanks,
Haibo

static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 {
     switch (ext) {
     case KVM_RISCV_ISA_EXT_A:
     case KVM_RISCV_ISA_EXT_C:
     case KVM_RISCV_ISA_EXT_I:
     case KVM_RISCV_ISA_EXT_M:
     case KVM_RISCV_ISA_EXT_SSAIA:
     case KVM_RISCV_ISA_EXT_SSTC:
     case KVM_RISCV_ISA_EXT_SVINVAL:
     case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
     case KVM_RISCV_ISA_EXT_ZBB:
         return false;
     default:
         break;
     }

     return true;
 }

> Thanks,
> drew

