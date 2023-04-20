From: Sean Christopherson <seanjc@google.com>
Date: Thu, 20 Apr 2023 13:21:28 -0700
Subject: [RFC 00/48] RISC-V CoVE support
In-Reply-To: <CAHBxVyE+SkQ-jpbupmJU4fpuiXY_GufnANDBUuO5bMHDsudeYg@mail.gmail.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com> <ZEFopfs5Ij/AIkee@google.com>
 <CAHBxVyE+SkQ-jpbupmJU4fpuiXY_GufnANDBUuO5bMHDsudeYg@mail.gmail.com>
Message-ID: <ZEGeyLYCIj75Hmwa@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 21, 2023, Atish Kumar Patra wrote:
> On Thu, Apr 20, 2023 at 10:00?PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Wed, Apr 19, 2023, Atish Patra wrote:
> > > 2. Lazy gstage page allocation vs upfront allocation with page pool.
> > > Currently, all gstage mappings happen at runtime during the fault. This is expensive
> > > as we need to convert that page to confidential memory as well. A page pool framework
> > > may be a better choice which can hold all the confidential pages which can be
> > > pre-allocated upfront. A generic page pool infrastructure may benefit other CC solutions ?
> >
> > I'm sorry, what?  Do y'all really not pay any attention to what is happening
> > outside of the RISC-V world?
> >
> > We, where "we" is KVM x86 and ARM, with folks contributing from 5+ companines,
> > have been working on this problem for going on three *years*.  And that's just
> > from the first public posting[1], there have been discussions about how to approach
> > this for even longer.  There have been multiple related presentations at KVM Forum,
> > something like 4 or 5 just at KVM Forum 2022 alone.
> >
> 
> I did mention about that in the 1st item in the TODO list.

My apologies, I completely missed the todo list.

> Thanks for your suggestion. It seems we should just directly move to
> restrictedmem asap.

Yes please, for the sake of everyone involved.  It will likely save you from
running into the same pitfalls that x86 and ARM already encountered, and the more
eyeballs and use cases on whatever restrictemem ends up being called, the better.

Thanks!

