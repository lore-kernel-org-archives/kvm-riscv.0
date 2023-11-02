From: Sean Christopherson <seanjc@google.com>
Date: Thu, 2 Nov 2023 10:37:29 -0700
Subject: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <CALzav=eaVc5rzmHwnQr7aotyTKi9Agdte7NAL0NvBeE+f6zYoA@mail.gmail.com>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUFGRyQEuWj4RJS0@google.com> <ZUFzZf-YmCRYP6qo@google.com>
 <CALzav=d9eXZfK=op7A=UftbpuPpUbxqV6CmkqqxxBNuNsUU4nw@mail.gmail.com>
 <6642c379-1023-4716-904f-4bbf076744c2@redhat.com> <ZUPIXt1XzZrriswG@google.com>
 <CALzav=eaVc5rzmHwnQr7aotyTKi9Agdte7NAL0NvBeE+f6zYoA@mail.gmail.com>
Message-ID: <ZUPeWTdbMhvMO4QL@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 02, 2023, David Matlack wrote:
> On Thu, Nov 2, 2023 at 9:03?AM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Thu, Nov 02, 2023, Paolo Bonzini wrote:
> > > On 10/31/23 23:39, David Matlack wrote:
> > > > > > Maybe can you sketch out how you see this proposal being extensible to
> > > > > > using guest_memfd for shared mappings?
> > > > > For in-place conversions, e.g. pKVM, no additional guest_memfd is needed.  What's
> > > > > missing there is the ability to (safely) mmap() guest_memfd, e.g. KVM needs to
> > > > > ensure there are no outstanding references when converting back to private.
> > > > >
> > > > > For TDX/SNP, assuming we don't find a performant and robust way to do in-place
> > > > > conversions, a second fd+offset pair would be needed.
> > > > Is there a way to support non-in-place conversions within a single guest_memfd?
> > >
> > > For TDX/SNP, you could have a hook from KVM_SET_MEMORY_ATTRIBUTES to guest
> > > memory.  The hook would invalidate now-private parts if they have a VMA,
> > > causing a SIGSEGV/EFAULT if the host touches them.
> > >
> > > It would forbid mappings from multiple gfns to a single offset of the
> > > guest_memfd, because then the shared vs. private attribute would be tied to
> > > the offset.  This should not be a problem; for example, in the case of SNP,
> > > the RMP already requires a single mapping from host physical address to
> > > guest physical address.
> >
> > I don't see how this can work.  It's not a M:1 scenario (where M is multiple gfns),
> > it's a 1:N scenario (wheren N is multiple offsets).  The *gfn* doesn't change on
> > a conversion, what needs to change to do non-in-place conversion is the pfn, which
> > is effectively the guest_memfd+offset pair.
> >
> > So yes, we *could* support non-in-place conversions within a single guest_memfd,
> > but it would require a second offset,
> 
> Why can't KVM free the existing page at guest_memfd+offset and
> allocate a new one when doing non-in-place conversions?

Oh, I see what you're suggesting.  Eww.

It's certainly possible, but it would largely defeat the purpose of why we are
adding guest_memfd in the first place.

For TDX and SNP, the goal is to provide a simple, robust mechanism for isolating
guest private memory so that it's all but impossible for the host to access private
memory.  As things stand, memory for a given guest_memfd is either private or shared
(assuming we support a second guest_memfd per memslot).  I.e. there's no need to
track whether a given page/folio in the guest_memfd is private vs. shared.

We could use memory attributes, but that further complicates things when intrahost
migration (and potentially other multi-user scenarios) comes along, i.e. when KVM
supports linking multiple guest_memfd files to a single inode.  We'd have to ensure
that all "struct kvm" instances have identical PRIVATE attributes for a given
*offset* in the inode.  I'm not even sure how feasible that is for intrahost
migration, and that's the *easy* case, because IIRC it's already a hard requirement
that the source and destination have identical gnf=>guest_memfd bindings, i.e. KVM
can somewhat easily reason about gfn attributes.

But even then, that only helps with the actual migration of the VM, e.g. we'd still
have to figure out how to deal with .mmap() and other shared vs. private actions
when linking a new guest_memfd file against an existing inode.

I haven't seen the pKVM patches for supporting .mmap(), so maybe this is already
a solved problem, but I'd honestly be quite surprised if it all works correctly
if/when KVM supports multiple files per inode.

And I don't see what value non-in-place conversions would add.  The value added
by in-place conversions, aside from the obvious preservation of data, which isn't
relevant to TDX/SNP, is that it doesn't require freeing and reallocating memory
to avoid double-allocating for private vs. shared.  That's especialy quite nice
when hugepages are being used because reconstituing a hugepage "only" requires
zapping SPTEs.

But if KVM is freeing the private page, it's the same as punching a hole, probably
quite literally, when mapping the gfn as shared.  In every way I can think of, it's
worse.  E.g. it's more complex for KVM, and the PUNCH_HOLE => allocation operations
must be serialized.

Regarding double-allocating, I really, really think we should solve that in the
guest.  I.e. teach Linux-as-a-guest to aggressively convert at 2MiB granularity
and avoid 4KiB conversions.  4KiB conversions aren't just a memory utilization
problem, they're also a performance problem, e.g. shatters hugepages (which KVM
doesn't yet support recovering) and increases TLB pressure for both stage-1 and
stage-2 mappings.

