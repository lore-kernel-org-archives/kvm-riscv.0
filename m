From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 May 2022 11:02:21 +0530
Subject: [PATCH v2 3/7] RISC-V: KVM: Treat SBI HFENCE calls as NOPs
In-Reply-To: <CAOnJCU+sDbJERnrcTUiLowvpfRDJ=-YPkc2dxzbfsD+qFBMUKw@mail.gmail.com>
References: <20220420112450.155624-1-apatel@ventanamicro.com>
 <20220420112450.155624-4-apatel@ventanamicro.com>
 <CAOnJCU+sDbJERnrcTUiLowvpfRDJ=-YPkc2dxzbfsD+qFBMUKw@mail.gmail.com>
Message-ID: <CAAhSdy281_AgjQyUXLfF8ZP2SXpyKGVd68XwVEGuQVFoz16_3g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 4, 2022 at 7:44 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Apr 20, 2022 at 4:25 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > We should treat SBI HFENCE calls as NOPs until nested virtualization
> > is supported by KVM RISC-V. This will help us test booting a hypervisor
> > under KVM RISC-V.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/kvm/vcpu_sbi_replace.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
> > index 0f217365c287..3c1dcd38358e 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_replace.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_replace.c
> > @@ -117,7 +117,11 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
> >         case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
> >         case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
> >         case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
> > -       /* TODO: implement for nested hypervisor case */
> > +               /*
> > +                * Until nested virtualization is implemented, the
> > +                * SBI HFENCE calls should be treated as NOPs
> > +                */
> > +               break;
> >         default:
> >                 ret = -EOPNOTSUPP;
> >         }
> > --
> > 2.25.1
> >
>
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Queued this patch for 5.19

Thanks,
Anup

> --
> Regards,
> Atish

