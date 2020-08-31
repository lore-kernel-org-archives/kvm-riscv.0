From: Jiangyifei <jiangyifei@huawei.com>
Date: Mon, 31 Aug 2020 02:39:35 +0000
Subject: [PATCH RFC 2/2] target/kvm: Add interfaces needed for log dirty
In-Reply-To: <CAAhSdy36ZCubU-1+WzjMzBaR+RipgEhvRqd9AT+28=99-EUDaQ@mail.gmail.com>
References: <20200827082251.1591-1-jiangyifei@huawei.com>
 <20200827082251.1591-3-jiangyifei@huawei.com>
 <CAAhSdy36ZCubU-1+WzjMzBaR+RipgEhvRqd9AT+28=99-EUDaQ@mail.gmail.com>
Message-ID: <3915816D913D8241BB43E932213F57D4ADD8F34F@dggemm525-mbs.china.huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Anup Patel [mailto:anup at brainfault.org]
> Sent: Friday, August 28, 2020 12:54 PM
> To: Jiangyifei <jiangyifei@huawei.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>; Palmer Dabbelt
> <palmer@dabbelt.com>; Albert Ou <aou@eecs.berkeley.edu>; Anup Patel
> <anup.patel@wdc.com>; Alistair Francis <alistair.francis@wdc.com>; Atish
> Patra <atish.patra@wdc.com>; deepa.kernel at gmail.com;
> kvm-riscv at lists.infradead.org; KVM General <kvm@vger.kernel.org>;
> linux-riscv <linux-riscv@lists.infradead.org>; linux-kernel at vger.kernel.org List
> <linux-kernel@vger.kernel.org>; Zhangxiaofeng (F)
> <victor.zhangxiaofeng@huawei.com>; Wubin (H) <wu.wubin@huawei.com>;
> Zhanghailiang <zhang.zhanghailiang@huawei.com>; dengkai (A)
> <dengkai1@huawei.com>; yinyipeng <yinyipeng1@huawei.com>
> Subject: Re: [PATCH RFC 2/2] target/kvm: Add interfaces needed for log dirty
> 
> On Thu, Aug 27, 2020 at 1:54 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
> >
> > Add two interfaces of log dirty for kvm_main.c, and detele the
> > interface kvm_vm_ioctl_get_dirty_log which is redundantly defined.
> >
> > CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT is added in defconfig.
> >
> > Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> > Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> > ---
> >  arch/riscv/configs/defconfig |  1 +
> >  arch/riscv/kvm/Kconfig       |  1 +
> >  arch/riscv/kvm/mmu.c         | 43
> ++++++++++++++++++++++++++++++++++++
> >  arch/riscv/kvm/vm.c          |  6 -----
> >  4 files changed, 45 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/riscv/configs/defconfig
> > b/arch/riscv/configs/defconfig index d36e1000bbd3..857d799672c2 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -19,6 +19,7 @@ CONFIG_SOC_VIRT=y
> >  CONFIG_SMP=y
> >  CONFIG_VIRTUALIZATION=y
> >  CONFIG_KVM=y
> > +CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
> >  CONFIG_HOTPLUG_CPU=y
> >  CONFIG_MODULES=y
> >  CONFIG_MODULE_UNLOAD=y
> > diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig index
> > 2356dc52ebb3..91fcffc70e5d 100644
> > --- a/arch/riscv/kvm/Kconfig
> > +++ b/arch/riscv/kvm/Kconfig
> > @@ -26,6 +26,7 @@ config KVM
> >         select KVM_MMIO
> >         select HAVE_KVM_VCPU_ASYNC_IOCTL
> >         select SRCU
> > +       select KVM_GENERIC_DIRTYLOG_READ_PROTECT
> >         help
> >           Support hosting virtualized guest machines.
> >
> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c index
> > 88bce80ee983..df2a470c25e4 100644
> > --- a/arch/riscv/kvm/mmu.c
> > +++ b/arch/riscv/kvm/mmu.c
> > @@ -358,6 +358,43 @@ void stage2_wp_memory_region(struct kvm *kvm,
> int slot)
> >         kvm_flush_remote_tlbs(kvm);
> >  }
> >
> > +/**
> > + * kvm_mmu_write_protect_pt_masked() - write protect dirty pages
> > + * @kvm:    The KVM pointer
> > + * @slot:   The memory slot associated with mask
> > + * @gfn_offset: The gfn offset in memory slot
> > + * @mask:   The mask of dirty pages at offset 'gfn_offset' in this memory
> > + *      slot to be write protected
> > + *
> > + * Walks bits set in mask write protects the associated pte's. Caller
> > +must
> > + * acquire kvm_mmu_lock.
> > + */
> > +static void kvm_mmu_write_protect_pt_masked(struct kvm *kvm,
> > +        struct kvm_memory_slot *slot,
> > +        gfn_t gfn_offset, unsigned long mask) {
> > +    phys_addr_t base_gfn = slot->base_gfn + gfn_offset;
> > +    phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
> > +    phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
> > +
> > +    stage2_wp_range(kvm, start, end); }
> > +
> > +/*
> > + * kvm_arch_mmu_enable_log_dirty_pt_masked - enable dirty logging for
> > +selected
> > + * dirty pages.
> > + *
> > + * It calls kvm_mmu_write_protect_pt_masked to write protect selected
> > +pages to
> > + * enable dirty logging for them.
> > + */
> > +void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
> > +        struct kvm_memory_slot *slot,
> > +        gfn_t gfn_offset, unsigned long mask) {
> > +    kvm_mmu_write_protect_pt_masked(kvm, slot, gfn_offset, mask); }
> > +
> > +
> >  int stage2_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
> >                    unsigned long size, bool writable)  { @@ -433,6
> > +470,12 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct
> > kvm_memory_slot *memslot)  {  }
> >
> > +void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
> > +                                       struct kvm_memory_slot
> > +*memslot) {
> > +       kvm_flush_remote_tlbs(kvm);
> > +}
> > +
> >  void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot
> > *free)  {  } diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> > index 4f2498198cb5..f7405676903b 100644
> > --- a/arch/riscv/kvm/vm.c
> > +++ b/arch/riscv/kvm/vm.c
> > @@ -12,12 +12,6 @@
> >  #include <linux/uaccess.h>
> >  #include <linux/kvm_host.h>
> >
> > -int kvm_vm_ioctl_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log
> > *log) -{
> > -       /* TODO: To be added later. */
> > -       return -ENOTSUPP;
> > -}
> > -
> >  int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)  {
> >         int r;
> > --
> > 2.19.1
> >
> >
> 
> I already have a similar change as part of v14 KVM RISC-V series.
> 
> Let us coordinate better. Please let us know in-advance for any KVM RISC-V
> feature you plan to work on. Otherwise, this leads to efforts wasted at your
> end or at our end.
> 
> Regards,
> Anup

Hi Anup,

Thanks for accepting our patches.

In the next few weeks we plan to work on the following:
1. memory reverse mapping (rmap), related to migration.
2. irqfd.
3. implmentaion related to the dedicated clock event source proposal.

Besides, we are aware of that you are working on irq chip emulation in KVM. Meanwhile, our implementaiton of irqfd and the clock event source has dependency on the irq chip and we may well modify the irq chip emulation code. So could you share with us any ideas, plans or progress regarding your work since there might be potential collision?

Let's stay in touch in the long run and coodinate better. BTW, could you share with us if there's any regular discussion sessions focused on RISC-V KVM?

Regards,
Yifei
