From: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 Sep 2023 12:12:14 -0700
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <253965df-6d80-bbfd-ab01-f9e69b274bf3@quicinc.com>
References: <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com> <253965df-6d80-bbfd-ab01-f9e69b274bf3@quicinc.com>
Message-ID: <ZQNbDt6vqwC4gZmi@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 28, 2023, Elliot Berman wrote:
> I had a 3rd question that's related to how to wire the gmem up to a virtual
> machine:
> 
> I learned of a usecase to implement copy-on-write for gmem. The premise
> would be to have a "golden copy" of the memory that multiple virtual
> machines can map in as RO. If a virtual machine tries to write to those
> pages, they get copied to a virtual machine-specific page that isn't shared
> with other VMs. How do we track those pages?

The answer is going to be gunyah specific, because gmem itself isn't designed to
provide a virtualization layer ("virtual" in the virtual memory sense, not in the
virtual machine sense).  Like any other CoW implementation, the RO page would need
to be copied to a different physical page, and whatever layer translates gfns
to physical pages would need to be updated.  E.g. in gmem terms, allocate a new
gmem page/instance and update the gfn=>gmem[offset] translation in KVM/gunyah.

For VMA-based memory, that translation happens in the primary MMU, and is largely
transparent to KVM (or any other secondary MMU).  E.g. the primary MMU works with
the backing store (if necessary) to allocate a new page and do the copy, notifies
secondary MMUs, zaps the old PTE(s), and then installs the new PTE(s).  KVM/gunyah
just needs to react to the mmu_notifier event, e.g. zap secondary MMU PTEs, and
then KVM/gunyah naturally gets the new, writable page/PTE when following the host
virtual address, e.g. via gup().

The downside of eliminating the middle-man (primary MMU) from gmem is that the
"owner" (KVM or gunyah) is now responsible for these types of operations.  For some
things, e.g. page migration, it's actually easier in some ways, but for CoW it's
quite a bit more work for KVM/gunyah because KVM/gunyah now needs to do things
that were previously handled by the primary MMU.

In KVM, assuming no additional support in KVM, doing CoW would mean modifying
memslots to redirect the gfn from the RO page to the writable page.  For a variety
of reasons, that would be _extremely_ expensive in KVM, but still possible.  If
there were a strong use case for supporting CoW with KVM+gmem, then I suspect that
we'd probably implement new KVM uAPI of some form to provide reasonable performance.

But I highly doubt we'll ever do that, because one of core tenets of KVM+gmem is
to isolate guest memory from the rest of the world, and especially from host
userspace, and that just doesn't mesh well with CoW'd memory being shared across
multiple VMs.

