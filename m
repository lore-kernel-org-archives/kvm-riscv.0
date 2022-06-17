From: Sean Christopherson <seanjc@google.com>
Date: Fri, 17 Jun 2022 16:40:14 +0000
Subject: [PATCH v6 16/22] KVM: x86/mmu: Update page stats in __rmap_add()
In-Reply-To: <20220516232138.1783324-17-dmatlack@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-17-dmatlack@google.com>
Message-ID: <YqyubojzB7zeHag6@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 16, 2022, David Matlack wrote:
> Update the page stats in __rmap_add() rather than at the call site. This
> will avoid having to manually update page stats when splitting huge
> pages in a subsequent commit.
> 
> No functional change intended.
> 
> Reviewed-by: Ben Gardon <bgardon@google.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>

