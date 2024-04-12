From: David Hildenbrand <david@redhat.com>
Date: Fri, 12 Apr 2024 22:01:03 +0200
Subject: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
In-Reply-To: <CABgObfYwwXy9gQap-PJyOrVCcUr-VfK90AKNaRe0VO-G00G8SQ@mail.gmail.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
 <20240405115815.3226315-2-pbonzini@redhat.com> <ZhP3hDhe2Qwo9oCL@x1n>
 <CABgObfYwwXy9gQap-PJyOrVCcUr-VfK90AKNaRe0VO-G00G8SQ@mail.gmail.com>
Message-ID: <5ed763c2-7e01-4c31-923c-ba62f0d0e993@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11.04.24 18:55, Paolo Bonzini wrote:
> On Mon, Apr 8, 2024 at 3:56?PM Peter Xu <peterx@redhat.com> wrote:
>> Paolo,
>>
>> I may miss a bunch of details here (as I still remember some change_pte
>> patches previously on the list..), however not sure whether we considered
>> enable it?  Asked because I remember Andrea used to have a custom tree
>> maintaining that part:
>>
>> https://github.com/aagit/aa/commit/c761078df7a77d13ddfaeebe56a0f4bc128b1968
> 
> The patch enables it only for KSM, so it would still require a bunch
> of cleanups, for example I also would still use set_pte_at() in all
> the places that are not KSM. This would at least fix the issue with
> the poor documentation of where to use set_pte_at_notify() vs
> set_pte_at().
> 
> With regard to the implementation, I like the idea of disabling the
> invalidation on the MMU notifier side, but I would rather have
> MMU_NOTIFIER_CHANGE_PTE as a separate field in the range instead of
> overloading the event field.
> 
>> Maybe it can't be enabled for some reason that I overlooked in the current
>> tree, or we just decided to not to?
> 
> I have just learnt about the patch, nobody had ever mentioned it even
> though it's almost 2 years old... It's a lot of code though and no one

I assume Andrea used it on his tree where he also has a version of 
"randprotect" (even included in that commit subject) to mitigate a KSM 
security issue that was reported by some security researchers [1] a 
while ago. From what I recall, the industry did not end up caring about 
that security issue that much.

IIUC, with "randprotect" we get a lot more R/O protection even when not 
de-duplicating a page -- thus the name. Likely, the reporter mentioned 
in the commit is a researcher that played with Andreas fix for the 
security issue. But I'm just speculating at this point :)

> has ever reported an issue for over 10 years, so I think it's easiest
> to just rip the code out.

Yes. Can always be readded in a possibly cleaner fashion (like you note 
above), when deemed necessary and we are willing to support it.

[1] https://gruss.cc/files/remote_dedup.pdf

-- 
Cheers,

David / dhildenb


