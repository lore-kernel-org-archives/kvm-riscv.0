From: Marc Zyngier <maz@kernel.org>
Date: Thu, 17 Aug 2023 10:29:21 +0100
Subject: [PATCH v9 00/14] KVM: arm64: Add support for FEAT_TLBIRANGE
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
References: <20230811045127.3308641-1-rananta@google.com>
Message-ID: <169226452281.2753740.2247650864841184971.b4-ty@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 11 Aug 2023 04:51:13 +0000, Raghavendra Rao Ananta wrote:
> In certain code paths, KVM/ARM currently invalidates the entire VM's
> page-tables instead of just invalidating a necessary range. For example,
> when collapsing a table PTE to a block PTE, instead of iterating over
> each PTE and flushing them, KVM uses 'vmalls12e1is' TLBI operation to
> flush all the entries. This is inefficient since the guest would have
> to refill the TLBs again, even for the addresses that aren't covered
> by the table entry. The performance impact would scale poorly if many
> addresses in the VM is going through this remapping.
> 
> [...]

Applied to next, thanks!

[01/14] KVM: Rename kvm_arch_flush_remote_tlb() to kvm_arch_flush_remote_tlbs()
        commit: a1342c8027288e345cc5fd16c6800f9d4eb788ed
[02/14] KVM: Declare kvm_arch_flush_remote_tlbs() globally
        commit: cfb0c08e80120928dda1e951718be135abd49bae
[03/14] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
        commit: 32121c813818a87ba7565b3afce93a9cc3610a22
[04/14] KVM: Remove CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
        commit: eddd21481011008792f4e647a5244f6e15970abc
[05/14] KVM: Allow range-based TLB invalidation from common code
        commit: d4788996051e3c07fadc6d9b214073fcf78810a8
[06/14] KVM: Move kvm_arch_flush_remote_tlbs_memslot() to common code
        commit: 619b5072443c05cf18c31b2c0320cdb42396d411
[07/14] arm64: tlb: Refactor the core flush algorithm of __flush_tlb_range
        commit: 360839027a6e4c022e8cbaa373dd747185f1e0a5
[08/14] arm64: tlb: Implement __flush_s2_tlb_range_op()
        commit: 4d73a9c13aaa78b149ac04b02f0ee7973f233bfa
[09/14] KVM: arm64: Implement __kvm_tlb_flush_vmid_range()
        commit: 6354d15052ec88273c24beae4c99e31c3d3889b6
[10/14] KVM: arm64: Define kvm_tlb_flush_vmid_range()
        commit: 117940aa6e5f8308f1529e1313660980f1dae771
[11/14] KVM: arm64: Implement kvm_arch_flush_remote_tlbs_range()
        commit: c42b6f0b1cde4dd19e6b5dd052e67b87cc331b01
[12/14] KVM: arm64: Flush only the memslot after write-protect
        commit: 3756b6f2bb3a242fef0867b39a23607f5aeca138
[13/14] KVM: arm64: Invalidate the table entries upon a range
        commit: defc8cc7abf0fcee8d73e440ee02827348d060e0
[14/14] KVM: arm64: Use TLBI range-based instructions for unmap
        commit: 7657ea920c54218f123ddc1b572821695b669c13

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



