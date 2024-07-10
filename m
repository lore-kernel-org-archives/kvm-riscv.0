From: Sean Christopherson <seanjc@google.com>
Date: Wed, 10 Jul 2024 08:51:51 -0700
Subject: [PATCH v3 0/3] KVM: Set vcpu->preempted/ready iff scheduled out
 while running
In-Reply-To: <CALzav=cwu3M2nLHwZLCTF=eGWx2Nq+=TuHMuGTfZCNa27mLs1A@mail.gmail.com>
References: <20240503181734.1467938-1-dmatlack@google.com> <171874683295.1901599.10170158200177384059.b4-ty@google.com>
 <CALzav=cwu3M2nLHwZLCTF=eGWx2Nq+=TuHMuGTfZCNa27mLs1A@mail.gmail.com>
Message-ID: <Zo6uFz187FBYnQiY@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 01, 2024, David Matlack wrote:
> On Tue, Jun 18, 2024 at 2:41?PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Fri, 03 May 2024 11:17:31 -0700, David Matlack wrote:
> > > This series changes KVM to mark a vCPU as preempted/ready if-and-only-if
> > > it's scheduled out while running. i.e. Do not mark a vCPU
> > > preempted/ready if it's scheduled out during a non-KVM_RUN ioctl() or
> > > when userspace is doing KVM_RUN with immediate_exit=true.
> > >
> > > This is a logical extension of commit 54aa83c90198 ("KVM: x86: do not
> > > set st->preempted when going back to user space"), which  stopped
> > > marking a vCPU as preempted when returning to userspace. But if userspace
> > > invokes a KVM vCPU ioctl() that gets preempted, the vCPU will be marked
> > > preempted/ready. This is arguably incorrect behavior since the vCPU was
> > > not actually preempted while the guest was running, it was preempted
> > > while doing something on behalf of userspace.
> > >
> > > [...]
> >
> > Applied to kvm-x86 generic, with minor changelog tweaks (me thinks you've been
> > away from upstream too long ;-) ).  Thanks!
> 
> Thanks for the cleanups. Looks like you replaced "[Tt]his commit"
> throughout. Anything else (so I can avoid the same mistakes in the
> future)?

I don't think so?  The "This commit" stuff is the only thing that I remember, so
any other tweaks can't be that important :-)

