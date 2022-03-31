From: Julia Lawall <julia.lawall@inria.fr>
Date: Thu, 31 Mar 2022 10:02:25 +0200 (CEST)
Subject: question about arch/riscv/kvm/mmu.c
In-Reply-To: <CAK9=C2XYp5a2diGNLf8=a05uPP-gAmUodtMbDWrByiW9skjjmA@mail.gmail.com>
References: <alpine.DEB.2.22.394.2203162205550.3177@hadrien>
 <CAK9=C2XYp5a2diGNLf8=a05uPP-gAmUodtMbDWrByiW9skjjmA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2203311001000.3195@hadrien>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Thu, 31 Mar 2022, Anup Patel wrote:

> On Thu, Mar 17, 2022 at 2:40 AM Julia Lawall <julia.lawall@inria.fr> wrote:
> >
> > Hello,
> >
> > The function kvm_riscv_stage2_map contains the code:
> >
> > mmu_seq = kvm->mmu_notifier_seq;
> >
> > I noticed that in every other place in the kernel where the
> > mmu_notifier_seq field is read, there is a read barrier after it.  Is
> > there some reason why it is not necessary here?
>
> When I did the initial porting of KVM RISC-V (2 years back), I did
> not see such a barrier being used along with mmu_notifier_seq
> field hence the current code.
>
> I am certainly okay adding it to be consistent with other architectures.
>
> Can you send a patch for this ?

Sure, will do.

julia

>
> Thanks,
> Anup
>
> >
> > thanks,
> > julia
> >
> > --
> > kvm-riscv mailing list
> > kvm-riscv at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv
>

