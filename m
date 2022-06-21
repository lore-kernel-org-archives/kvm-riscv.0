From: Sean Christopherson <seanjc@google.com>
Date: Tue, 21 Jun 2022 17:27:45 +0000
Subject: [PATCH v6 10/22] KVM: x86/mmu: Pass memory caches to allocate
 SPs separately
In-Reply-To: <CALzav=fVzX+GXCdKRwRGofAgKatX206_kBKagT7R-eYO9RnYkA@mail.gmail.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-11-dmatlack@google.com>
 <YqyXYJsoZGgp7l62@google.com>
 <CALzav=fVzX+GXCdKRwRGofAgKatX206_kBKagT7R-eYO9RnYkA@mail.gmail.com>
Message-ID: <YrH/kd5g08rvZkTt@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 21, 2022, David Matlack wrote:
> On Fri, Jun 17, 2022 at 8:02 AM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Mon, May 16, 2022, David Matlack wrote:
> > > Refactor kvm_mmu_alloc_shadow_page() to receive the caches from which it
> > > will allocate the various pieces of memory for shadow pages as a
> > > parameter, rather than deriving them from the vcpu pointer. This will be
> > > useful in a future commit where shadow pages are allocated during VM
> > > ioctls for eager page splitting, and thus will use a different set of
> > > caches.
> > >
> > > Preemptively pull the caches out all the way to
> > > kvm_mmu_get_shadow_page() since eager page splitting will not be calling
> >
> > Uber nit, "eager hugepage splitting" to provide a mental cue/reminder for why
> > those pages are direct.
> 
> I think it may be too late to move away from the term "eager page
> splitting" (it is already in commit messages and the module param is
> called "eager_page_split"). Using a slightly different name here might
> produce more confusion, or at least cause readers to do a double-take.

True.  I'm totally fine omitting "huge".

> But naming aside, I don't follow what you mean here. i.e. What does
> the fact that page splitting uses direct shadow pages have to do with
> this patch?

I have no idea.  I suspect I was looking at a different patch when replying to
this one.  I distinctly remember pausing for a few seconds to recall the direct
aspect, but looking back at this patch I don't see what I could have possibly be
wondering about.

