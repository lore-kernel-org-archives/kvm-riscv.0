From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 10 Dec 2021 15:53:04 +0100
Subject: [PATCH v5 08/12] KVM: Reinstate gfn_to_pfn_cache with
 invalidation support
In-Reply-To: <5d0a68cd0d06884a2a58338aace811144990f8f5.camel@infradead.org>
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <20211121125451.9489-9-dwmw2@infradead.org>
 <b1bacc6f-be56-4108-6e52-4315a021184b@redhat.com>
 <b614d9ae0fe7910cfa72eee0b4077776f8012e5f.camel@infradead.org>
 <6cb2cd57-16f3-d0ec-adf6-cb8fdcbae035@redhat.com>
 <5d0a68cd0d06884a2a58338aace811144990f8f5.camel@infradead.org>
Message-ID: <2d864e94-1bae-4cc2-7242-676ef102398f@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/10/21 13:25, David Woodhouse wrote:
> On Thu, 2021-12-09 at 23:34 +0100, Paolo Bonzini wrote:
>>
>> Compared to the review it's missing this hunk:
>>
>> @@ -265,7 +265,7 @@ void kvm_gfn_to_pfn_cache_unmap(struct kvm *kvm, struct gfn_to_pfn_cache *gpc)
>>
>>          gpc->valid = false;
>>
>> -       old_khva = gpc->khva;
>> +       old_khva = (void *)((unsigned long)gpc->khva & ~PAGE_MASK);
>>          old_dirty = gpc->dirty;
> 
> Do you know what? I couldn't bring myself to add that a second time. I
> managed it once, but it made me sad.
> 
> Did it like this instead:
> 
> -       old_khva = gpc->khva;
> +       old_khva = gpc->khva - offset_in_page(gpc->khva);

Very nice, and it would have deserved a macro in include/linux if there 
wasn't a decent way to write it.

> I checked that for me at least, GCC is clever enough to just do the
> mask.
> 
>          old_khva = gpc->khva - offset_in_page(gpc->khva);
>   131:   48 8b 43 78             mov    0x78(%rbx),%rax
>   135:   48 25 00 f0 ff ff       and    $0xfffffffffffff000,%rax
> 
> 
> I still don't see the previous patches in kvm/next ? is that an
> automatic push after testing has passed, or is the kernel.org
> infrastructure just *really* slow?

No, it's me really wanting to send out the -rc5 pull request before the 
weekend.  Just wait five more minutes.

Paolo

> I've pushed based on the currently-visible kvm/next to
> https://git.infradead.org/users/dwmw2/linux.git/shortlog/refs/heads/xen-evtchn
> and can resend when the tree finally surfaces.
> 


