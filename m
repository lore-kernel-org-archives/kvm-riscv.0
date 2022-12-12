From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 12 Dec 2022 23:50:29 +0100
Subject: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID
 directly in kvm_mmu_page_role
In-Reply-To: <Y5dnWgJ0ine55/hN@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com>
 <Y5NvYmxpy6BPkmpW@google.com>
 <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com>
 <Y5dnWgJ0ine55/hN@google.com>
Message-ID: <01cb4882-7a06-176f-7d55-f80cca300ffd@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/12/22 18:39, Sean Christopherson wrote:
>> The notion of address spaces is already existing architecture-neutral
>> concept in KVM (e.g. see uses of KVM_ADDRESS_SPACE_NUM in
>> virt/kvm/kvm_main.c), although SMM is the only use-case I'm aware of.
> 
> Yes, SMM is currently the only use-case.

It's possible that in the future Hyper-V VTLs will also have per-level 
protections.  It wouldn't use as_id, but it would likely be recorded in 
the upper byte of the role.

I'm not sure if Microsoft intends to port those to ARM as well.

> My preference would be to leave .smm in x86's page role

What about defining a byte of arch_role and a macro to build it?


> Unless I'm missing something, e.g. a need to map GPAs differently for
> SMM vs. non-SMM, SMM could have been implemented with a simple flag
> in a memslot to mark the memslot as SMM-only.

Unfortunately not, because there can be another region (for example 
video RAM at 0A0000h) underneath SMRAM.

In fact, KVM_MEM_X86_SMRAM was the first idea.  It was uglier than 
multiple address spaces 
(https://lore.kernel.org/lkml/1431084034-8425-1-git-send-email-pbonzini at redhat.com). 
  In retrospect there were probably ways to mix the best of the two 
designs, but it wasn't generic enough.

> And separate address spaces become truly nasty if the CPU can access multiple
> protected regions, e.g. if the CPU can access type X and type Y at the same time,
> then there would need to be memslots for "regular", X, Y, and X+Y.

Without a usecase that's hard to say.  It's just as possible that there 
would be a natural hierarchy of levels.

Paolo


