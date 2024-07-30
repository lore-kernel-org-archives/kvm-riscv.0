From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 30 Jul 2024 13:52:15 +0200
Subject: [PATCH v12 00/84] KVM: Stop grabbing references to PFNMAP'd pages
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <419ea6ce-83ca-413e-936c-1935e2c51497@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/27/24 01:51, Sean Christopherson wrote:
> arm64 folks, the first two patches are bug fixes, but I have very low
> confidence that they are correct and/or desirable.  If they are more or
> less correct, I can post them separately if that'd make life easier.  I
> included them here to avoid conflicts, and because I'm pretty sure how
> KVM deals with MTE tags vs. dirty logging will impact what APIs KVM needs
> to provide to arch code.
> 
> On to the series...  The TL;DR is that I would like to get input on two
> things:
> 
>   1. Marking folios dirty/accessed only on the intial stage-2 page fault
>   2. The new APIs for faulting, prefetching, and doing "lookups" on pfns

Wow!

Splitting out prefetching makes a lot of sense, as it's the only one 
with npages > 1 and it doesn't need all the complexity of hva_to_pfn().

I've left a comment on the lookup API, which is probably the only one 
that can be simplified further.

The faulting API looks good as a first iteration.  Code-wise, 
kvm_resolve_pfn() is probably unnecessary at the end of the series but I 
can see why you had to restrain yourself and declare it done. :)

An interesting evolution of the API could be to pass a struct 
kvm_follow_pfn pointer to {,__}kvm_faultin_pfn() and __gfn_to_page() 
(the "constructors"); and on the other side to 
kvm_release_faultin_page() and kvm_release_page_*().  The struct 
kvm_follow_pfn could be embedded in the (x86) kvm_page_fault and 
(generic) kvm_host_map structs.  But certainly not as part of this 
already huge work.

Paolo


