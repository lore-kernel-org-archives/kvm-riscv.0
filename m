From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 31 Jul 2024 12:12:37 +0200
Subject: [PATCH v12 45/84] KVM: guest_memfd: Provide "struct page" as
 output from kvm_gmem_get_pfn()
In-Reply-To: <ZqlGcaESdxw5vzl8@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-46-seanjc@google.com>
 <2da6b57e-d5c2-4016-b89b-d51700eeb845@redhat.com>
 <ZqlGcaESdxw5vzl8@google.com>
Message-ID: <10429875-b9a1-4454-b54a-1c3be5630771@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/30/24 22:00, Sean Christopherson wrote:
> The probability of guest_memfd not having struct page for mapped pfns is likely
> very low, but at the same time, providing a pfn+page pair doesn't cost us much.
> And if it turns out that not having struct page is nonsensical, deferring the
> kvm_gmem_get_pfn() => kvm_gmem_get_page() conversion could be annoying, but highly
> unlikely to be painful since it should be 100% mechanical.  Whereas reverting back
> to kvm_gmem_get_pfn() if we make the wrong decision now could mean doing surgery
> on a pile of arch code.

Ok, fair enough.  The conflict resolution is trivial either way (I also 
checked the TDX series and miraculously it has only one conflict which 
is also trivial).

Paolo


