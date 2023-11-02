From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 2 Nov 2023 16:48:41 +0100
Subject: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <CALzav=d9eXZfK=op7A=UftbpuPpUbxqV6CmkqqxxBNuNsUU4nw@mail.gmail.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-17-seanjc@google.com> <ZUFGRyQEuWj4RJS0@google.com>
 <ZUFzZf-YmCRYP6qo@google.com>
 <CALzav=d9eXZfK=op7A=UftbpuPpUbxqV6CmkqqxxBNuNsUU4nw@mail.gmail.com>
Message-ID: <6642c379-1023-4716-904f-4bbf076744c2@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/31/23 23:39, David Matlack wrote:
>>> Maybe can you sketch out how you see this proposal being extensible to
>>> using guest_memfd for shared mappings?
>> For in-place conversions, e.g. pKVM, no additional guest_memfd is needed.  What's
>> missing there is the ability to (safely) mmap() guest_memfd, e.g. KVM needs to
>> ensure there are no outstanding references when converting back to private.
>>
>> For TDX/SNP, assuming we don't find a performant and robust way to do in-place
>> conversions, a second fd+offset pair would be needed.
> Is there a way to support non-in-place conversions within a single guest_memfd?

For TDX/SNP, you could have a hook from KVM_SET_MEMORY_ATTRIBUTES to 
guest memory.  The hook would invalidate now-private parts if they have 
a VMA, causing a SIGSEGV/EFAULT if the host touches them.

It would forbid mappings from multiple gfns to a single offset of the 
guest_memfd, because then the shared vs. private attribute would be tied 
to the offset.  This should not be a problem; for example, in the case 
of SNP, the RMP already requires a single mapping from host physical 
address to guest physical address.

Paolo


