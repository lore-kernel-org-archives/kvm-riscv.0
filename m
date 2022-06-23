From: David Matlack <dmatlack@google.com>
Date: Thu, 23 Jun 2022 23:50:45 +0000
Subject: [PATCH v7 00/23] KVM: Extend Eager Page Splitting to the shadow
 MMU
In-Reply-To: <20220622192710.2547152-1-pbonzini@redhat.com>
References: <20220622192710.2547152-1-pbonzini@redhat.com>
Message-ID: <YrT8Vcr2sXcm3NPB@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 22, 2022 at 03:26:47PM -0400, Paolo Bonzini wrote:
> For the description of the "why" of this patch, I'll just direct you to
> David's excellent cover letter from v6, which can be found at
> https://lore.kernel.org/r/20220516232138.1783324-1-dmatlack at google.com.
> 
> This version mostly does the following:
> 
> - apply the feedback from Sean and other reviewers, which is mostly
>   aesthetic
> 
> - replace the refactoring of drop_large_spte()/__drop_large_spte()
>   with my own version.  The insight there is that drop_large_spte()
>   is always followed by {,__}link_shadow_page(), so the call is
>   moved there
> 
> - split the TLB flush optimization into a separate patch, mostly
>   to perform the previous refactoring independent of the optional
>   TLB flush
> 
> - rename a few functions from *nested_mmu* to *shadow_mmu*
> 

Thanks for the v7 Paolo!

