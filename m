From: Anup Patel <anup@brainfault.org>
Date: Wed, 4 Aug 2021 12:46:20 +0530
Subject: [PATCH v19 11/17] RISC-V: KVM: Implement MMU notifiers
In-Reply-To: <38734ad1008a46169dcd89e1ded9ac62@huawei.com>
References: <20210727055450.2742868-1-anup.patel@wdc.com>
 <20210727055450.2742868-12-anup.patel@wdc.com>
 <38734ad1008a46169dcd89e1ded9ac62@huawei.com>
Message-ID: <CAAhSdy2jCQQScw9KMwHy-c7Mgkaq5xB95qmjypJEYbb+0q3_Tg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 3, 2021 at 6:49 PM limingwang (A) <limingwang@huawei.com> wrote:
>
> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c index
> > fa9a4f9b9542..4b294113c63b 100644
> > --- a/arch/riscv/kvm/mmu.c
> > +++ b/arch/riscv/kvm/mmu.c
> > @@ -300,7 +300,8 @@ static void stage2_op_pte(struct kvm *kvm, gpa_t
> > addr,
> >       }
> >  }
> >
> > -static void stage2_unmap_range(struct kvm *kvm, gpa_t start, gpa_t size)
> > +static void stage2_unmap_range(struct kvm *kvm, gpa_t start,
> > +                            gpa_t size, bool may_block)
> >  {
> >       int ret;
> >       pte_t *ptep;
> > @@ -325,6 +326,13 @@ static void stage2_unmap_range(struct kvm *kvm,
> > gpa_t start, gpa_t size)
> >
> >  next:
> >               addr += page_size;
> > +
> > +             /*
> > +              * If the range is too large, release the kvm->mmu_lock
> > +              * to prevent starvation and lockup detector warnings.
> > +              */
> > +             if (may_block && addr < end)
> > +                     cond_resched_lock(&kvm->mmu_lock);
> >       }
> >  }
> >
> > @@ -405,7 +413,6 @@ static int stage2_ioremap(struct kvm *kvm, gpa_t gpa,
> > phys_addr_t hpa,
> >  out:
> >       stage2_cache_flush(&pcache);
> >       return ret;
> > -
> >  }
> >
> >  void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm, @@
> > -547,7 +554,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
> >       spin_lock(&kvm->mmu_lock);
> >       if (ret)
> >               stage2_unmap_range(kvm, mem->guest_phys_addr,
> > -                                mem->memory_size);
> > +                                mem->memory_size, false);
> >       spin_unlock(&kvm->mmu_lock);
> >
> >  out:
> > @@ -555,6 +562,73 @@ int kvm_arch_prepare_memory_region(struct kvm
> > *kvm,
> >       return ret;
> >  }
> >
> > +bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
> > +{
> > +     if (!kvm->arch.pgd)
> > +             return 0;
> > +
> > +     stage2_unmap_range(kvm, range->start << PAGE_SHIFT,
> > +                        (range->end - range->start) << PAGE_SHIFT,
> > +                        range->may_block);
> > +     return 0;
> > +}
> > +
> > +bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range) {
> > +     int ret;
> > +     kvm_pfn_t pfn = pte_pfn(range->pte);
> > +
> > +     if (!kvm->arch.pgd)
> > +             return 0;
> > +
> > +     WARN_ON(range->end - range->start != 1);
> > +
> > +     ret = stage2_map_page(kvm, NULL, range->start << PAGE_SHIFT,
> > +                           __pfn_to_phys(pfn), PAGE_SIZE, true, true);
> > +     if (ret) {
> > +             kvm_err("Failed to map stage2 page (error %d)\n", ret);
> > +             return 1;
> > +     }
>
> Hi, Anup
>
> I think that it is not appropriate to add kvm_err here, because stage2_set_pte function
> may apply for memory based on the pcache parameter. If the value of pcache is NULL,
> stage2_set_pte function considers that there is not enough memory and here an invalid
> error log is generated.
>
> As an example, this error log is printed when a VM is migrating. But finally the VM migration
> is successful. And if the kvm_err is added to the same position in the ARM architecture, the
> same error log is also printed.

Okay, I have converted kvm_err() to kvm_debug(). In the future, we can totally
remove it as well.

Please try riscv_kvm_v20 branch at:
https://github.com/avpatel/linux.git

Regards,
Anup

>
> Mingwang
>
> > +     return 0;
> > +}
> > +
>

