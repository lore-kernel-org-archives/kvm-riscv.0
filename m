From: David Matlack <dmatlack@google.com>
Date: Tue, 31 Oct 2023 11:24:07 -0700
Subject: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <20231027182217.3615211-17-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-17-seanjc@google.com>
Message-ID: <ZUFGRyQEuWj4RJS0@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-10-27 11:21 AM, Sean Christopherson wrote:
> Introduce an ioctl(), KVM_CREATE_GUEST_MEMFD, to allow creating file-based
> memory that is tied to a specific KVM virtual machine and whose primary
> purpose is to serve guest memory.
> 
> A guest-first memory subsystem allows for optimizations and enhancements
> that are kludgy or outright infeasible to implement/support in a generic
> memory subsystem.  With guest_memfd, guest protections and mapping sizes
> are fully decoupled from host userspace mappings.   E.g. KVM currently
> doesn't support mapping memory as writable in the guest without it also
> being writable in host userspace, as KVM's ABI uses VMA protections to
> define the allow guest protection.  Userspace can fudge this by
> establishing two mappings, a writable mapping for the guest and readable
> one for itself, but that?s suboptimal on multiple fronts.
> 
> Similarly, KVM currently requires the guest mapping size to be a strict
> subset of the host userspace mapping size, e.g. KVM doesn?t support
> creating a 1GiB guest mapping unless userspace also has a 1GiB guest
> mapping.  Decoupling the mappings sizes would allow userspace to precisely
> map only what is needed without impacting guest performance, e.g. to
> harden against unintentional accesses to guest memory.
> 
> Decoupling guest and userspace mappings may also allow for a cleaner
> alternative to high-granularity mappings for HugeTLB, which has reached a
> bit of an impasse and is unlikely to ever be merged.
> 
> A guest-first memory subsystem also provides clearer line of sight to
> things like a dedicated memory pool (for slice-of-hardware VMs) and
> elimination of "struct page" (for offload setups where userspace _never_
> needs to mmap() guest memory).

All of these use-cases involve using guest_memfd for shared pages, but
this entire series sets up KVM to only use guest_memfd for private
pages.

For example, the per-page attributes are a property of a KVM VM, not the
underlying guest_memfd. So that implies we will need separate
guest_memfds for private and shared pages. But a given memslot can have
a mix of private and shared pages. So that implies a memslot will need
to support 2 guest_memfds? But the UAPI only allows 1 and uses the HVA
for shared mappings.

My initial reaction after reading through this series is that the
per-page private/shared should be a property of the guest_memfd, not the
VM. Maybe it would even be cleaner in the long-run to make all memory
attributes a property of the guest_memfd. That way we can scope the
support to only guest_memfds and not have to worry about making per-page
attributes work with "legacy" HVA-based memslots.

Maybe can you sketch out how you see this proposal being extensible to
using guest_memfd for shared mappings?

