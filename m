From: David Matlack <dmatlack@google.com>
Date: Wed, 25 Jan 2023 09:21:34 -0800
Subject: [PATCH 0/7] KVM: Add a common API for range-based TLB invalidation
In-Reply-To: <Y9B9FZReDVwdNNrS@google.com>
References: <20230119173559.2517103-1-dmatlack@google.com> <Y9B8A+/FSPCrAANT@google.com>
 <Y9B9FZReDVwdNNrS@google.com>
Message-ID: <CALzav=fAVF5VDj76Pd9m+G+-A+UdvCS1tTVGCyvnvtgq4eFOSg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 24, 2023 at 4:51 PM Oliver Upton <oliver.upton@linux.dev> wrote:
> On Wed, Jan 25, 2023 at 12:46:59AM +0000, Sean Christopherson wrote:
> > On Thu, Jan 19, 2023, David Matlack wrote:
> >
> > Did a quick read through, didn't see anything I disagree with.
>
> LGTM for the tiny amount of arm64 changes, though I imagine David will
> do a v2 to completely get rid of the affected Kconfig.

Thanks both for taking a look.

> > Is there any urgency to getting this merged?  If not, due to the dependencies
> > with x86 stuff queued for 6.3, and because of the cross-architecture changes, it
> > might be easiest to plan on landing this in 6.4.  That would allow Paolo to create
> > an immutable topic branch fairly early on.
>
> +1, that buys us some time to go through the rounds on the arm64 side
> such that we could possibly stack the TLBIRANGE work on top.

The main benefit of merging in 6.3 would be to make Raghavendra's life
simpler/easier so he can build the next version of his arm64 TLBI
series on top. But I guess he can still do that with a topic branch.

I'll go ahead and send a v2 on top of the changes from Hou you queued
for 6.3, Sean, and we can plan on landing that in 6.4 (barring any
further feedback or conflicts).

