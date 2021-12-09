From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 9 Dec 2021 19:34:45 +0100
Subject: [PATCH v5 00/12] KVM: x86/xen: Add in-kernel Xen event channel
 delivery
In-Reply-To: <20211121125451.9489-1-dwmw2@infradead.org>
References: <20211121125451.9489-1-dwmw2@infradead.org>
Message-ID: <2617aea0-af09-5c0d-1fd7-65e2a814b516@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/21/21 13:54, David Woodhouse wrote:
> Introduce the basic concept of 2 level event channels for kernel delivery,
> which is just a simple matter of a few test_and_set_bit calls on a mapped
> shared info page.
> 
> This can be used for routing MSI of passthrough devices to PIRQ event
> channels in a Xen guest, and we can build on it for delivering IPIs and
> timers directly from the kernel too.
> 
> v1: Use kvm_map_gfn() although I didn't quite see how it works.
> 
> v2: Avoid kvm_map_gfn() and implement a safe mapping with invalidation
>      support for myself.
> 
> v3: Reinvent gfn_to_pfn_cache with sane invalidation semantics, for my
>      use case as well as nesting.
> 
> v4: Rework dirty handling, as it became apparently that we need an active
>      vCPU context to mark pages dirty so it can't be done from the MMU
>      notifier duing the invalidation; it has to happen on unmap.
> 
> v5: Fix sparse warnings reported by kernel test robot<lkp@intel.com>.
> 
>      Fix revalidation when memslots change but the resulting HVA stays
>      the same. We can use the same kernel mapping in that case, if the
>      HVA ? PFN translation was valid before. So that probably means we
>      shouldn't unmap the "old_hva". Augment the test case to exercise
>      that one too.
> 
>      Include the fix for the dirty ring vs. Xen shinfo oops reported
>      by butt3rflyh4ck<butterflyhuangxx@gmail.com>.
> 
> 
> As in the previous two rounds, the last patch (this time patch 12) is
> included as illustration of how we*might*  use this for fixing the UAF
> bugs in nesting, but isn't intended to be applied as-is. Patches 1-11 are.

Queued 1-7, will be on kvm/next tomorrow though.

Paolo

