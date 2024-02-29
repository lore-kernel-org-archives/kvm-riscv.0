From: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Feb 2024 16:55:36 -0800
Subject: [PATCH v9 00/11] KVM: selftests: Add SEV and SEV-ES smoke tests
In-Reply-To: <Zd-2VK2kvMr_t1jx@google.com>
References: <20240223004258.3104051-1-seanjc@google.com> <170900037528.3692126.18029642068469384283.b4-ty@google.com>
 <Zd-2VK2kvMr_t1jx@google.com>
Message-ID: <Zd_WCJtlPpJVDcyg@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 28, 2024, Sean Christopherson wrote:
> FYI, the hashes changed due to a force push to squash a bug in a different
> series.
> 
> [1/11] KVM: selftests: Extend VM creation's @shape to allow control of VM subtype
>       https://github.com/kvm-x86/linux/commit/126190379c57
> [2/11] KVM: selftests: Make sparsebit structs const where appropriate
>       https://github.com/kvm-x86/linux/commit/35f50c91c43e
> [3/11] KVM: selftests: Add a macro to iterate over a sparsebit range
>       https://github.com/kvm-x86/linux/commit/57e19f057758
> [4/11] KVM: selftests: Add support for allocating/managing protected guest memory
>       https://github.com/kvm-x86/linux/commit/cd8eb2913205
> [5/11] KVM: selftests: Add support for protected vm_vaddr_* allocations
>       https://github.com/kvm-x86/linux/commit/d210eebb51a2
> [6/11] KVM: selftests: Explicitly ucall pool from shared memory
>       https://github.com/kvm-x86/linux/commit/31e00dae72fd
> [7/11] KVM: selftests: Allow tagging protected memory in guest page tables
>       https://github.com/kvm-x86/linux/commit/bf47e87c65be
> [8/11] KVM: selftests: Add library for creating and interacting with SEV guests
>       https://github.com/kvm-x86/linux/commit/bdceeebcddb8
> [9/11] KVM: selftests: Use the SEV library APIs in the intra-host migration test
>       https://github.com/kvm-x86/linux/commit/8b174eb9d289
> [10/11] KVM: selftests: Add a basic SEV smoke test
>       https://github.com/kvm-x86/linux/commit/faa0d7027de3
> [11/11] KVM: selftests: Add a basic SEV-ES smoke test
>       https://github.com/kvm-x86/linux/commit/974ba6f0e595

That didn't last long.  I forgot that I needed to change the include guards in
kvm_util_arch.h.  New-new hashes:

[1/11] KVM: selftests: Extend VM creation's @shape to allow control of VM subtype
      https://github.com/kvm-x86/linux/commit/126190379c57
[2/11] KVM: selftests: Make sparsebit structs const where appropriate
      https://github.com/kvm-x86/linux/commit/35f50c91c43e
[3/11] KVM: selftests: Add a macro to iterate over a sparsebit range
      https://github.com/kvm-x86/linux/commit/57e19f057758
[4/11] KVM: selftests: Add support for allocating/managing protected guest memory
      https://github.com/kvm-x86/linux/commit/cd8eb2913205
[5/11] KVM: selftests: Add support for protected vm_vaddr_* allocations
      https://github.com/kvm-x86/linux/commit/d210eebb51a2
[6/11] KVM: selftests: Explicitly ucall pool from shared memory
      https://github.com/kvm-x86/linux/commit/31e00dae72fd
[7/11] KVM: selftests: Allow tagging protected memory in guest page tables
      https://github.com/kvm-x86/linux/commit/be1bd4c5394f
[8/11] KVM: selftests: Add library for creating and interacting with SEV guests
      https://github.com/kvm-x86/linux/commit/ae20eef5323c
[9/11] KVM: selftests: Use the SEV library APIs in the intra-host migration test
      https://github.com/kvm-x86/linux/commit/69f8e15ab61f
[10/11] KVM: selftests: Add a basic SEV smoke test
      https://github.com/kvm-x86/linux/commit/be250ff437fa
[11/11] KVM: selftests: Add a basic SEV-ES smoke test
      https://github.com/kvm-x86/linux/commit/40e09b3ccfac

