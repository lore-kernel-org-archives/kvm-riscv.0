From: David Matlack <dmatlack@google.com>
Date: Fri, 9 Dec 2022 09:40:48 -0800
Subject: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID
 directly in kvm_mmu_page_role
In-Reply-To: <Y5NvYmxpy6BPkmpW@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com> <Y5NvYmxpy6BPkmpW@google.com>
Message-ID: <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 9, 2022 at 9:25 AM Oliver Upton <oliver.upton@linux.dev> wrote:
>
> On Fri, Dec 09, 2022 at 10:37:47AM +0800, Yang, Weijiang wrote:
> >
> > On 12/9/2022 3:38 AM, David Matlack wrote:
> > > Rename kvm_mmu_page_role.smm with kvm_mmu_page_role.as_id and use it
> > > directly as the address space ID throughout the KVM MMU code. This
> > > eliminates a needless level of indirection, kvm_mmu_role_as_id(), and
> > > prepares for making kvm_mmu_page_role architecture-neutral.
> > >
> > > Signed-off-by: David Matlack <dmatlack@google.com>
> > > ---
> > >   arch/x86/include/asm/kvm_host.h |  4 ++--
> > >   arch/x86/kvm/mmu/mmu.c          |  6 +++---
> > >   arch/x86/kvm/mmu/mmu_internal.h | 10 ----------
> > >   arch/x86/kvm/mmu/tdp_iter.c     |  2 +-
> > >   arch/x86/kvm/mmu/tdp_mmu.c      | 12 ++++++------
> > >   5 files changed, 12 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > > index aa4eb8cfcd7e..0a819d40131a 100644
> > > --- a/arch/x86/include/asm/kvm_host.h
> > > +++ b/arch/x86/include/asm/kvm_host.h
> > > @@ -348,7 +348,7 @@ union kvm_mmu_page_role {
> > >              * simple shift.  While there is room, give it a whole
> > >              * byte so it is also faster to load it from memory.
> > >              */
> > > -           unsigned smm:8;
> > > +           unsigned as_id:8;
> > >     };
> > >   };
> > > @@ -2056,7 +2056,7 @@ enum {
> > >   # define __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
> > >   # define KVM_ADDRESS_SPACE_NUM 2
> > >   # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
> > > -# define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
> > > +# define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).as_id)
> > >   #else
> > >   # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, 0)
> > >   #endif
> > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > > index 4d188f056933..f375b719f565 100644
> > > --- a/arch/x86/kvm/mmu/mmu.c
> > > +++ b/arch/x86/kvm/mmu/mmu.c
> > > @@ -5056,7 +5056,7 @@ kvm_calc_cpu_role(struct kvm_vcpu *vcpu, const struct kvm_mmu_role_regs *regs)
> > >     union kvm_cpu_role role = {0};
> > >     role.base.access = ACC_ALL;
> > > -   role.base.smm = is_smm(vcpu);
> > > +   role.base.as_id = is_smm(vcpu);
> >
> > I'm not familiar with other architectures, is there similar conception as
> > x86 smm mode?

The notion of address spaces is already existing architecture-neutral
concept in KVM (e.g. see uses of KVM_ADDRESS_SPACE_NUM in
virt/kvm/kvm_main.c), although SMM is the only use-case I'm aware of.
Architectures that do not use multiple address spaces will just leave
as_id is as always 0.

>
> For KVM/arm64:
>
> No, we don't do anything like SMM emulation on x86. Architecturally
> speaking, though, we do have a higher level of privilege typically
> used by firmware on arm64, called EL3.
>
> I'll need to read David's series a bit more closely, but I'm inclined to
> think that the page role is going to be rather arch-specific.

Yes most of the fields are in the arch-specific sub-role. The TDP MMU
only needs to know about the as_id, level, and invalid bits. (See next
patch.)

