From: Sean Christopherson <seanjc@google.com>
Date: Fri, 17 Jun 2022 15:30:44 +0000
Subject: [PATCH v6 14/22] KVM: x86/mmu: Pass const memslot to rmap_add()
In-Reply-To: <20220516232138.1783324-15-dmatlack@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-15-dmatlack@google.com>
Message-ID: <YqyeJKMcqkO5zynw@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 16, 2022, David Matlack wrote:

Please restate the shortlog in the changelog, it doesn't require much more typing
and means readers don't have to mentally preserve context across "paragraphs".

  Constify rmap_add()'s @slot parameter, the is just passed on to
  gfn_to_rmap(), which takes a const memslot.

> rmap_add() only uses the slot to call gfn_to_rmap() which takes a const
> memslot.
> 
> No functional change intended.
> 
> Reviewed-by: Ben Gardon <bgardon@google.com>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>

