From: Xiaoyao Li <xiaoyao.li@intel.com>
Date: Wed, 1 Nov 2023 15:25:23 +0800
Subject: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
In-Reply-To: <ZUEML6oJXDCFJ9fg@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-18-seanjc@google.com>
 <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com>
 <ZUEML6oJXDCFJ9fg@google.com>
Message-ID: <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/31/2023 10:16 PM, Sean Christopherson wrote:
> On Tue, Oct 31, 2023, Xiaoyao Li wrote:
>> On 10/28/2023 2:21 AM, Sean Christopherson wrote:
>>> Extended guest_memfd to allow backing guest memory with transparent
>>> hugepages. Require userspace to opt-in via a flag even though there's no
>>> known/anticipated use case for forcing small pages as THP is optional,
>>> i.e. to avoid ending up in a situation where userspace is unaware that
>>> KVM can't provide hugepages.
>>
>> Personally, it seems not so "transparent" if requiring userspace to opt-in.
>>
>> People need to 1) check if the kernel built with TRANSPARENT_HUGEPAGE
>> support, or check is the sysfs of transparent hugepage exists; 2)get the
>> maximum support hugepage size 3) ensure the size satisfies the alignment;
>> before opt-in it.
>>
>> Even simpler, userspace can blindly try to create guest memfd with
>> transparent hugapage flag. If getting error, fallback to create without the
>> transparent hugepage flag.
>>
>> However, it doesn't look transparent to me.
> 
> The "transparent" part is referring to the underlying kernel mechanism, it's not
> saying anything about the API.  The "transparent" part of THP is that the kernel
> doesn't guarantee hugepages, i.e. whether or not hugepages are actually used is
> (mostly) transparent to userspace.
> 
> Paolo also isn't the biggest fan[*], but there are also downsides to always
> allowing hugepages, e.g. silent failure due to lack of THP or unaligned size,
> and there's precedent in the form of MADV_HUGEPAGE.
> 
> [*] https://lore.kernel.org/all/84a908ae-04c7-51c7-c9a8-119e1933a189 at redhat.com

But it's different than MADV_HUGEPAGE, in a way. Per my understanding, 
the failure of MADV_HUGEPAGE is not fatal, user space can ignore it and 
continue.

However, the failure of KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is fatal, which 
leads to failure of guest memfd creation.

For current implementation, I think maybe 
KVM_GUEST_MEMFD_DESIRE_HUGEPAGE fits better than 
KVM_GUEST_MEMFD_ALLOW_HUGEPAGE? or maybe *PREFER*?

