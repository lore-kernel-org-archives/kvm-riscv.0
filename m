From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Date: Thu, 24 Oct 2024 06:37:28 +0300
Subject: [PATCH v13 00/85] KVM: Stop grabbing references to PFNMAP'd pages
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
References: <20241010182427.1434605-1-seanjc@google.com>
Message-ID: <03c316c7-5268-40cd-af1c-4c8454506ab2@collabora.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/10/24 21:23, Sean Christopherson wrote:
> TL;DR: Eliminate KVM's long-standing (and heinous) behavior of essentially
> guessing which pfns are refcounted pages (see kvm_pfn_to_refcounted_page()).
> 
> Getting there requires "fixing" arch code that isn't obviously broken.
> Specifically, to get rid of kvm_pfn_to_refcounted_page(), KVM needs to
> stop marking pages/folios dirty/accessed based solely on the pfn that's
> stored in KVM's stage-2 page tables.
> 
> Instead of tracking which SPTEs correspond to refcounted pages, simply
> remove all of the code that operates on "struct page" based ona the pfn
> in stage-2 PTEs.  This is the back ~40-50% of the series.
>  
> For x86 in particular, which sets accessed/dirty status when that info
> would be "lost", e.g. when SPTEs are zapped or KVM clears the dirty flag
> in a SPTE, foregoing the updates provides very measurable performance
> improvements for related operations.  E.g. when clearing dirty bits as
> part of dirty logging, and zapping SPTEs to reconstitue huge pages when
> disabling dirty logging.
> 
> The front ~40% of the series is cleanups and prep work, and most of it is
> x86 focused (purely because x86 added the most special cases, *sigh*).
> E.g. several of the inputs to hva_to_pfn() (and it's myriad wrappers),
> can be removed by cleaning up and deduplicating x86 code.
> 
> v13:
>  - Rebased onto v6.12-rc2
>  - Collect reviews. [Alex and others]
>  - Fix a transient bug in arm64 and RISC-V where KVM would leak a page
>    refcount. [Oliver]
>  - Fix a dangling comment. [Alex]
>  - Drop kvm_lookup_pfn(), as the x86 that "needed" it was stupid and is (was?)
>    eliminated in v6.12.
>  - Drop check_user_page_hwpoison(). [Paolo]
>  - Drop the arm64 MTE fixes that went into 6.12.
>  - Slightly redo the guest_memfd interaction to account for 6.12 changes.

Thanks a lot for working on this patchset! I tested it with native
amdgpu/intel contexts and venus/virgl with dGPU and iGPU, no problems
spotted. Please merge sooner, this will unblock lots of new virtio-gpu
features.

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry


