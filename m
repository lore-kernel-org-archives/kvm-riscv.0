From: Nikunj A. Dadhania <nikunj@amd.com>
Date: Thu, 27 Jul 2023 12:12:11 +0530
Subject: [RFC PATCH v11 00/29] KVM: guest_memfd() and per-page attributes
In-Reply-To: <ZMEsuyqHhp1DAVdR@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <110f1aa0-7fcd-1287-701a-89c2203f0ac2@amd.com> <ZL6uMk/8UeuGj8CP@google.com>
 <2f98a32c-bd3d-4890-b757-4d2f67a3b1a7@amd.com> <ZMEsuyqHhp1DAVdR@google.com>
Message-ID: <66efd7f5-92ed-45ec-0550-ca7f012a6e63@amd.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/26/2023 7:54 PM, Sean Christopherson wrote:
> On Wed, Jul 26, 2023, Nikunj A. Dadhania wrote:
>> On 7/24/2023 10:30 PM, Sean Christopherson wrote:

>>>>   /proc/<qemu pid>/smaps
>>>>   7f528be00000-7f5c8be00000 rw-p 00000000 00:01 26629                      /memfd:memory-backend-memfd-shared (deleted)
>>>>   7f5c90200000-7f5c90220000 rw-s 00000000 00:01 44033                      /memfd:rom-backend-memfd-shared (deleted)
>>>>   7f5c90400000-7f5c90420000 rw-s 00000000 00:01 44032                      /memfd:rom-backend-memfd-shared (deleted)
>>>>   7f5c90800000-7f5c90b7c000 rw-s 00000000 00:01 1025                       /memfd:rom-backend-memfd-shared (deleted)
>>>
>>> This is all expected, and IMO correct.  There are no userspace mappings, and so
>>> not accounting anything is working as intended.
>> Doesn't sound that correct, if 10 SNP guests are running each using 10GB, how
>> would we know who is using 100GB of memory?
> 
> It's correct with respect to what the interfaces show, which is how much memory
> is *mapped* into userspace.
> 
> As I said (or at least tried to say) in my first reply, I am not against exposing
> memory usage to userspace via stats, only that it's not obvious to me that the
> existing VMA-based stats are the most appropriate way to surface this information.

Right, then should we think in the line of creating a VM IOCTL for querying current memory
usage for guest-memfd ?

We could use memcg for statistics, but then memory cgroup can be disabled and so memcg 
isn't really a dependable option.

Do you have some ideas on how to expose the memory usage to the user space other than
VMA-based stats ?

Regards,
Nikunj

