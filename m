From: Sean Christopherson <seanjc@google.com>
Date: Thu, 12 Sep 2024 07:36:35 -0700
Subject: [PATCH v2 13/13] KVM: selftests: Verify KVM correctly handles mprotect(PROT_READ)
In-Reply-To: <CADrL8HW+hUNKPbaL7xYb0FEesB2t-AwAw07iOCDj8KHp0RwVpQ@mail.gmail.com>
References: <20240911204158.2034295-1-seanjc@google.com> <20240911204158.2034295-14-seanjc@google.com>
 <CADrL8HW+hUNKPbaL7xYb0FEesB2t-AwAw07iOCDj8KHp0RwVpQ@mail.gmail.com>
Message-ID: <ZuL8c7SCV0I16cma@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 11, 2024, James Houghton wrote:
> On Wed, Sep 11, 2024 at 1:42?PM Sean Christopherson <seanjc@google.com> wrote:
> > @@ -31,6 +33,42 @@ static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
> >                 *((volatile uint64_t *)gpa);
> >         GUEST_SYNC(2);
> >
> > +       /*
> > +        * Write to the region while mprotect(PROT_READ) is underway.  Keep
> > +        * looping until the memory is guaranteed to be read-only, otherwise
> > +        * vCPUs may complete their writes and advance to the next stage
> > +        * prematurely.
> > +        *
> > +        * For architectures that support skipping the faulting instruction,
> > +        * generate the store via inline assembly to ensure the exact length
> > +        * of the instruction is known and stable (vcpu_arch_put_guest() on
> > +        * fixed-length architectures should work, but the cost of paranoia
> > +        * is low in this case).  For x86, hand-code the exact opcode so that
> > +        * there is no room for variability in the generated instruction.
> > +        */
> > +       do {
> > +               for (gpa = start_gpa; gpa < end_gpa; gpa += stride)
> > +#ifdef __x86_64__
> > +                       asm volatile(".byte 0x48,0x89,0x00" :: "a"(gpa) : "memory"); /* mov %rax, (%rax) */
> 
> I'm curious what you think about using labels (in asm, but perhaps
> also in C) and *setting* the PC instead of incrementing the PC. 

I have nothing against asm labels, but generally speaking I don't like using
_global_ labels to skip instructions.  E.g. __KVM_ASM_SAFE() uses labels to compute
the instruction size, but those labels are local and never directly used outside
of the macro.

The biggest problem with global labels is that they don't scale.  E.g. if we
extend this test in the future with another testcase that needs to skip a gpa,
then we'll end up with skip_page1 and skip_page2, and the code starts to become
even harder to follow.

Don't get me wrong, skipping a fixed instruction size is awful too, but in my
experience they are less painful to maintain over the long haul.

> Diff attached (tested on x86).

Nit, in the future, just copy+pase the diff for small things like this (and even
for large diffs in many cases) so that readers don't need to open an attachment
(depending on their mail client), and so that it's easier to comment on the
proposed changed.

`git am --scissors` (a.k.a. `git am -c`) can be used to essentially extract and
apply such a diff from the mail.

> It might even be safe/okay to always use vcpu_arch_put_guest(), just set the
> PC to a label immediately following it.

That would not be safe/feasible.  Labels in C code are scoped to the function.
And AFAIK, labels for use with goto are also not visible symbols, they are
statements.  The "standard" way to expose a label from a function is to use inline
asm, at which point there are zero guarantees that nothing necessary is generated
between vcpu_arch_put_guest() and the next asm() block.

E.g. ignoring the inline asm for the moment, the compiler could generate multiple
paths for a loop, e.g. an unrolled version for a small number of iterations, and
an actual loop for a larger number of iterations.  Trying to define a label as a
singular symbol for that is nonsensical.

