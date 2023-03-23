From: Sean Christopherson <seanjc@google.com>
Date: Thu, 23 Mar 2023 15:50:28 -0700
Subject: [PATCH v2 0/7] KVM: Add a common API for range-based TLB invalidation
In-Reply-To: <20230126184025.2294823-1-dmatlack@google.com>
References: <20230126184025.2294823-1-dmatlack@google.com>
Message-ID: <167934082066.1939558.14724526021018063522.b4-ty@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 26 Jan 2023 10:40:18 -0800, David Matlack wrote:
> This series introduces a common API for performing range-based TLB
> invalidation. This is then used to supplant
> kvm_arch_flush_remote_tlbs_memslot() and pave the way for two other
> patch series:
> 
> 1. https://lore.kernel.org/kvm/20230109215347.3119271-1-rananta at google.com/
> 
> [...]

Applied the x86 specific cleanups to kvm-x86 mmu.  They're good changes on their
own, I'm quite confident that this series a whole won't be going into 6.4, and I
suspect/hope that getting these into 6.4 will make David's life easier (there are
more cleanups in the related x86 code that I want to get into 6.4).  David, if
I'm wrong, you'll have plenty of time to think of an appropriate punishment ;-)

[3/7] KVM: x86/mmu: Collapse kvm_flush_remote_tlbs_with_{range,address}() together
      https://github.com/kvm-x86/linux/commit/28e4b4597d65
[4/7] KVM: x86/mmu: Rename kvm_flush_remote_tlbs_with_address()
      https://github.com/kvm-x86/linux/commit/8c63e8c21765
[5/7] KVM: x86/MMU: Use gfn_t in kvm_flush_remote_tlbs_range()
      https://github.com/kvm-x86/linux/commit/9d4655da1a4c

--
https://github.com/kvm-x86/linux/tree/next
https://github.com/kvm-x86/linux/tree/fixes

