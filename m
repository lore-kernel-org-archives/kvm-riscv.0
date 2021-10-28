From: Sean Christopherson <seanjc@google.com>
Date: Thu, 28 Oct 2021 15:34:21 +0000
Subject: [PATCH v2 21/43] KVM: VMX: Clean up PI pre/post-block WARNs
In-Reply-To: <6b2bdfad87e268e861b6cc331d25790dade8e27b.camel@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-22-seanjc@google.com>
 <6b2bdfad87e268e861b6cc331d25790dade8e27b.camel@redhat.com>
Message-ID: <YXrC/X6b+tgn6cJ9@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 28, 2021, Maxim Levitsky wrote:
> On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> > Move the WARN sanity checks out of the PI descriptor update loop so as
> > not to spam the kernel log if the condition is violated and the update
> > takes multiple attempts due to another writer.  This also eliminates a
> > few extra uops from the retry path.
> > 
> > Technically not checking every attempt could mean KVM will now fail to
> > WARN in a scenario that would have failed before, but any such failure
> > would be inherently racy as some other agent (CPU or device) would have
> > to concurrent modify the PI descriptor.

...

> Don't know for sure if this is desired. I'll would just use WARN_ON_ONCE instead
> if the warning spams the log.
> 
> If there is a race I would rather want to catch it even if rare.

Paolo had similar concerns[*].  I copied the most relevant part of the discussion
below, let me know if you object to the outcome.

Thanks for the reviews!

[*] https://lore.kernel.org/all/YXllGfrjPX1pVUx6 at google.com/T/#u

On Wed, Oct 27, 2021 at 8:38 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 27/10/21 17:28, Sean Christopherson wrote:
> > On Wed, Oct 27, 2021, Paolo Bonzini wrote:
> > > On 27/10/21 16:41, Sean Christopherson wrote:
> > > > The other thing I don't like about having the WARN in the loop is that it suggests
> > > > that something other than the vCPU can modify the NDST and SN fields, which is
> > > > wrong and confusing (for me).
> > >
> > > Yeah, I can agree with that.  Can you add it in a comment above the cmpxchg
> > > loop, it can be as simple as
> > >
> > > 	/* The processor can set ON concurrently.  */
> > >
> > > when you respin patch 21 and the rest of the series?
> >
> > I can definitely add a comment, but I think that comment is incorrect.
>
> It's completely backwards indeed.  I first had "the hardware" and then
> shut down my brain for a second to replace it.
>
> > So something like this?
> >
> > 	/* ON can be set concurrently by a different vCPU or by hardware. */
>
> Yes, of course.

