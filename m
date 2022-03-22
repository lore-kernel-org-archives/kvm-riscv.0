From: Oliver Upton <oupton@google.com>
Date: Tue, 22 Mar 2022 06:51:20 +0000
Subject: [PATCH v4 08/15] KVM: arm64: Return a value from
 check_vcpu_requests()
In-Reply-To: <CAAeT=FwmU1Ej8zc4wB15TRRH6dH9xK7621gO12ib2QjHW11=NA@mail.gmail.com>
References: <20220311174001.605719-1-oupton@google.com>
 <20220311174001.605719-9-oupton@google.com>
 <CAAeT=FwmU1Ej8zc4wB15TRRH6dH9xK7621gO12ib2QjHW11=NA@mail.gmail.com>
Message-ID: <Yjlx6JKTRbzwAE7o@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 21, 2022 at 11:21:15PM -0700, Reiji Watanabe wrote:
> Hi Oliver,
> 
> On Fri, Mar 11, 2022 at 9:41 AM Oliver Upton <oupton@google.com> wrote:
> >
> > A subsequent change to KVM will introduce a vCPU request that could
> > result in an exit to userspace. Change check_vcpu_requests() to return a
> > value and document the function. Unconditionally return 1 for now.
> >
> > Signed-off-by: Oliver Upton <oupton@google.com>
> > ---
> >  arch/arm64/kvm/arm.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 7c297ddc8177..8eed0556ccaa 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -648,7 +648,16 @@ void kvm_vcpu_wfi(struct kvm_vcpu *vcpu)
> >         preempt_enable();
> >  }
> >
> > -static void check_vcpu_requests(struct kvm_vcpu *vcpu)
> > +/**
> > + * check_vcpu_requests - check and handle pending vCPU requests
> > + * @vcpu:      the VCPU pointer
> > + *
> > + * Return: 1 if we should enter the guest
> > + *        0 if we should exit to userspace
> > + *        <= 0 if we should exit to userspace, where the return value indicates
> > + *        an error
> 
> Nit: Shouldn't "<= 0" be "< 0" ?

It definitely should. I'll fold this in to the next spin.

--
Thanks,
Oliver

