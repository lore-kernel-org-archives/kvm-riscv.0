From: David Woodhouse <dwmw2@infradead.org>
Date: Sat, 20 Nov 2021 17:02:03 +0000
Subject: [PATCH v4 11/11] KVM: x86: First attempt at converting nested
 virtual APIC page to gpc
In-Reply-To: <b806de35-167a-4c7c-f143-cff3ec279491@nextfour.com>
References: <20211120102810.8858-1-dwmw2@infradead.org>
 <20211120102810.8858-12-dwmw2@infradead.org>
 <d87de1ec-8be7-3967-87b2-c8906c1ab1b3@nextfour.com>
 <8f434989aebd257a36cafcb414edcc5906c02728.camel@infradead.org>
 <b806de35-167a-4c7c-f143-cff3ec279491@nextfour.com>
Message-ID: <df87f7e828f403013f30c2c8d77ea2694b49292e.camel@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 2021-11-20 at 18:30 +0200, Mika Penttil? wrote:
> 
> On 20.11.2021 18.21, David Woodhouse wrote:
> > On Sat, 2021-11-20 at 17:48 +0200, Mika Penttil? wrote:
> > > > @@ -9785,6 +9787,14 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
> > > >         local_irq_disable();
> > > >         vcpu->mode = IN_GUEST_MODE;
> > > >     
> > > > +     /*
> > > > +      * If the guest requires direct access to mapped L1 pages, check
> > > > +      * the caches are valid. Will raise KVM_REQ_GET_NESTED_STATE_PAGES
> > > > +      * to go and revalidate them, if necessary.
> > > > +      */
> > > > +     if (is_guest_mode(vcpu) && kvm_x86_ops.nested_ops->check_guest_maps)
> > > > +             kvm_x86_ops.nested_ops->check_guest_maps(vcpu);
> > >
> > > But KVM_REQ_GET_NESTED_STATE_PAGES is not check until next
> > > vcpu_enter_guest() entry ?
> >
> > Sure, but that's why this call to ->check_guest_maps() comes just a few
> > lines *before* the 'if (kvm_cpu_exit_request(vcpu))' that will bounce
> > us back out so that we go through vcpu_enter_guest() from the start
> > again?
>
> Yes, I had forgotten that...=

Having said that, I think Paolo was rightly trying to persuade me that
we don't need the check there at all anyway. Because the *invalidation*
will raise KVM_REQ_GPC_INVALIDATE, and that's sufficient to bounce us
out of IN_GUEST_MODE without us having to check the GPC explicitly.

We do need to ensure that we are up to date with memslots changes, but
that's a bit simpler, and we have kvm_arch_memslots_changed() waking us
for that too.

So yeah, with sufficient thought I think we can be entirely event-
driven instead of having to have an explicit *check* on entry.



-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 5174 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20211120/b49f0b79/attachment-0001.p7s>
