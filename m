From: Sean Christopherson <seanjc@google.com>
Date: Wed, 29 Nov 2023 14:40:19 -0800
Subject: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
In-Reply-To: <81628606-ca9b-866f-5e71-91001e856871@suse.cz>
References: <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com>
 <ZUJVfCkIYYFp5VwG@google.com> <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
 <ZUJ-cJfofk2d_I0B@google.com> <4ca2253d-276f-43c5-8e9f-0ded5d5b2779@redhat.com>
 <ZULSkilO-tdgDGyT@google.com> <CABgObfbq_Hg0B=jvsSDqYH3CSpX+RsxfwB-Tc-eYF4uq2Qw9cg@mail.gmail.com>
 <ZUPCWfO1iO77-KDA@google.com> <CABgObfa=DH7FySBviF63OS9sVog_wt-AqYgtUAGKqnY5Bizivw@mail.gmail.com>
 <81628606-ca9b-866f-5e71-91001e856871@suse.cz>
Message-ID: <ZWe90784ek9VvHa5@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 27, 2023, Vlastimil Babka wrote:
> On 11/2/23 16:46, Paolo Bonzini wrote:
> > On Thu, Nov 2, 2023 at 4:38?PM Sean Christopherson <seanjc@google.com> wrote:
> >> Actually, looking that this again, there's not actually a hard dependency on THP.
> >> A THP-enabled kernel _probably_  gives a higher probability of using hugepages,
> >> but mostly because THP selects COMPACTION, and I suppose because using THP for
> >> other allocations reduces overall fragmentation.
> > 
> > Yes, that's why I didn't even bother enabling it unless THP is
> > enabled, but it makes even more sense to just try.
> > 
> >> So rather than honor KVM_GUEST_MEMFD_ALLOW_HUGEPAGE iff THP is enabled, I think
> >> we should do the below (I verified KVM can create hugepages with THP=n).  We'll
> >> need another capability, but (a) we probably should have that anyways and (b) it
> >> provides a cleaner path to adding PUD-sized hugepage support in the future.
> > 
> > I wonder if we need KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE though. This
> > should be a generic kernel API and in fact the sizes are available in
> > a not-so-friendly format in /sys/kernel/mm/hugepages.
> > 
> > We should just add /sys/kernel/mm/hugepages/sizes that contains
> > "2097152 1073741824" on x86 (only the former if 1G pages are not
> > supported).
> > 
> > Plus: is this the best API if we need something else for 1G pages?
> > 
> > Let's drop *this* patch and proceed incrementally. (Again, this is
> > what I want to do with this final review: identify places that are
> > stil sticky, and don't let them block the rest).
> > 
> > Coincidentially we have an open spot next week at plumbers. Let's
> > extend Fuad's section to cover more guestmem work.
> 
> Hi,
> 
> was there any outcome wrt this one?

No, we punted on hugepage support for the initial guest_memfd merge.  We definitely
plan on adding hugeapge support sooner than later, but we haven't yet agreed on
exactly what that will look like.

> Based on my experience with THP's it would be best if userspace didn't have
> to opt-in, nor care about the supported size. If the given size is unaligned,
> provide a mix of large pages up to an aligned size, and for the rest fallback
> to base pages, which should be better than -EINVAL on creation (is it
> possible with the current implementation? I'd hope so so?).

guest_memfd serves a different use case than THP.  For modern VMs, and especially
for slice-of-hardware VMs that are one of the main targets for guest_memfd, if not
_the_ main target, guest memory should _always_ be backed by hugepages in the
physical domain.  The actual guest mappings might not be huge, e.g. x86 needs to
do partial mappings to skip over (legacy) memory holes, but KVM already gracefully
handles that.

In other words, for most guest_memfd use cases, if userspace wants hugepages but
KVM can't provide hugepages, then it is much more desirable to return an error
than to silently fall back to small pages.

I 100% agree that having to opt-in is suboptimal, but IMO providing "error on an
incompatible configuration" semantics without requiring userspace to opt-in is an
even worse experience for userspace.

> A way to opt-out from huge pages could be useful although there's always the
> risk of some initial troubles resulting in various online sources cargo-cult
> recommending to opt-out forever.

