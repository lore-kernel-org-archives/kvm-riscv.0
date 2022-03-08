From: Anup Patel <anup@brainfault.org>
Date: Tue, 8 Mar 2022 11:34:12 +0530
Subject: [PATCH v11 4/8] RISC-V: Add SBI HSM suspend related defines
In-Reply-To: <CAAhSdy3jK26WFhG8Q=Up8hhHPpJCCkA09EKOi+B-Kp0U9Rwg7w@mail.gmail.com>
References: <20220210054947.170134-1-apatel@ventanamicro.com>
 <20220210054947.170134-5-apatel@ventanamicro.com>
 <CAAhSdy3jK26WFhG8Q=Up8hhHPpJCCkA09EKOi+B-Kp0U9Rwg7w@mail.gmail.com>
Message-ID: <CAAhSdy3q+NcuVsdGQ+KoY=CTO-zAfprY0XJkUbOTpD6u5VZCTQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Palmer,

On Wed, Feb 23, 2022 at 12:32 PM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Palmer
>
> On Thu, Feb 10, 2022 at 11:20 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > From: Anup Patel <anup.patel@wdc.com>
> >
> > We add defines related to SBI HSM suspend call and also
> > update HSM states naming as-per latest SBI specification.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Guo Ren <guoren@kernel.org>
>
> This patch is shared with "KVM RISC-V SBI v0.3 support".
> (https://lore.kernel.org/all/20220201082227.361967-2-apatel at ventanamicro.com/T/)
>
> How do you want to handle this ?
>
> One option is that I take this patch through the KVM RISC-V tree
> and you can send this series (minus this patch) for 5.18 after the
> KVM RISC-V changes have been merged.

I have queued this patch for 5.18. Let me know if you want to
handle this patch differently.

Thanks,
Anup

>
> Regards,
> Anup
>
> > ---
> >  arch/riscv/include/asm/sbi.h    | 27 ++++++++++++++++++++++-----
> >  arch/riscv/kernel/cpu_ops_sbi.c |  2 +-
> >  arch/riscv/kvm/vcpu_sbi_hsm.c   |  4 ++--
> >  3 files changed, 25 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > index d1c37479d828..06133b4f8e20 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -71,15 +71,32 @@ enum sbi_ext_hsm_fid {
> >         SBI_EXT_HSM_HART_START = 0,
> >         SBI_EXT_HSM_HART_STOP,
> >         SBI_EXT_HSM_HART_STATUS,
> > +       SBI_EXT_HSM_HART_SUSPEND,
> >  };
> >
> > -enum sbi_hsm_hart_status {
> > -       SBI_HSM_HART_STATUS_STARTED = 0,
> > -       SBI_HSM_HART_STATUS_STOPPED,
> > -       SBI_HSM_HART_STATUS_START_PENDING,
> > -       SBI_HSM_HART_STATUS_STOP_PENDING,
> > +enum sbi_hsm_hart_state {
> > +       SBI_HSM_STATE_STARTED = 0,
> > +       SBI_HSM_STATE_STOPPED,
> > +       SBI_HSM_STATE_START_PENDING,
> > +       SBI_HSM_STATE_STOP_PENDING,
> > +       SBI_HSM_STATE_SUSPENDED,
> > +       SBI_HSM_STATE_SUSPEND_PENDING,
> > +       SBI_HSM_STATE_RESUME_PENDING,
> >  };
> >
> > +#define SBI_HSM_SUSP_BASE_MASK                 0x7fffffff
> > +#define SBI_HSM_SUSP_NON_RET_BIT               0x80000000
> > +#define SBI_HSM_SUSP_PLAT_BASE                 0x10000000
> > +
> > +#define SBI_HSM_SUSPEND_RET_DEFAULT            0x00000000
> > +#define SBI_HSM_SUSPEND_RET_PLATFORM           SBI_HSM_SUSP_PLAT_BASE
> > +#define SBI_HSM_SUSPEND_RET_LAST               SBI_HSM_SUSP_BASE_MASK
> > +#define SBI_HSM_SUSPEND_NON_RET_DEFAULT                SBI_HSM_SUSP_NON_RET_BIT
> > +#define SBI_HSM_SUSPEND_NON_RET_PLATFORM       (SBI_HSM_SUSP_NON_RET_BIT | \
> > +                                                SBI_HSM_SUSP_PLAT_BASE)
> > +#define SBI_HSM_SUSPEND_NON_RET_LAST           (SBI_HSM_SUSP_NON_RET_BIT | \
> > +                                                SBI_HSM_SUSP_BASE_MASK)
> > +
> >  enum sbi_ext_srst_fid {
> >         SBI_EXT_SRST_RESET = 0,
> >  };
> > diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
> > index dae29cbfe550..2e16f6732cdf 100644
> > --- a/arch/riscv/kernel/cpu_ops_sbi.c
> > +++ b/arch/riscv/kernel/cpu_ops_sbi.c
> > @@ -111,7 +111,7 @@ static int sbi_cpu_is_stopped(unsigned int cpuid)
> >
> >         rc = sbi_hsm_hart_get_status(hartid);
> >
> > -       if (rc == SBI_HSM_HART_STATUS_STOPPED)
> > +       if (rc == SBI_HSM_STATE_STOPPED)
> >                 return 0;
> >         return rc;
> >  }
> > diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
> > index 2e383687fa48..1ac4b2e8e4ec 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_hsm.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
> > @@ -60,9 +60,9 @@ static int kvm_sbi_hsm_vcpu_get_status(struct kvm_vcpu *vcpu)
> >         if (!target_vcpu)
> >                 return -EINVAL;
> >         if (!target_vcpu->arch.power_off)
> > -               return SBI_HSM_HART_STATUS_STARTED;
> > +               return SBI_HSM_STATE_STARTED;
> >         else
> > -               return SBI_HSM_HART_STATUS_STOPPED;
> > +               return SBI_HSM_STATE_STOPPED;
> >  }
> >
> >  static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> > --
> > 2.25.1
> >

