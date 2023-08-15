From: Sean Christopherson <seanjc@google.com>
Date: Tue, 15 Aug 2023 17:15:53 +0000
Subject: [PATCH v9 00/14] KVM: arm64: Add support for FEAT_TLBIRANGE
In-Reply-To: <CAJHc60yp7X9Za=CJnJWqAbPuKznp91fYtnBOuQQCGtiXyQBqWw@mail.gmail.com>
References: <20230811045127.3308641-1-rananta@google.com> <ZNq15SZ+53umvOfx@google.com>
 <CAJHc60wMueazp3Wm=b6-tnFPAyX0zeYuVQe9uPEJrpAm0azw2A@mail.gmail.com>
 <ZNrMTmppUfQhdsyY@google.com> <CAJHc60yp7X9Za=CJnJWqAbPuKznp91fYtnBOuQQCGtiXyQBqWw@mail.gmail.com>
Message-ID: <ZNuyyQsFCmDc7Gmb@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 15, 2023, Raghavendra Rao Ananta wrote:
> On Mon, Aug 14, 2023 at 5:52?PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Mon, Aug 14, 2023, Raghavendra Rao Ananta wrote:
> > > On Mon, Aug 14, 2023 at 4:16?PM Sean Christopherson <seanjc@google.com> wrote:
> > > >
> > > > On Fri, Aug 11, 2023, Raghavendra Rao Ananta wrote:
> > > > > The series is based off of upstream v6.5-rc1.
> > > >
> > > > Lies!  :-)
> > > >
> > > > This is based off one of the kvmarm.git topic branches (I didn't bother to figure
> > > > out which one), not v6.5-rc1.
> > > >
> > > Sorry, what am I missing here? My git log is as follows:
> >
> > Hmm, not sure what's going on.  Maybe I misinterpreted why `git am` was failing?
> > I assumed it was because there were objects in kvmarm that I didn't have locally,
> > and fetching kvmarm allowed am to complete, though with 3-way merges, which IIUC
> > shouldn't have been necessary if I was using the exact same base.  Or maybe I
> > messed up and didn't actually reset to 6.5-rc1.
> >
> > > $ git log --oneline upstream_tlbi_range_v9
> > > 5025857507abe (upstream_tlbi_range_v9) KVM: arm64: Use TLBI
> > > range-based instructions for unmap
> > > 5c0291b99a8fc KVM: arm64: Invalidate the table entries upon a range
> > > 8c46b54d4aaec KVM: arm64: Flush only the memslot after write-protect
> > > 231abaeb7ffc2 KVM: arm64: Implement kvm_arch_flush_remote_tlbs_range()
> > > 5ec291b863309 KVM: arm64: Define kvm_tlb_flush_vmid_range()
> > > 5bcd7a085c34e KVM: arm64: Implement  __kvm_tlb_flush_vmid_range()
> > > ea08f9dff7e5b arm64: tlb: Implement __flush_s2_tlb_range_op()
> > > b3178687947c9 arm64: tlb: Refactor the core flush algorithm of __flush_tlb_range
> > > a4850fa988eef KVM: Move kvm_arch_flush_remote_tlbs_memslot() to common code
> > > 306dc4e6afd37 KVM: Allow range-based TLB invalidation from common code
> > > d02785a0a1e01 KVM: Remove CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
> > > 136fa2d254537 KVM: arm64: Use kvm_arch_flush_remote_tlbs()
> > > e35c68a75170d KVM: Declare kvm_arch_flush_remote_tlbs() globally
> > > 5d592777b9bba KVM: Rename kvm_arch_flush_remote_tlb() to
> > > kvm_arch_flush_remote_tlbs()
> > > 06c2afb862f9d (tag: v6.5-rc1, tag: linux/v6.5-rc1) Linux 6.5-rc1
> > > c192ac7357683 MAINTAINERS 2: Electric Boogaloo
> > > f71f64210d698 Merge tag 'dma-mapping-6.5-2023-07-09' of
> > > git://git.infradead.org/users/hch/dma-mapping
> > > ...
> > >
> > > Isn't the commit, 06c2afb862f9d (06c2afb862f9d (tag: v6.5-rc1, tag:
> > > linux/v6.5-rc1) Linux 6.5-rc1) the 'base' commit?
> >
> > Ya, should be.
> >
> > Either way, even if this is PEBKAC on my end, using --base would be nice, e.g.
> > then you can definitely say it's my fault ;-)
> >
> I'll consider this, and thanks for the confirmation.

Confirmed PEBKAC, I reset to v6.5-rc2, not rc1.  My apologies, and thanks for being
gentle.

