From: Elliot Berman <quic_eberman@quicinc.com>
Date: Mon, 28 Aug 2023 19:53:26 -0700
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com>
References: <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <253965df-6d80-bbfd-ab01-f9e69b274bf3@quicinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 8/28/2023 3:56 PM, Ackerley Tng wrote:
 > 1. Since the physical memory's representation is the inode and should be
 >     coupled to the virtual machine (as a concept, not struct kvm), should
 >     the binding/coupling be with the file, or the inode?
 >

I've been working on Gunyah's implementation in parallel (not yet posted 
anywhere). Thus far, I've coupled the virtual machine struct to the 
struct file so that I can increment the file refcount when mapping the 
gmem to the virtual machine.

 > 2. Should struct kvm still be bound to the file/inode at gmem file
 >     creation time, since
 >
 >     + struct kvm isn't a good representation of a "virtual machine"
 >     + we currently don't have anything that really represents a "virtual
 >       machine" without hardware support
 >
 >
 > I'd also like to bring up another userspace use case that Google has:
 > re-use of gmem files for rebooting guests when the KVM instance is
 > destroyed and rebuilt.
 >
 > When rebooting a VM there are some steps relating to gmem that are
 > performance-sensitive:
 >
 > a.      Zeroing pages from the old VM when we close a gmem file/inode
 > b. Deallocating pages from the old VM when we close a gmem file/inode
 > c.   Allocating pages for the new VM from the new gmem file/inode
 > d.      Zeroing pages on page allocation
 >
 > We want to reuse the gmem file to save re-allocating pages (b. and c.),
 > and one of the two page zeroing allocations (a. or d.).
 >
 > Binding the gmem file to a struct kvm on creation time means the gmem
 > file can't be reused with another VM on reboot. Also, host userspace is
 > forced to close the gmem file to allow the old VM to be freed.
 >
 > For other places where files pin KVM, like the stats fd pinning vCPUs, I
 > guess that matters less since there isn't much of a penalty to close and
 > re-open the stats fd.

I had a 3rd question that's related to how to wire the gmem up to a 
virtual machine:

I learned of a usecase to implement copy-on-write for gmem. The premise 
would be to have a "golden copy" of the memory that multiple virtual 
machines can map in as RO. If a virtual machine tries to write to those 
pages, they get copied to a virtual machine-specific page that isn't 
shared with other VMs. How do we track those pages?

Thanks,
Elliot

