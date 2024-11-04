From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 4 Nov 2024 18:49:15 +0530
Subject: [PATCH RFC v2 3/3] riscv: KVM: Add Svukte extension support for Guest/VM
In-Reply-To: <CAHibDywpKUE7r4UfcudDSBZCM=JAC5s40uf+PwQE+oMvZy4aVA@mail.gmail.com>
References: <20240927-dev-maxh-svukte-rebase-2-v2-0-9afe57c33aee@sifive.com>
 <20240927-dev-maxh-svukte-rebase-2-v2-3-9afe57c33aee@sifive.com>
 <CAAhSdy0ncLTAjEE1s-GWL95sscxwQFsKn1rXyA1_VVfk1bQBiw@mail.gmail.com> <CAHibDywpKUE7r4UfcudDSBZCM=JAC5s40uf+PwQE+oMvZy4aVA@mail.gmail.com>
Message-ID: <CAK9=C2WEU53TD+tnWRLC1iLRf+j607s=bZXevkogTnr-cmhPGw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 4, 2024 at 1:14?PM Max Hsu <max.hsu@sifive.com> wrote:
>
> Hi Anup,
>
> Thank you for the suggestion.
>
> I?m not entirely sure if I fully understand it, but I believe the
> hypervisor should be able to disable the Svukte extension.
>
> Inside the switch-case of kvm_riscv_vcpu_isa_disable_allowed(),
> the default case breaks and returns true.
>
> So that means when the KVM_RISCV_ISA_EXT_SVUKTE passed into
> kvm_riscv_vcpu_isa_disable_allowed() it will return true.
>
> If I've misunderstood, please let me know.

I don't see any code in this patch which disables/enables Svukte for
Guest based on KVM ONE_REG interface.

Regards,
Anup

>
> Best regards,
> Max Hsu
>
> On Fri, Oct 25, 2024 at 3:17?AM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Fri, Sep 27, 2024 at 7:12?PM Max Hsu <max.hsu@sifive.com> wrote:
> > >
> > > Add KVM ISA extension ONE_REG interface to allow VMM tools to
> > > detect and enable Svukte extension for Guest/VM.
> > >
> > > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > > Signed-off-by: Max Hsu <max.hsu@sifive.com>
> > > ---
> > >  arch/riscv/include/uapi/asm/kvm.h | 1 +
> > >  arch/riscv/kvm/vcpu_onereg.c      | 1 +
> > >  2 files changed, 2 insertions(+)
> > >
> > > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> > > index e97db3296456e19f79ca02e4c4f70ae1b4abb48b..41b466b7ffaec421e8389d3f5b178580091a2c98 100644
> > > --- a/arch/riscv/include/uapi/asm/kvm.h
> > > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > > @@ -175,6 +175,7 @@ enum KVM_RISCV_ISA_EXT_ID {
> > >         KVM_RISCV_ISA_EXT_ZCF,
> > >         KVM_RISCV_ISA_EXT_ZCMOP,
> > >         KVM_RISCV_ISA_EXT_ZAWRS,
> > > +       KVM_RISCV_ISA_EXT_SVUKTE,
> > >         KVM_RISCV_ISA_EXT_MAX,
> > >  };
> > >
> > > diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> > > index b319c4c13c54ce22d2a7552f4c9f256a0c50780e..67237d6e53882a9fcd2cf265aa1704f25cc4a701 100644
> > > --- a/arch/riscv/kvm/vcpu_onereg.c
> > > +++ b/arch/riscv/kvm/vcpu_onereg.c
> > > @@ -41,6 +41,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
> > >         KVM_ISA_EXT_ARR(SVINVAL),
> > >         KVM_ISA_EXT_ARR(SVNAPOT),
> > >         KVM_ISA_EXT_ARR(SVPBMT),
> > > +       KVM_ISA_EXT_ARR(SVUKTE),
> > >         KVM_ISA_EXT_ARR(ZACAS),
> > >         KVM_ISA_EXT_ARR(ZAWRS),
> > >         KVM_ISA_EXT_ARR(ZBA),
> >
> > The KVM_RISCV_ISA_EXT_SVUKTE should be added to the
> > switch-case in kvm_riscv_vcpu_isa_disable_allowed() because
> > hypervisor seems to have no way to disable Svukte for the Guest
> > when it's available on the Host.
> >
> > Regards,
> > Anup
>

