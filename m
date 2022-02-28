From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 28 Feb 2022 11:46:01 -0800
Subject: [PATCH v4 02/13] KVM: arm64: Introduce KVM_CAP_ARM_REG_SCOPE
In-Reply-To: <YhkfW76Rit6DYs9T@google.com>
References: <20220224172559.4170192-1-rananta@google.com>
 <20220224172559.4170192-3-rananta@google.com>
 <Yhh6cI4P5VEMitkg@google.com>
 <CAJHc60zn0df4e-TXaeKEgkej4G34VzbFdQUpX_6ii_XwTNY2tg@mail.gmail.com>
 <YhkfW76Rit6DYs9T@google.com>
Message-ID: <CAJHc60z=qmz_s1G+LkNRWGumZOrtgzYmRM78j=3VpMi08Ox4Zg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 25, 2022 at 10:26 AM Oliver Upton <oupton@google.com> wrote:
>
> On Fri, Feb 25, 2022 at 09:34:35AM -0800, Raghavendra Rao Ananta wrote:
> > Hey Oliver,
> >
> > On Thu, Feb 24, 2022 at 10:43 PM Oliver Upton <oupton@google.com> wrote:
> > >
> > > On Thu, Feb 24, 2022 at 05:25:48PM +0000, Raghavendra Rao Ananta wrote:
> > > > KVM_[GET|SET]_ONE_REG act on per-vCPU basis. Currently certain
> > > > ARM64 registers, such as KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_[1|2],
> > > > are accessed via this interface even though the effect that
> > > > they have are really per-VM. As a result, userspace could just
> > > > waste cycles to read/write the same information for every vCPU
> > > > that it spawns, only to realize that there's absolutely no change
> > > > in the VM's state. The problem gets worse in proportion to the
> > > > number of vCPUs created.
> > > >
> > > > As a result, to avoid this redundancy, introduce the capability
> > > > KVM_CAP_ARM_REG_SCOPE. If enabled, KVM_GET_REG_LIST will advertise
> > > > the registers that are VM-scoped by dynamically modifying the
> > > > register encoding. KVM_REG_ARM_SCOPE_* helper macros are introduced
> > > > to decode the same. By learning this, userspace can access such
> > > > registers only once.
> > > >
> > > > Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> > > > ---
> > > >  Documentation/virt/kvm/api.rst    | 16 ++++++++++++++++
> > > >  arch/arm64/include/asm/kvm_host.h |  3 +++
> > > >  arch/arm64/include/uapi/asm/kvm.h |  6 ++++++
> > > >  arch/arm64/kvm/arm.c              | 13 +++++++------
> > > >  include/uapi/linux/kvm.h          |  1 +
> > > >  5 files changed, 33 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > > > index a4267104db50..7e7b3439f540 100644
> > > > --- a/Documentation/virt/kvm/api.rst
> > > > +++ b/Documentation/virt/kvm/api.rst
> > > > @@ -7561,3 +7561,19 @@ The argument to KVM_ENABLE_CAP is also a bitmask, and must be a subset
> > > >  of the result of KVM_CHECK_EXTENSION.  KVM will forward to userspace
> > > >  the hypercalls whose corresponding bit is in the argument, and return
> > > >  ENOSYS for the others.
> > > > +
> > > > +8.34 KVM_CAP_ARM_REG_SCOPE
> > > > +--------------------------
> > > > +
> > > > +:Architectures: arm64
> > > > +
> > > > +The capability, if enabled, amends the existing register encoding
> > > > +with additional information to the userspace if a particular register
> > > > +is scoped per-vCPU or per-VM via KVM_GET_REG_LIST. KVM provides
> > > > +KVM_REG_ARM_SCOPE_* helper macros to decode the same. Userspace can
> > > > +use this information from the register encoding to access a VM-scopped
> > > > +regiser only once, as opposed to accessing it for every vCPU for the
> > > > +same effect.
> > > > +
> > >
> > > Could you describe the encoding changes in 4.68 'KVM_SET_ONE_REG', along
> > > with the other ARM encoding details?
> > >
> > > > +On the other hand, if the capability is disabled, all the registers
> > > > +remain vCPU-scopped by default, retaining backward compatibility.
> > >
> > > typo: vCPU-scoped
> > >
> > > That said, I don't believe we need to document behavior if the CAP is
> > > disabled, as the implicated ioctls should continue to work the same.
> > >
> > Sure, I'll address the above two Doc comments.
> > > > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > > > index 5bc01e62c08a..8132de6bd718 100644
> > > > --- a/arch/arm64/include/asm/kvm_host.h
> > > > +++ b/arch/arm64/include/asm/kvm_host.h
> > > > @@ -136,6 +136,9 @@ struct kvm_arch {
> > > >
> > > >       /* Memory Tagging Extension enabled for the guest */
> > > >       bool mte_enabled;
> > > > +
> > > > +     /* Register scoping enabled for KVM registers */
> > > > +     bool reg_scope_enabled;
> > > >  };
> > > >
> > > >  struct kvm_vcpu_fault_info {
> > > > diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> > > > index b3edde68bc3e..c35447cc0e0c 100644
> > > > --- a/arch/arm64/include/uapi/asm/kvm.h
> > > > +++ b/arch/arm64/include/uapi/asm/kvm.h
> > > > @@ -199,6 +199,12 @@ struct kvm_arm_copy_mte_tags {
> > > >  #define KVM_REG_ARM_COPROC_MASK              0x000000000FFF0000
> > > >  #define KVM_REG_ARM_COPROC_SHIFT     16
> > > >
> > > > +/* Defines if a KVM register is one per-vCPU or one per-VM */
> > > > +#define KVM_REG_ARM_SCOPE_MASK               0x0000000010000000
> > > > +#define KVM_REG_ARM_SCOPE_SHIFT              28
> > >
> > > Thinking about the advertisement of VM- and vCPU-scoped registers, this
> > > could be generally useful. Might it make sense to add such an encoding
> > > to the arch-generic register definitions?
> > >
> > > If that is the case, we may want to snap up a few more bits (a nybble)
> > > for future expansion.
> > >
> > That's a great idea! But I wonder if we'll get a push-back since there
> > are no users of it in other arch(s) yet. Not sure if there was any
> > need/discussion regarding the same, but I'm happy to share a patch for
> > the same if you sense that there's a strong potential for the patch.
> >
>
> I'm unsure if this is actually of interest to other architectures, it
> just doesn't seem ARM-specific so we should probably raise the question
> so we only grab these bits once.
>
I've CC'ed a few more arch-specific kvm lists for
comments/concerns/suggestions on the idea (feel free to add any other
relevant groups/persons). Based on the response, I can start an
independent RFC series for the same.

> > > > +#define KVM_REG_ARM_SCOPE_VCPU               0
> > > > +#define KVM_REG_ARM_SCOPE_VM         1
> > > > +
> > > >  /* Normal registers are mapped as coprocessor 16. */
> > > >  #define KVM_REG_ARM_CORE             (0x0010 << KVM_REG_ARM_COPROC_SHIFT)
> > > >  #define KVM_REG_ARM_CORE_REG(name)   (offsetof(struct kvm_regs, name) / sizeof(__u32))
> > > > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > > > index ecc5958e27fe..107977c82c6c 100644
> > > > --- a/arch/arm64/kvm/arm.c
> > > > +++ b/arch/arm64/kvm/arm.c
> > > > @@ -81,26 +81,26 @@ int kvm_arch_check_processor_compat(void *opaque)
> > > >  int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
> > > >                           struct kvm_enable_cap *cap)
> > > >  {
> > > > -     int r;
> > > > +     int r = 0;
> > > >
> > > >       if (cap->flags)
> > > >               return -EINVAL;
> > > >
> > > >       switch (cap->cap) {
> > > >       case KVM_CAP_ARM_NISV_TO_USER:
> > > > -             r = 0;
> > > >               kvm->arch.return_nisv_io_abort_to_user = true;
> > > >               break;
> > > >       case KVM_CAP_ARM_MTE:
> > > >               mutex_lock(&kvm->lock);
> > > > -             if (!system_supports_mte() || kvm->created_vcpus) {
> > > > +             if (!system_supports_mte() || kvm->created_vcpus)
> > > >                       r = -EINVAL;
> > > > -             } else {
> > > > -                     r = 0;
> > > > +             else
> > > >                       kvm->arch.mte_enabled = true;
> > > > -             }
> > > >               mutex_unlock(&kvm->lock);
> > > >               break;
> > >
> > > Hmm.. these all look like cleanups. If you want to propose these, could
> > > you do it in a separate patch?
> > >
> > Ahh, I thought I could squeeze it in. But sure, I can separate it out.
> > > > +     case KVM_CAP_ARM_REG_SCOPE:
> > > > +             WRITE_ONCE(kvm->arch.reg_scope_enabled, true);
> > > > +             break;
> > > >       default:
> > > >               r = -EINVAL;
> > > >               break;
> > > > @@ -209,6 +209,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> > > >       case KVM_CAP_SET_GUEST_DEBUG:
> > > >       case KVM_CAP_VCPU_ATTRIBUTES:
> > > >       case KVM_CAP_PTP_KVM:
> > > > +     case KVM_CAP_ARM_REG_SCOPE:
> > >
> > > It is a bit odd to advertise a capability (and allow userspace to enable
> > > it), despite the fact that the feature itself hasn't yet been
> > > implemented.
> > >
> > > Is it possible to fold the feature in to the patch that exposes it to
> > > userspace? Otherwise, you could punt advertisement of the CAP until it
> > > is actually implemented in kernel.
> > >
> > Well, I didn't want to complicate the patch, but technically the
> > feature is available with this patch, including all the CAP and macro
> > definitions. Userspace can still decode the scope information, only
> > that no registers are added yet, which is done in the next patch. So,
> > the userspace can still remain the same between this and the next
> > patch.
>
> But the series isn't cleanly bisectable. There will exist commits in
> history that report KVM_CAP_ARM_REG_SCOPE as implemented even though
> that is not actually the case. You should really only advertise support
> to userspace when the feature is implemented.
>
> Defining kvm->arch.reg_scope_enabled can be done earlier so you have a
> bit to test and guard all of the new code, and only expose the CAP in
> the last patch of the series.
>
Got it. I'll arrange that in the next spin.
> Also, as an FYI Marc has a patch that I'll be picking up in my own
> series which uses bits instead of bools to keep track of certain
> VM-wide features:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?h=kvm-arm64/mmu/guest-MMIO-guard&id=7dd0a13a4217b870f2e83cdc6045e5ce482a5340
>
Thanks. This is great. I can steal a couple of bits and implement the
flags introduced in the series here.
> Marc, if neither of our series land in 5.18 could you at least submit
> this patch in preparation? Should keep conflicts minimal that way.
>
> Thanks!
>
> --
> Oliver

Thank you.

Raghavendra

