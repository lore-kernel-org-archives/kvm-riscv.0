From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 31 Jul 2024 11:50:38 +0200
Subject: [PATCH v12 84/84] KVM: Don't grab reference on VM_MIXEDMAP pfns
 that have a "struct page"
In-Reply-To: <ZqlLWl0R1p41CS0O@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-85-seanjc@google.com>
 <992c4a07-fb84-42d8-93b3-96fb3a12c8e0@redhat.com>
 <ZqlLWl0R1p41CS0O@google.com>
Message-ID: <57ba7e1d-0121-4d71-89b8-c61c476ca724@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/30/24 22:21, Sean Christopherson wrote:
> On Tue, Jul 30, 2024, Paolo Bonzini wrote:
>> On 7/27/24 01:52, Sean Christopherson wrote:
>>> Now that KVM no longer relies on an ugly heuristic to find its struct page
>>> references, i.e. now that KVM can't get false positives on VM_MIXEDMAP
>>> pfns, remove KVM's hack to elevate the refcount for pfns that happen to
>>> have a valid struct page.  In addition to removing a long-standing wart
>>> in KVM, this allows KVM to map non-refcounted struct page memory into the
>>> guest, e.g. for exposing GPU TTM buffers to KVM guests.
>>
>> Feel free to leave it to me for later, but there are more cleanups that
>> can be made, given how simple kvm_resolve_pfn() is now:
> 
> I'll revisit kvm_resolve_pfn(), Maxim also wasn't a fan of a similar helper that
> existed in v11.

FWIW kvm_resolve_pfn() is totally fine as an intermediate step.  Just 
food for thought for possible follow-ups.

>> Also, check_user_page_hwpoison() should not be needed anymore, probably
>> not since commit 234b239bea39 ("kvm: Faults which trigger IO release the
>> mmap_sem", 2014-09-24) removed get_user_pages_fast() from hva_to_pfn_slow().
> 
> Ha, I *knew* this sounded familiar.  Past me apparently came to the same
> conclusion[*], though I wrongly suspected a memory leak and promptly forgot to
> ever send a patch.  I'll tack one on this time around.

As you prefer.

Paolo


