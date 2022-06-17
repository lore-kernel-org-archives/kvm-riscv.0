From: Sean Christopherson <seanjc@google.com>
Date: Fri, 17 Jun 2022 18:34:59 +0000
Subject: [PATCH v6 21/22] KVM: Allow for different capacities in
 kvm_mmu_memory_cache structs
In-Reply-To: <Yqy84GkGAdE1BzI6@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-22-dmatlack@google.com>
 <Yqy84GkGAdE1BzI6@google.com>
Message-ID: <YqzJUxrW67vACltI@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 17, 2022, Sean Christopherson wrote:
> On Mon, May 16, 2022, David Matlack wrote:
> > -int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
> > +static int __kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int capacity, int min)
> 
> I still find it somewhat kludgy to have callers provide an capacity.  It's not
> terrible while there's only a single call site, but if a use case comes along
> for using an oversized cache with multiple call sites, it'll be gross.
> 
> Tweaking my idea of a "custom" wrapper, what about adding an "oversized" wrapper?
> That yields clear, firm rules on when to use each helper, guards against calling
> the "standard" flavor with an impossible @min, and addresses Mingwei's concern
> that a misguided user could specify a nonsensically small capacity.

Drat, arguing against my own idea.

The future usage in nested_mmu_try_split_huge_page() is going to be inefficient.
By having capacity==min, consuming just one entry, which is guaranteed when a
huge page split is successful, will mean the cache needs to be topped up.  In other
words, I'm pretty sure need_topup_split_caches_or_resched() will always return
true between different huge pages and so KVM will drop mmu_lock and reschedule
after every huge page.  Maybe that's not a big deal, but at the very least it's
odd, and its a nasty gotcha with forcing capacity==min.

So I'm ok with this patch, though it should yell if min > capacity.

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 932abb4fb67e..14e807501229 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -388,7 +388,7 @@ int __kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int capacity,
                return 0;

        if (unlikely(!mc->objects)) {
-               if (WARN_ON_ONCE(!capacity))
+               if (WARN_ON_ONCE(!capacity || min > capacity))
                        return -EIO;

                mc->objects = kvmalloc_array(sizeof(void *), capacity, gfp);

