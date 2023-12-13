From: Jim Mattson <jmattson@google.com>
Date: Wed, 13 Dec 2023 14:31:40 -0800
Subject: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
In-Reply-To: <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
References: <20220921003201.1441511-11-seanjc@google.com> <20231207010302.2240506-1-jmattson@google.com>
 <ZXHw7tykubfG04Um@google.com> <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
 <ZXh8Nq_y_szj1WN0@google.com> <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
Message-ID: <CALMp9eQ69dGSix-9pJdEtEw9T1Mqz9E1eaf1-yGP9k4_nMZogw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 13, 2023 at 2:25?PM Maxim Levitsky <mlevitsk@redhat.com> wrote:
>
> On Tue, 2023-12-12 at 07:28 -0800, Sean Christopherson wrote:
> > On Sun, Dec 10, 2023, Jim Mattson wrote:
> > > On Thu, Dec 7, 2023 at 8:21?AM Sean Christopherson <seanjc@google.com> wrote:
> > > > Doh.  We got the less obvious cases and missed the obvious one.
> > > >
> > > > Ugh, and we also missed a related mess in kvm_guest_apic_has_interrupt().  That
> > > > thing should really be folded into vmx_has_nested_events().
> > > >
> > > > Good gravy.  And vmx_interrupt_blocked() does the wrong thing because that
> > > > specifically checks if L1 interrupts are blocked.
> > > >
> > > > Compile tested only, and definitely needs to be chunked into multiple patches,
> > > > but I think something like this mess?
> > >
> > > The proposed patch does not fix the problem. In fact, it messes things
> > > up so much that I don't get any test results back.
> >
> > Drat.
> >
> > > Google has an internal K-U-T test that demonstrates the problem. I
> > > will post it soon.
> >
> > Received, I'll dig in soonish, though "soonish" might unfortunately might mean
> > 2024.
> >
>
> Hi,
>
> So this is what I think:
>
>
> KVM does have kvm_guest_apic_has_interrupt() for this exact purpose,
> to check if nested APICv has a pending interrupt before halting.
>
>
> However the problem is bigger - with APICv we have in essence 2 pending interrupt
> bitmaps - the PIR and the IRR, and to know if the guest has a pending interrupt
> one has in theory to copy PIR to IRR, then see if the max is larger then the current PPR.
>
> Since we don't want to write to guest memory, and the IRR here resides in the guest memory,
> I guess we have to do a 'dry-run' version of 'vmx_complete_nested_posted_interrupt' and call
> it from  kvm_guest_apic_has_interrupt().
>
> What do you think? I can prepare a patch for this.
>
> Can you share a reproducer or write a new one that can be shared?

See https://lore.kernel.org/kvm/20231211185552.3856862-1-jmattson at google.com/.

> Best regards,
>         Maxim Levitsky
>

