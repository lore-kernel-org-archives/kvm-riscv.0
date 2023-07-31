From: Sean Christopherson <seanjc@google.com>
Date: Mon, 31 Jul 2023 10:41:26 -0700
Subject: [PATCH] KVM: Wrap kvm_{gfn,hva}_range.pte in a per-action union
In-Reply-To: <ZMfxYR41K71UV/84@linux.dev>
References: <20230729004144.1054885-1-seanjc@google.com> <ZMfxYR41K71UV/84@linux.dev>
Message-ID: <ZMfyRnROXNeu4tnS@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 31, 2023, Oliver Upton wrote:
> On Fri, Jul 28, 2023 at 05:41:44PM -0700, Sean Christopherson wrote:
> > If this looks good, my thought is to squeeze it into 6.6 so that the MGLRU
> > and guest_memfd() series can build on it.  Or those series could just
> > include it?
> 
> Eh, I'm not a huge fan of having two series independently reposting a
> common base. It can be a bit annoying when the two authors have slightly
> different interpretations on how to improve it...

That suggests that there's something to improve upon ;-)

> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index dfbaafbe3a00..f84ef9399aee 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -526,7 +526,7 @@ typedef void (*on_unlock_fn_t)(struct kvm *kvm);
> >  struct kvm_hva_range {
> >  	unsigned long start;
> >  	unsigned long end;
> > -	pte_t pte;
> > +	union kvm_mmu_notifier_arg arg;
> >  	hva_handler_t handler;
> >  	on_lock_fn_t on_lock;
> >  	on_unlock_fn_t on_unlock;
> > @@ -547,6 +547,8 @@ static void kvm_null_fn(void)
> >  }
> >  #define IS_KVM_NULL_FN(fn) ((fn) == (void *)kvm_null_fn)
> >  
> > +static const union kvm_mmu_notifier_arg KVM_NO_ARG;
> > +
> 
> I'm guessing you were trying to keep this short, but it might be nice to
> use MMU_NOTIFIER_ (or similar) as the prefix to make the scope
> immediately obvious.

Yeah, agreed, it's worth the extra line in kvm_mmu_notifier_clear_flush_young().

