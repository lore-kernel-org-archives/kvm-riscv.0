From: Sean Christopherson <seanjc@google.com>
Date: Mon, 11 Apr 2022 17:12:40 +0000
Subject: [PATCH v3 00/23] KVM: Extend Eager Page Splitting to the shadow
 MMU
In-Reply-To: <20220401175554.1931568-1-dmatlack@google.com>
References: <20220401175554.1931568-1-dmatlack@google.com>
Message-ID: <YlRhiF1O71TWQr5r@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 01, 2022, David Matlack wrote:
> This series extends KVM's Eager Page Splitting to also split huge pages
> mapped by the shadow MMU, i.e. huge pages present in the memslot rmaps.
> This will be useful for configurations that use Nested Virtualization,
> disable the TDP MMU, or disable/lack TDP hardware support.
> 
> For background on Eager Page Splitting, see:
>  - Proposal: https://lore.kernel.org/kvm/CALzav=dV_U4r1K9oDq4esb4mpBQDQ2ROQ5zH5wV3KpOaZrRW-A at mail.gmail.com/
>  - TDP MMU support: https://lore.kernel.org/kvm/20220119230739.2234394-1-dmatlack at google.com/
> 
> Splitting huge pages mapped by the shadow MMU is more complicated than
> the TDP MMU, but it is also more important for performance as the shadow
> MMU handles huge page write-protection faults under the write lock.  See
> the Performance section for more details.
> 
> The extra complexity of splitting huge pages mapped by the shadow MMU
> comes from a few places:

I think we should restrict eager page splitting to the TDP MMU being enabled,
i.e. restrict shadow MMU support to nested MMUs.

A decent chunk of the churn and complexity in this series comes from having to
deal with the intersection of things no one cares about in practice (!TDP shadow
paging), and/or things we should be putting into maintenance-only mode (legacy MMU
with TDP enabled).  I see zero reason to support this for legacy shadow paging
without a very concrete, very performance sensitive use case, and the legacy MMU
with TDP should be a hard "no".

With those out of the way, unsync support can also be jettisoned, because barring
use cases I don't know about, hypervisors don't modify TDP entries in the same way
that kernels modify native page tables, i.e. don't benefit from allowing SPTEs to
go unsync.

The other feature that I think we should deprecate (which I'm pretty sure someone on
our team, maybe even you, is planning on proposing upstream) is support for zapping
KVM shadow pages for the shrinker.  In hindsight, we should have done that a few
years ago instead of fixing the bug that made KVM's support meaningful (see commit
ebdb292dac79 ("KVM: x86/mmu: Batch zap MMU pages when shrinking the slab").  Doing
that for nested MMUs only (or at least first) should be less controversial.

The other thing we want to do sooner than later is improve the scalability of the
nested MMU.  A relatively simple way to pick some juicy low hanging fruit, if we
drop the aforementioned features we don't actually need for nested MMUs, would be
to turn all of the tracking structures needed for handling a page fault into
per-root lists/structures, e.g. active_mmu_pages and mmu_page_hash.  Unless L1 is
doing something funky, there is unlikely to be overlap between nested TDP page
tables, i.e. per-root tracking shouldn't cause a memory explosion.

At that point, as a first step/stopgap toward a more scalable nested MMU implementation,
nested TDP page faults, zapping of obsolete pages (memslot updates), and eager page
splitting (I think) can take mmu_lock for read and then take a per-root spinlock.

At a bare minimum, taking mmu_lock for read would prevent a nested vCPU from blocking
the TDP MMU, which in itself should be a big win.  Zapping after a memslot updates
would not interfere at all with re-faulting memory since zapping the obsolete roots
would never get a lock conflict.  And for use cases that spin up a large number of small
L2 VMs, per-root locking will allow KVM to handle page faults for each L2 in parallel,
which could be a huge performance boost for select use cases.

Circling back to eager page splitting, this series could be reworked to take the
first step of forking FNAME(page_fault), FNAME(fetch) and kvm_mmu_get_page() in
order to provide the necessary path for reworking nested MMU page faults.  Then it
can remove unsync and shrinker support for nested MMUs.  With those gone,
dissecting the nested MMU variant of kvm_mmu_get_page() should be simpler/cleaner
than dealing with the existing kvm_mmu_get_page(), i.e. should eliminate at least
some of the complexity/churn.

> Performance
> -----------
> 
> To measure the performance impact of Eager Page Splitting I ran
> dirty_log_perf_test with tdp_mmu=N, various virtual CPU counts, 1GiB per
> vCPU, and backed by 1GiB HugeTLB memory. The amount of memory that was
> written to versus read was controlled with the -f option.
> 
> To measure the imapct of customer performance, we can look at the time
> it takes all vCPUs to dirty memory after dirty logging has been enabled.
> Without Eager Page Splitting enabled, such dirtying must take faults to
> split huge pages and bottleneck on the MMU lock.
> 
>              | Config: ept=Y, tdp_mmu=N, 100% writes                   |
>              | Config: ept=Y, tdp_mmu=N, 100% writes                   |
>              | Config: ept=Y, tdp_mmu=N, 100% writes initially-all-set |
>              | Config: ept=Y, tdp_mmu=N, 100% writes initially-all-set |
>              | Config: ept=N, tdp_mmu=Y, 100% writes                   |
>              | Config: ept=N, tdp_mmu=Y, 50% writes                    |
>              | Config: ept=N, tdp_mmu=Y, 5% writes                     |

IMO, to justify this there needs to be performance numbers for ept=Y, tdp_mmu=Y,
i.e. for the use case we actually care about.  I don't expect the outcome to be
any different, but it really should be explicitly tested.

