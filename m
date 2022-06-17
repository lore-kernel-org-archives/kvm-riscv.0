From: Sean Christopherson <seanjc@google.com>
Date: Fri, 17 Jun 2022 16:56:11 +0000
Subject: [PATCH v6 18/22] KVM: x86/mmu: Extend
 make_huge_page_split_spte() for the shadow MMU
In-Reply-To: <20220516232138.1783324-19-dmatlack@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-19-dmatlack@google.com>
Message-ID: <YqyyK5C1PaByJur2@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 16, 2022, David Matlack wrote:
> Currently make_huge_page_split_spte() assumes execute permissions can be
> granted to any 4K SPTE when splitting huge pages. This is true for the
> TDP MMU but is not necessarily true for the shadow MMU, since KVM may be
> shadowing a non-executable huge page.
> 
> To fix this, pass in the role of the child shadow page where the huge
> page will be split and derive the execution permission from that.  This
> is correct because huge pages are always split with direct shadow page
> and thus the shadow page role contains the correct access permissions.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>

