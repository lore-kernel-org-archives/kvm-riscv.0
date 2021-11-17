From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 17 Nov 2021 18:31:55 +0000
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_08/12=5D_KVM=3A_Propagate_vcpu?=
 =?US-ASCII?Q?_explicitly_to_mark=5Fpage=5Fdirty=5Fin=5Fslot=28=29?=
In-Reply-To: <87pmqy7ir2.wl-maz@kernel.org>
References: <20211117174003.297096-1-dwmw2@infradead.org>
 <20211117174003.297096-9-dwmw2@infradead.org> <87pmqy7ir2.wl-maz@kernel.org>
Message-ID: <63CDC53D-D05A-499B-8694-14E5DA3855FB@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 17 November 2021 18:13:37 GMT, Marc Zyngier <maz@kernel.org> wrote:
>On Wed, 17 Nov 2021 17:39:59 +0000,
>David Woodhouse <dwmw2@infradead.org> wrote:
>> 
>> From: David Woodhouse <dwmw@amazon.co.uk>
>> 
>> The kvm_dirty_ring_get() function uses kvm_get_running_vcpu() to work out
>> which dirty ring to use, but there are some use cases where that doesn't
>> work.
>> 
>> There's one in setting the Xen shared info page, introduced in commit
>> 629b5348841a ("KVM: x86/xen: update wallclock region") and reported by
>> "butt3rflyh4ck" <butterflyhuangxx@gmail.com> in
>> https://lore.kernel.org/kvm/CAFcO6XOmoS7EacN_n6v4Txk7xL7iqRa2gABg3F7E3Naf5uG94g at mail.gmail.com/
>> 
>> There's also about to be another one when the newly-reintroduced
>> gfn_to_pfn_cache needs to mark a page as dirty from the MMU notifier
>> which invalidates the mapping. In that case, we will *know* the vcpu
>> that can be 'blamed' for dirtying the page, and we just need to be
>> able to pass it in as an explicit argument when doing so.
>> 
>> This patch preemptively resolves the second issue, and paves the way
>> for resolving the first. A complete fix for the first issue will need
>> us to switch the Xen shinfo to be owned by a particular vCPU, which
>> will happen in a separate patch.
>> 
>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>> ---
>>  arch/arm64/kvm/mmu.c           |  2 +-
>>  arch/x86/kvm/mmu/mmu.c         |  2 +-
>>  arch/x86/kvm/mmu/spte.c        |  2 +-
>>  arch/x86/kvm/mmu/tdp_mmu.c     |  2 +-
>>  arch/x86/kvm/x86.c             |  4 ++--
>>  include/linux/kvm_dirty_ring.h |  6 ++++--
>>  include/linux/kvm_host.h       |  3 ++-
>>  virt/kvm/dirty_ring.c          |  8 ++++++--
>>  virt/kvm/kvm_main.c            | 18 +++++++++---------
>>  9 files changed, 27 insertions(+), 20 deletions(-)
>
>What's the base for this series? This patch fails to compile for me
>(at least on arm64), and the following patch doesn't apply on -rc1.

kvm/master

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.

