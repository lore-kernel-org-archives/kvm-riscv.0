From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 29 Aug 2023 13:04:18 +0800
Subject: [PATCH 0/4] RISCV: Add kvm Sstc timer selftest
In-Reply-To: <ZOyqRfdvxpdtSE1c@google.com>
References: <cover.1690364259.git.haibo1.xu@intel.com> <ZMrVrXlvu/FJEayx@google.com>
 <CAJve8onbxHjJoC-k-TtOm1BBtjm38moaW-Kk8siKsxt9nwZZZw@mail.gmail.com> <ZOyqRfdvxpdtSE1c@google.com>
Message-ID: <CAJve8o=rFrVKxpaLLaJ8_KKQxMvyOOgVJn8qk715ymH8dpQ3MA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 28, 2023 at 10:08?PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Sun, Aug 27, 2023, Haibo Xu wrote:
> > On Thu, Aug 3, 2023 at 6:16?AM Sean Christopherson <seanjc@google.com> wrote:
> > >
> > > On Thu, Jul 27, 2023, Haibo Xu wrote:
> > > > The sstc_timer selftest is used to validate Sstc timer functionality
> > > > in a guest, which sets up periodic timer interrupts and check the
> > > > basic interrupt status upon its receipt.
> > > >
> > > > This KVM selftest was ported from aarch64 arch_timer and tested
> > > > with Linux v6.5-rc3 on a Qemu riscv64 virt machine.
> > > >
> > > > Haibo Xu (4):
> > > >   tools: riscv: Add header file csr.h
> > > >   KVM: riscv: selftests: Add exception handling support
> > > >   KVM: riscv: selftests: Add guest helper to get vcpu id
> > > >   KVM: riscv: selftests: Add sstc_timer test
> > >
> > > FYI, patch 4 will conflict with the in-flight guest printf changes[*], as will
> > > reworking the existing arch_timer test.  My plan is to create an immutable tag
> > > later this week (waiting to make sure nothing explodes).  I highly recommend basing
> > > v2 on top of that.
> > >
> >
> > Hi Sean,
> >
> > Could you help point me to the immutable tag for the guest printf changes?
>
> Sorry, I forgot to create the tag until last week, probably made it a bit hard to
> find...
>
>   https://github.com/kvm-x86/linux.git tags/kvm-x86-selftests-immutable-6.6

Thanks!

