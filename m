From: Steven Price <steven.price@arm.com>
Date: Thu, 8 Aug 2024 10:54:24 +0100
Subject: [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest
 memory while KVM is dirty logging
In-Reply-To: <ZrOfB8bOdSJVcWFr@arm.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-3-seanjc@google.com> <ZrOfB8bOdSJVcWFr@arm.com>
Message-ID: <fbcbd4da-cab5-420e-b8b6-bf04e27bf69c@arm.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 07/08/2024 17:21, Catalin Marinas wrote:
> On Fri, Jul 26, 2024 at 04:51:11PM -0700, Sean Christopherson wrote:
>> Disallow copying MTE tags to guest memory while KVM is dirty logging, as
>> writing guest memory without marking the gfn as dirty in the memslot could
>> result in userspace failing to migrate the updated page.  Ideally (maybe?),
>> KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
>> and presumably the only use case for copy MTE tags _to_ the guest is when
>> restoring state on the target.
>>
>> Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> ---
>>  arch/arm64/kvm/guest.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
>> index e1f0ff08836a..962f985977c2 100644
>> --- a/arch/arm64/kvm/guest.c
>> +++ b/arch/arm64/kvm/guest.c
>> @@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>>  
>>  	mutex_lock(&kvm->slots_lock);
>>  
>> +	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
>> +		ret = -EBUSY;
>> +		goto out;
>> +	}
> 
> There are ways to actually log the page dirtying but I don't think
> it's worth it. AFAICT, reading the tags still works and that's what's
> used during migration (on the VM where dirty tracking takes place).
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 

Looks sensible to me - my initial thought was "why would a VMM do
that?". But it would make sense to actually return a failure rather than
letting the VMM shoot itself in the foot.

If there's actually a use-case then we could look at making the dirty
tracking work, but I'm not convinced there is a good reason.

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,

Steve

