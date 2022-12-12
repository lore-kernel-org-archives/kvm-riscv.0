From: David Matlack <dmatlack@google.com>
Date: Mon, 12 Dec 2022 13:05:57 -0800
Subject: [RFC PATCH 20/37] KVM: x86/mmu: Abstract away computing the max
 mapping level
In-Reply-To: <CANgfPd-6LNdZ42tb0DnC21r1Z5JGR_1Lvvop8RKJJ8hEz+PUDg@mail.gmail.com>
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-21-dmatlack@google.com>
 <CANgfPd-6LNdZ42tb0DnC21r1Z5JGR_1Lvvop8RKJJ8hEz+PUDg@mail.gmail.com>
Message-ID: <CALzav=cashgJPmeKSRQnd_kdYg2EK0G4rygSCt6GaJWSYz3juw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 11:32 AM Ben Gardon <bgardon@google.com> wrote:
>
> On Thu, Dec 8, 2022 at 11:39 AM David Matlack <dmatlack@google.com> wrote:
> >
> > Abstract away kvm_mmu_max_mapping_level(), which is an x86-specific
> > function for computing the max level that a given GFN can be mapped in
> > KVM's page tables. This will be used in a future commit to enable moving
> > the TDP MMU to common code.
> >
> > Provide a default implementation for non-x86 architectures that just
> > returns the max level. This will result in more zapping than necessary
> > when disabling dirty logging (i.e. less than optimal performance) but no
> > correctness issues.
>
> Apologies if you already implemented it in a later patch in this
> series, but would it not at least be possible to port
> host_pfn_mapping_level to common code and check that?
> I'm assuming, though I could be wrong, that all archs map GFNs with at
> most a host page table granularity mapping.
> I suppose that doesn't strictly need to be included in this series,
> but it would be worth addressing in the commit description.

It's not implemented later in this series, but I agree it's something
we should do. In fact, it's worth doing regardless of this series as a
way to share more code across architectures (e.g. KVM/ARM has it's own
version in arch/arm64/kvm/mmu.c:get_user_mapping_size()).

