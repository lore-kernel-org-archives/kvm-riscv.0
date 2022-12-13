From: David Matlack <dmatlack@google.com>
Date: Mon, 12 Dec 2022 17:18:35 -0800
Subject: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID
 directly in kvm_mmu_page_role
In-Reply-To: <01cb4882-7a06-176f-7d55-f80cca300ffd@redhat.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com>
 <Y5NvYmxpy6BPkmpW@google.com>
 <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com>
 <Y5dnWgJ0ine55/hN@google.com>
 <01cb4882-7a06-176f-7d55-f80cca300ffd@redhat.com>
Message-ID: <Y5fS69mLXlV+cQlg@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 11:50:29PM +0100, Paolo Bonzini wrote:
> On 12/12/22 18:39, Sean Christopherson wrote:
> > > The notion of address spaces is already existing architecture-neutral
> > > concept in KVM (e.g. see uses of KVM_ADDRESS_SPACE_NUM in
> > > virt/kvm/kvm_main.c), although SMM is the only use-case I'm aware of.
> > 
> > Yes, SMM is currently the only use-case.
> 
> It's possible that in the future Hyper-V VTLs will also have per-level
> protections.  It wouldn't use as_id, but it would likely be recorded in the
> upper byte of the role.
> 
> I'm not sure if Microsoft intends to port those to ARM as well.
> 
> > My preference would be to leave .smm in x86's page role
> 
> What about defining a byte of arch_role and a macro to build it?

Both would work. I went with as_id in the common role since that's how
it's encoded in kvm_memory_slot and because, not matter what, the TDP
MMU still has to handle multiple address spaces. i.e. Even if we hide
SMM away in the role, the TDP MMU still has to access it with some
wrapper e.g.  kvm_mmu_page_as_id() (that would just return 0 outside of
x86). From that perspective, just having as_id directly in the common
role seemed like the cleanest option.

The only way to truly shield the TDP MMU from SMM would be to disallow
it. e.g. Disable the TDP MMU if defined(CONFIG_KVM_SMM), or something
similar. But I don't know enough about how KVM SMM support is used to
say if that's even worth entertaining.

