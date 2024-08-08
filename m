From: Steven Price <steven.price@arm.com>
Date: Thu, 8 Aug 2024 10:54:20 +0100
Subject: [PATCH v12 01/84] KVM: arm64: Release pfn, i.e. put page, if
 copying MTE tags hits ZONE_DEVICE
In-Reply-To: <ZrOBg70pCnv7PHyK@arm.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-2-seanjc@google.com> <ZrOBg70pCnv7PHyK@arm.com>
Message-ID: <34468ff8-2159-4adb-b680-c6048eecee80@arm.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 07/08/2024 15:15, Catalin Marinas wrote:
> On Fri, Jul 26, 2024 at 04:51:10PM -0700, Sean Christopherson wrote:
>> Put the page reference acquired by gfn_to_pfn_prot() if
>> kvm_vm_ioctl_mte_copy_tags() runs into ZONE_DEVICE memory.  KVM's less-
>> than-stellar heuristics for dealing with pfn-mapped memory means that KVM
>> can get a page reference to ZONE_DEVICE memory.
>>
>> Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> ---
>>  arch/arm64/kvm/guest.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
>> index 11098eb7eb44..e1f0ff08836a 100644
>> --- a/arch/arm64/kvm/guest.c
>> +++ b/arch/arm64/kvm/guest.c
>> @@ -1059,6 +1059,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>>  		page = pfn_to_online_page(pfn);
>>  		if (!page) {
>>  			/* Reject ZONE_DEVICE memory */
>> +			kvm_release_pfn_clean(pfn);
>>  			ret = -EFAULT;
>>  			goto out;
>>  		}
> 
> This patch makes sense irrespective of whether the above pfn is a
> ZONE_DEVICE or not. gfn_to_pfn_prot() increased the page refcount via
> GUP, so it must be released before bailing out of this loop.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 

Yep, as Catalin says, this is an 'obviously' correct fix - the reference
needs releasing before bailing out. The comment there is perhaps
misleading - it's not just ZONE_DEVICE memory that will be rejected, but
this is the case that was in my mind when I wrote it. Although clearly I
wasn't thinking hard enough when writing the code in the first place... ;)

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,

Steve

