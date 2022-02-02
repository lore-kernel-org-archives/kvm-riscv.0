From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 2 Feb 2022 18:59:18 +0530
Subject: [PATCH] RISC-V: KVM: make CY, TM, and IR counters accessible in
 VU mode
In-Reply-To: <B04F937F-6FC8-42F5-9D6B-7EF1148F9646@jrtc27.com>
References: <20220131110307.1684739-1-mchitale@ventanamicro.com>
 <CAAhSdy2wX7Re4yepV7ReNQazF9jb-eqSUDE7rLCarr3iUchzkQ@mail.gmail.com>
 <B04F937F-6FC8-42F5-9D6B-7EF1148F9646@jrtc27.com>
Message-ID: <CAK9=C2WPmH4snAH1Ft4jNoaNuLRQ9dEuYm_K4ePVHdS9wkBYPA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 2, 2022 at 6:49 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 2 Feb 2022, at 11:14, Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, Jan 31, 2022 at 4:33 PM Mayuresh Chitale
> > <mchitale@ventanamicro.com> wrote:
> >>
> >> Those applications that run in VU mode and access the time CSR cause
> >> a virtual instruction trap as Guest kernel currently does not
> >> initialize the scounteren CSR.
> >>
> >> To fix this, we should make CY, TM, and IR counters accessibile
> >> by default in VU mode (similar to OpenSBI).
> >>
> >> Fixes: a33c72faf2d73 ("RISC-V: KVM: Implement VCPU create, init and
> >> destroy functions")
> >> Cc:stable at vger.kernel.org
> >> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> >
> > Thanks, I have queued this for fixes.
>
> The formatting is clearly wrong...

I have updated this in my fixes queue.

>
> > Regards,
> > Anup
> >
> >> ---
> >> arch/riscv/kvm/vcpu.c | 4 ++++
> >> 1 file changed, 4 insertions(+)
> >>
> >> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> >> index 0c5239e05721..caaf824347b9 100644
> >> --- a/arch/riscv/kvm/vcpu.c
> >> +++ b/arch/riscv/kvm/vcpu.c
> >> @@ -90,6 +90,7 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
> >> int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
> >> {
> >>        struct kvm_cpu_context *cntx;
> >> +       struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
> >>
> >>        /* Mark this VCPU never ran */
> >>        vcpu->arch.ran_atleast_once = false;
> >> @@ -106,6 +107,9 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
> >>        cntx->hstatus |= HSTATUS_SPVP;
> >>        cntx->hstatus |= HSTATUS_SPV;
> >>
> >> +       /* By default, make CY, TM, and IR counters accessible in VU mode */
> >> +       reset_csr->scounteren=0x7;
>
> ... here

Same as above, I have updated this my queue as well.

Thanks,
Anup

>
> Jess
>
> >> +
> >>        /* Setup VCPU timer */
> >>        kvm_riscv_vcpu_timer_init(vcpu);
> >>
> >> --
> >> 2.25.1
> >>
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>

