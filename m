From: David Matlack <dmatlack@google.com>
Date: Mon, 12 Dec 2022 14:42:27 -0800
Subject: [RFC PATCH 33/37] KVM: Move kvm_arch_flush_remote_tlbs_memslot()
 to common code
In-Reply-To: <CANgfPd_069QPNby+mR4GuOWDNJtFk_=9EOffb0=2_V5TH-ZCDA@mail.gmail.com>
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-34-dmatlack@google.com>
 <CANgfPd_069QPNby+mR4GuOWDNJtFk_=9EOffb0=2_V5TH-ZCDA@mail.gmail.com>
Message-ID: <CALzav=fMX0g_n9pVFsLShZjEkPLquo2u_QpPMPzUMAGYtjZFOw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 2:03 PM Ben Gardon <bgardon@google.com> wrote:
>
> On Thu, Dec 8, 2022 at 11:40 AM David Matlack <dmatlack@google.com> wrote:
> >
> > Move kvm_arch_flush_remote_tlbs_memslot() to common code and drop
> > "arch_" from the name. kvm_arch_flush_remote_tlbs_memslot() is just a
> > range-based TLB invalidation where the range is defined by the memslot.
> > Now that kvm_flush_remote_tlbs_range() can be called from common code we
> > can just use that and drop a bunch of duplicate code from the arch
> > directories.
> >
> > Note this adds a lockdep assertion for slot_lock being held when calling
> > kvm_flush_remote_tlbs_memslot(), which was previously only asserted on
> > x86.
>
> Besides the one lockdep assertion, is there any benefit to having this
> wrapper function? Open-coding "kvm_flush_remote_tlbs_range(kvm,
> memslot->base_gfn, memslot->npages);" is only a slightly longer line
> and, IMO, just as readable. I'm happy to see this cleanup, but it
> might be just as easy to drop the function.

The wrapper makes lines shorter, adds a lockdep assertion, and is just
as readable. What's the reason to drop it?

