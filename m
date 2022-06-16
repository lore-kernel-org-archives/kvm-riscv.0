From: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Jun 2022 18:47:08 +0000
Subject: [PATCH v6 03/22] KVM: x86/mmu: Stop passing @direct to
 mmu_alloc_root()
In-Reply-To: <20220516232138.1783324-4-dmatlack@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-4-dmatlack@google.com>
Message-ID: <Yqt6rBPMxfwAPjp1@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 16, 2022, David Matlack wrote:
> The argument @direct is vcpu->arch.mmu->root_role.direct, so just use
> that.

It's worth calling out that, unlike non-root page tables, it's impossible to have
a direct root in an indirect MMU.  I.e. provide a hint as to why there's a need to
pass @direct in the first place.

> Suggested-by: Lai Jiangshan <jiangshanlai@gmail.com>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

