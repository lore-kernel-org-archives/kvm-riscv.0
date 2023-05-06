From: Vipin Sharma <vipinsh@google.com>
Date: Fri, 5 May 2023 17:55:26 -0700
Subject: [PATCH 9/9] KVM: arm64: Run clear-dirty-log under MMU read lock
In-Reply-To: <86pm7xjh3y.wl-maz@kernel.org>
References: <20230421165305.804301-1-vipinsh@google.com> <20230421165305.804301-10-vipinsh@google.com>
 <86pm7xjh3y.wl-maz@kernel.org>
Message-ID: <CAHVum0d4W0emmyS0G8_nCXQuvgZN-8utDiT6TMYrOq7dF60aAw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 21, 2023 at 10:11?AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 21 Apr 2023 17:53:05 +0100,
> Vipin Sharma <vipinsh@google.com> wrote:
> >
> > Take MMU read lock for write protecting PTEs and use shared page table
> > walker for clearing dirty logs.
> >
> > Clearing dirty logs are currently performed under MMU write locks. This
> > means vCPUs write protection fault, which also take MMU read lock,  will
> > be blocked during this operation. This causes guest degradation and
> > especially noticeable on VMs with lot of vCPUs.
> >
> > Taking MMU read lock will allow vCPUs to execute parallelly and reduces
> > the impact on vCPUs performance.
>
> Sure. Taking no lock whatsoever would be even better.
>
> What I don't see is the detailed explanation that gives me the warm
> feeling that this is safe and correct. Such an explanation is the
> minimum condition for me to even read the patch.
>

Thanks for freaking me out. Your not getting warm feeling hunch was
right, stage2_attr_walker() and stage2_update_leaf_attrs() combo do
not retry if cmpxchg fails for write protection. Write protection
callers don't check what the return status of the API is and just
ignores cmpxchg failure. This means a vCPU (MMU read lock user) can
cause cmpxchg to fail for write protection operation (under read lock,
which this patch does) and clear ioctl will happily return as if
everything is good.

I will update the series and also work on validating the correctness
to instill more confidence.

Thanks

