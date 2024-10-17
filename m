From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 17 Oct 2024 19:40:04 +0200
Subject: [PATCH v13 00/85] KVM: Stop grabbing references to PFNMAP'd pages
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
References: <20241010182427.1434605-1-seanjc@google.com>
Message-ID: <CABgObfbQW-3vp=mNcR4giUGZ_gxhuRykvKj8gzBDY7pOg6xdBQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 10, 2024 at 8:24?PM Sean Christopherson <seanjc@google.com> wrote:
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

Here is my own summary of the changes:

patches removed from v12:
01/02 - already upstream
09 - moved to separate A/D series [1]
34 - not needed due to new patch 36
35 - gone after 620525739521376a65a690df899e1596d56791f8

patches added or substantially changed in v13:
05/06/07 - new, suggested by Yan Zhao
08 - code was folded from mmu_spte_age into kvm_rmap_age_gfn_range
14 - new, suggested by me in reply to 84/84 (yuck)
15 - new, suggested by me in reply to 84/84
19 - somewhat rewritten for new follow_pfnmap API
27 - smaller changes due to new follow_pfnmap API
36 - rewritten, suggested by me
45 - new, cleanup
46 - much simplified due to new patch 45

Looks good to me, thanks and congratulations!! Should we merge it in
kvm/next asap?

Paolo

[1] https://patchew.org/linux/20241011021051.1557902-1-seanjc at google.com/20241011021051.1557902-5-seanjc at google.com/


