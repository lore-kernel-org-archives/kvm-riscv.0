From: Sean Christopherson <seanjc@google.com>
Date: Fri, 12 Apr 2024 07:54:22 -0700
Subject: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
In-Reply-To: <86jzl2sovz.wl-maz@kernel.org>
References: <20240405115815.3226315-1-pbonzini@redhat.com> <20240405115815.3226315-2-pbonzini@redhat.com>
 <20240412104408.GA27645@willie-the-truck> <86jzl2sovz.wl-maz@kernel.org>
Message-ID: <ZhlLHtfeSHk9gRRO@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 12, 2024, Marc Zyngier wrote:
> On Fri, 12 Apr 2024 11:44:09 +0100, Will Deacon <will@kernel.org> wrote:
> > On Fri, Apr 05, 2024 at 07:58:12AM -0400, Paolo Bonzini wrote:
> > Also, if you're in the business of hacking the MMU notifier code, it
> > would be really great to change the .clear_flush_young() callback so
> > that the architecture could handle the TLB invalidation. At the moment,
> > the core KVM code invalidates the whole VMID courtesy of 'flush_on_ret'
> > being set by kvm_handle_hva_range(), whereas we could do a much
> > lighter-weight and targetted TLBI in the architecture page-table code
> > when we actually update the ptes for small ranges.
> 
> Indeed, and I was looking at this earlier this week as it has a pretty
> devastating effect with NV (it blows the shadow S2 for that VMID, with
> costly consequences).
> 
> In general, it feels like the TLB invalidation should stay with the
> code that deals with the page tables, as it has a pretty good idea of
> what needs to be invalidated and how -- specially on architectures
> that have a HW-broadcast facility like arm64.

Would this be roughly on par with an in-line flush on arm64?  The simpler, more
straightforward solution would be to let architectures override flush_on_ret,
but I would prefer something like the below as x86 can also utilize a range-based
flush when running as a nested hypervisor.

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ff0a20565f90..b65116294efe 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -601,6 +601,7 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
        struct kvm_gfn_range gfn_range;
        struct kvm_memory_slot *slot;
        struct kvm_memslots *slots;
+       bool need_flush = false;
        int i, idx;
 
        if (WARN_ON_ONCE(range->end <= range->start))
@@ -653,10 +654,22 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
                                        break;
                        }
                        r.ret |= range->handler(kvm, &gfn_range);
+
+                       /*
+                        * Use a precise gfn-based TLB flush when possible, as
+                        * most mmu_notifier events affect a small-ish range.
+                        * Fall back to a full TLB flush if the gfn-based flush
+                        * fails, and don't bother trying the gfn-based flush
+                        * if a full flush is already pending.
+                        */
+                       if (range->flush_on_ret && !need_flush && r.ret &&
+                           kvm_arch_flush_remote_tlbs_range(kvm, gfn_range.start
+                                                            gfn_range.end - gfn_range.start + 1))
+                               need_flush = true;
                }
        }
 
-       if (range->flush_on_ret && r.ret)
+       if (need_flush)
                kvm_flush_remote_tlbs(kvm);
 
        if (r.found_memslot)


