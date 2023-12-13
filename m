From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Wed, 13 Dec 2023 11:48:15 +0800
Subject: [PATCH 1/1] RISCV: KVM: should not be interrupted when update the
 external interrupt pending
In-Reply-To: <CAK9=C2VOXj5oCAZEPS24K98UmQycupoJCcATGDNr+HFr9aVCPw@mail.gmail.com>
References: <20231212053501.12054-1-yongxuan.wang@sifive.com> <CAK9=C2VOXj5oCAZEPS24K98UmQycupoJCcATGDNr+HFr9aVCPw@mail.gmail.com>
Message-ID: <CAMWQL2gWGYYD1mFHOnd6oQGvAmh6UHb9w++KMOTLbB9p=om-2Q@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 13, 2023 at 12:03?AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Tue, Dec 12, 2023 at 11:05?AM Yong-Xuan Wang
> <yongxuan.wang@sifive.com> wrote:
> >
> > The emulated IMSIC update the external interrupt pending depending on the
> > value of eidelivery and topei. It might lose an interrupt when it is
> > interrupted before setting the new value to the pending status.
>
> More simpler PATCH subject can be:
> "RISCV: KVM: update external interrupt atomically for IMSIC swfile"
>
> >
> > For example, when VCPU0 sends an IPI to VCPU1 via IMSIC:
> >
> > VCPU0                           VCPU1
> >
> >                                 CSRSWAP topei = 0
> >                                 The VCPU1 has claimed all the external
> >                                 interrupt in its interrupt handler.
> >
> >                                 topei of VCPU1's IMSIC = 0
> >
> > set pending in VCPU1's IMSIC
> >
> > topei of VCPU1' IMSIC = 1
> >
> > set the external interrupt
> > pending of VCPU1
> >
> >                                 clear the external interrupt pending
> >                                 of VCPU1
> >
> > When the VCPU1 switches back to VS mode, it exits the interrupt handler
> > because the result of CSRSWAP topei is 0. If there are no other external
> > interrupts injected into the VCPU1's IMSIC, VCPU1 will never know this
> > pending interrupt unless it initiative read the topei.
> >
> > If the interruption occurs between updating interrupt pending in IMSIC
> > and updating external interrupt pending of VCPU, it will not cause a
> > problem. Suppose that the VCPU1 clears the IPI pending in IMSIC right
> > after VCPU0 sets the pending, the external interrupt pending of VCPU1
> > will not be set because the topei is 0. But when the VCPU1 goes back to
> > VS mode, the pending IPI will be reported by the CSRSWAP topei, it will
> > not lose this interrupt.
> >
> > So we only need to make the external interrupt updating procedure as a
> > critical section to avoid the problem.
> >
>
> Please add a "Fixes:" line here
>
> > Tested-by: Roy Lin <roy.lin@sifive.com>
> > Tested-by: Wayling Chen <wayling.chen@sifive.com>
> > Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > ---
> >  arch/riscv/kvm/aia_imsic.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
> > index 6cf23b8adb71..0278aa0ca16a 100644
> > --- a/arch/riscv/kvm/aia_imsic.c
> > +++ b/arch/riscv/kvm/aia_imsic.c
> > @@ -37,6 +37,8 @@ struct imsic {
> >         u32 nr_eix;
> >         u32 nr_hw_eix;
> >
> > +       spinlock_t extirq_update_lock;
> > +
>
> Please rename this lock to "swfile_extirq_lock".
>
> >         /*
> >          * At any point in time, the register state is in
> >          * one of the following places:
> > @@ -613,12 +615,17 @@ static void imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
> >  {
> >         struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
> >         struct imsic_mrif *mrif = imsic->swfile;
> > +       unsigned long flags;
> > +
>
> Add a short summary in a comment block about why external interrupt
> updates are required to be in the critical section.
>
> > +       spin_lock_irqsave(&imsic->extirq_update_lock, flags);
> >
> >         if (imsic_mrif_atomic_read(mrif, &mrif->eidelivery) &&
> >             imsic_mrif_topei(mrif, imsic->nr_eix, imsic->nr_msis))
> >                 kvm_riscv_vcpu_set_interrupt(vcpu, IRQ_VS_EXT);
> >         else
> >                 kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_EXT);
> > +
> > +       spin_unlock_irqrestore(&imsic->extirq_update_lock, flags);
> >  }
> >
> >  static void imsic_swfile_read(struct kvm_vcpu *vcpu, bool clear,
> > @@ -1029,6 +1036,7 @@ int kvm_riscv_vcpu_aia_imsic_init(struct kvm_vcpu *vcpu)
> >         imsic->nr_eix = BITS_TO_U64(imsic->nr_msis);
> >         imsic->nr_hw_eix = BITS_TO_U64(kvm_riscv_aia_max_ids);
> >         imsic->vsfile_hgei = imsic->vsfile_cpu = -1;
> > +       spin_lock_init(&imsic->extirq_update_lock);
> >
> >         /* Setup IMSIC SW-file */
> >         swfile_page = alloc_pages(GFP_KERNEL | __GFP_ZERO,
> > --
> > 2.17.1
> >
> >
>
> Regards,
> Anup

Hi Anup,

Thank you! I will update in next version.

Regards,
Yong-Xuan

