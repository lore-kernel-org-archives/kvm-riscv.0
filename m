From: David Matlack <dmatlack@google.com>
Date: Tue, 12 Apr 2022 09:49:37 -0700
Subject: [PATCH v3 00/23] KVM: Extend Eager Page Splitting to the shadow
 MMU
In-Reply-To: <YlTKQz8HVPtyfwKe@google.com>
References: <20220401175554.1931568-1-dmatlack@google.com>
 <YlRhiF1O71TWQr5r@google.com>
 <CALzav=f_WY7xH_MV8-gJPAVmj1KjE_LvXupL7aA5n-vCjTETNw@mail.gmail.com>
 <YlSLuZphElMyF2sG@google.com>
 <CALzav=fGucZOZjbVE2+9PZVf1p+jP7GBYDpPph5PoU552LELsw@mail.gmail.com>
 <YlTKQz8HVPtyfwKe@google.com>
Message-ID: <CALzav=dz8rSK6bs8pJ9Vv02Z7aWO+yZ5jAA8+nmLAtJe3SMAsA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 11, 2022 at 5:39 PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Mon, Apr 11, 2022, David Matlack wrote:
> >
> > One thing that would be helpful is if you can explain in a bit more
> > specifically what you'd like to see. Part of the reason why I prefer
> > to sequence your proposal after eager page splitting is that I do not
> > fully understand what you're proposing, and how complex it would be.
> > e.g. Forking FNAME(fetch), FNAME(page_fault), and kvm_mmu_get_page()
> > for nested MMUs does not sound like less churn.
>
> Oh, it's most definitely not less code, and probably more churn.  But, it's churn
> that pushes us in a more favorable direction and that is desirable long term.  I
> don't mind churning code, but I want the churn to make future life easier, not
> harder.  Details below.

Of course. Let's make sure we're on the same page about what churn
introduced by this series will make future life harder that we hope to
avoid. If I understand you correctly, it's the following 2 changes:

 (a.) Using separate functions to allocate SPs and initialize SPs.
 (b.) Separating kvm_mmu_find_shadow_page() from __kvm_mmu_find_shadow_page().

(a.) stems from the fact that SP allocation during eager page
splitting is made directly rather than through kvm_mmu_memory_caches,
which was what you pushed for in the TDP MMU implementation. We could
instead use kvm_mmu_memory_caches for the shadow MMU eager page
splitting to eliminate (a.). But otherwise (a.) is necessary
complexity of eager page splitting because it needs to allocate SPs
differently from the vCPU fault path.

As for (b.), see below...

>
> > From my perspective, this series is a net improvement to the
> > readability and maintainability of existing code, while adding a
> > performance improvement (eager page splitting). All of the changes you
> > are proposing can still be implemented on top if
>
> They can be implemented on top, but I want to avoid inhireting complexity we
> don't actually want/need, unsync support being the most notable.
>
> What I mean by "fork" is that after the cleanups that make sense irrespective of
> eager page splitting, we make a copy of FNAME(page_fault) and add FNAME(get_shadow_page),
> extracting common logic where we can and probably doing something fancy to avoid
> having multiple copies of FNAME(get_shadow_page).  Looking again at the code, it's
> probably best to keep FNAME(fetch), at least for now, as it's only the single unsync
> check that we can purge at this point.
>
> That gives us e.g. FNAME(nested_page_fault) that support EPT and 64-bit NPT, and
> a nested TDP specific get_shadow_page().
>
> Then we rip out the unsync stuff for nested MMUs, which is quite clean because we
> can key off of tdp_enabled.  It'll leave dead code for 32-bit hosts running nested
> VMs, but I highly doubt anyone will notice the perf hit.
>
> At that point, dissect kvm_nested_mmu_get_page() for eager page splitting and
> continue on.
>
> It's not drastically different than what you have now, but it avoids the nastiness
> around unsync pages, e.g. I'm pretty sure kvm_mmu_alloc_shadow_page() can be reused
> as I proposed and the "find" becomes something like:
>
> static struct kvm_mmu_page *kvm_mmu_nested_tdp_find_sp(struct kvm_vcpu *vcpu,
>                                                        gfn_t gfn,
>                                                        unsigned int gfn_hash,
>                                                        union kvm_mmu_page_role role)
> {
>         struct hlist_head *sp_list = &kvm->arch.mmu_page_hash[gfn_hash];
>         struct kvm_mmu_page *sp;
>
>         for_each_valid_sp(kvm, sp, sp_list) {
>                 if (sp->gfn != gfn || sp->role.word != role.word)
>                         continue;
>
>                 __clear_sp_write_flooding_count(sp);
>                 return sp;
>         }
>
>         return NULL;
> }

IIUC all of this would be to avoid separating
kvm_mmu_find_shadow_page() from __kvm_mmu_find_shadow_page() correct?
i.e. Nested MMUs would have their own "find" function, which is called
by eager page splitting, and thus no separate
__kvm_mmu_find_shadow_page().

But __kvm_mmu_find_shadow_page(), as implemented in this series, is
about 90% similar to what you proposed for
kvm_mmu_nested_tdp_find_sp(). And in fact it would work correctly to
use __kvm_mmu_find_shadow_page() for nested MMUs, since we know the
sp->unsync condition would just be skipped.

So even if we did everything you proposed (which seems like an awful
lot just to avoid __kvm_mmu_find_shadow_page()), there's a chance we
would still end up with the exact same code. i.e.
kvm_mmu_nested_tdp_find_sp() would be implemented by calling
__kvm_mmu_find_shadow_page(), because it would be a waste to
re-implement an almost identical function?

>
> Having the separate page fault and get_shadow_page(), without the baggage of unsync
> in particular, sets us up for switching to taking mmu_lock for read, and in the
> distant future, implementing whatever new scheme someone concocts for shadowing
> nested TDP.

Taking MMU read lock with per-root spinlocks for nested MMUs is a
great idea btw. I think it would be a great improvement.

