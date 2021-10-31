From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Mon, 01 Nov 2021 00:48:17 +0200
Subject: [PATCH v2 26/43] KVM: VMX: Read Posted Interrupt "control"
 exactly once per loop iteration
In-Reply-To: <YXrH/ZZBOHrWHz4j@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-27-seanjc@google.com>
 <b078cce30f86672d7d8f8eaa0adc47d24def24e2.camel@redhat.com>
 <YXrH/ZZBOHrWHz4j@google.com>
Message-ID: <20a17d75855dfb9bd496466fcd9f14baab0b2bda.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2021-10-28 at 15:55 +0000, Sean Christopherson wrote:
> On Thu, Oct 28, 2021, Maxim Levitsky wrote:
> > On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> > > Use READ_ONCE() when loading the posted interrupt descriptor control
> > > field to ensure "old" and "new" have the same base value.  If the
> > > compiler emits separate loads, and loads into "new" before "old", KVM
> > > could theoretically drop the ON bit if it were set between the loads.
> > > 
> > > Fixes: 28b835d60fcc ("KVM: Update Posted-Interrupts Descriptor when vCPU is preempted")
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> > >  arch/x86/kvm/vmx/posted_intr.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> > > index 414ea6972b5c..fea343dcc011 100644
> > > --- a/arch/x86/kvm/vmx/posted_intr.c
> > > +++ b/arch/x86/kvm/vmx/posted_intr.c
> > > @@ -53,7 +53,7 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
> > >  
> > >  	/* The full case.  */
> > >  	do {
> > > -		old.control = new.control = pi_desc->control;
> > > +		old.control = new.control = READ_ONCE(pi_desc->control);
> > >  
> > >  		dest = cpu_physical_id(cpu);
> > >  
> > > @@ -104,7 +104,7 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
> > >  	     "Wakeup handler not enabled while the vCPU was blocking");
> > >  
> > >  	do {
> > > -		old.control = new.control = pi_desc->control;
> > > +		old.control = new.control = READ_ONCE(pi_desc->control);
> > >  
> > >  		dest = cpu_physical_id(vcpu->cpu);
> > >  
> > > @@ -160,7 +160,7 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
> > >  	     "Posted Interrupt Suppress Notification set before blocking");
> > >  
> > >  	do {
> > > -		old.control = new.control = pi_desc->control;
> > > +		old.control = new.control = READ_ONCE(pi_desc->control);
> > >  
> > >  		/* set 'NV' to 'wakeup vector' */
> > >  		new.nv = POSTED_INTR_WAKEUP_VECTOR;
> > 
> > I wish there was a way to mark fields in a struct, as requiring 'READ_ONCE' on them
> > so that compiler would complain if this isn't done, or automatically use 'READ_ONCE'
> > logic.
> 
> Hmm, I think you could make an argument that ON and thus the whole "control"
> word should be volatile.  AFAICT, tagging just "on" as volatile actually works.
> There's even in a clause in Documentation/process/volatile-considered-harmful.rst
> that calls this out as a (potentially) legitimate use case.
> 
>   - Pointers to data structures in coherent memory which might be modified
>     by I/O devices can, sometimes, legitimately be volatile.
> 
> That said, I think I actually prefer forcing the use of READ_ONCE.  The descriptor
> requires more protections than what volatile provides, namely that all writes need
> to be atomic.  So given that volatile alone isn't sufficient, I'd prefer to have
> the code itself be more self-documenting.

I took a look at how READ_ONCE/WRITE_ONCE is implemented and indeed they use volatile
(the comment above __READ_ONCE is worth gold...), so there is a bit of contradiction:

volatile-considered-harmful.rst states not to mark struct members volatile since
you usually need more that than (very true often) and yet, I also heard that
READ_ONCE/WRITE_ONCE is very encouraged to be used to fields that are used in lockless
algorithms, even when not strictly needed,
so why not to just mark the field and then use it normally? I guess that
explicit READ_ONCE/WRITE_ONCE is much more readable/visible that a volatile in some header file.

Anyway this isn't something I am going to argue about or push to be changed,
just something I thought about.

Best regards,
	Maxim Levitsky



> 
> E.g. this compiles and does mess up the expected size.
> 
> diff --git a/arch/x86/kvm/vmx/posted_intr.h b/arch/x86/kvm/vmx/posted_intr.h
> index 7f7b2326caf5..149df3b18789 100644
> --- a/arch/x86/kvm/vmx/posted_intr.h
> +++ b/arch/x86/kvm/vmx/posted_intr.h
> @@ -11,9 +11,9 @@ struct pi_desc {
>         union {
>                 struct {
>                                 /* bit 256 - Outstanding Notification */
> -                       u16     on      : 1,
> +                       volatile u16    on      : 1;
>                                 /* bit 257 - Suppress Notification */
> -                               sn      : 1,
> +                       u16     sn      : 1,
>                                 /* bit 271:258 - Reserved */
>                                 rsvd_1  : 14;
>                                 /* bit 279:272 - Notification Vector */
> @@ -23,7 +23,7 @@ struct pi_desc {
>                                 /* bit 319:288 - Notification Destination */
>                         u32     ndst;
>                 };
> -               u64 control;
> +               volatile u64 control;
>         };
>         u32 rsvd[6];
>  } __aligned(64);
> 



