From: Sean Christopherson <seanjc@google.com>
Date: Mon, 4 Nov 2024 21:53:48 -0800
Subject: [PATCH v3 00/14] KVM: selftests: Morph max_guest_mem to mmu_stress
In-Reply-To: <173039503553.1508387.3074658713815866060.b4-ty@google.com>
References: <20241009154953.1073471-1-seanjc@google.com> <173039503553.1508387.3074658713815866060.b4-ty@google.com>
Message-ID: <Zymy7M5dHs6dWUmu@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 31, 2024, Sean Christopherson wrote:
> On Wed, 09 Oct 2024 08:49:39 -0700, Sean Christopherson wrote:
> > The main purpose of this series is to convert the max_guest_memory_test
> > into a more generic mmu_stress_test.  The basic gist of the "conversion"
> > is to have the test do mprotect() on guest memory while vCPUs are
> > accessing said memory, e.g. to verify KVM and mmu_notifiers are working
> > as intended.
> > 
> > Patches 1-4 are a somewhat unexpected side quest.  The original plan was
> > that patch 3 would be a single patch, but things snowballed.
> > 
> > [...]
> 
> Applied to kvm-x86 selftests, with the typo fixup pointed out by James.  Thanks!
> 
> [01/14] KVM: Move KVM_REG_SIZE() definition to common uAPI header
>         https://github.com/kvm-x86/linux/commit/5e07fd0bf516
> [02/14] KVM: selftests: Disable strict aliasing
>         https://github.com/kvm-x86/linux/commit/d1ce2bcd8d2e
> [03/14] KVM: selftests: Return a value from vcpu_get_reg() instead of using an out-param
>         https://github.com/kvm-x86/linux/commit/5c6c7b71a45c
> [04/14] KVM: selftests: Assert that vcpu_{g,s}et_reg() won't truncate
>         https://github.com/kvm-x86/linux/commit/6aa2df3eb90b
> [05/14] KVM: selftests: Check for a potential unhandled exception iff KVM_RUN succeeded
>         https://github.com/kvm-x86/linux/commit/be9f2746d20b
> [06/14] KVM: selftests: Rename max_guest_memory_test to mmu_stress_test
>         https://github.com/kvm-x86/linux/commit/06694f27cfcc
> [07/14] KVM: selftests: Only muck with SREGS on x86 in mmu_stress_test
>         https://github.com/kvm-x86/linux/commit/8556ce365a07
> [08/14] KVM: selftests: Compute number of extra pages needed in mmu_stress_test
>         https://github.com/kvm-x86/linux/commit/c7b7876ac5d4
> [09/14] KVM: sefltests: Explicitly include ucall_common.h in mmu_stress_test.c
>         https://github.com/kvm-x86/linux/commit/a657856469e1
> [10/14] KVM: selftests: Enable mmu_stress_test on arm64
>         https://github.com/kvm-x86/linux/commit/1e53cde06102
> [11/14] KVM: selftests: Use vcpu_arch_put_guest() in mmu_stress_test
>         https://github.com/kvm-x86/linux/commit/8630563012b9
> [12/14] KVM: selftests: Precisely limit the number of guest loops in mmu_stress_test
>         https://github.com/kvm-x86/linux/commit/3d4585c220dc
> [13/14] KVM: selftests: Add a read-only mprotect() phase to mmu_stress_test
>         https://github.com/kvm-x86/linux/commit/eaafeebca75a
> [14/14] KVM: selftests: Verify KVM correctly handles mprotect(PROT_READ)
>         https://github.com/kvm-x86/linux/commit/a3cd5c187742

As mentioned later in the thread[*], I dropped this series from the 6.13 queue
and will instead target 6.14.

I did however grab the no-strict-aliasing fix for 6.12, and tagged it for stable.
There's no reason to wait to land that commit, and I definitely have no desire to
ever debug that mess again.

[02/14] KVM: selftests: Disable strict aliasing
      https://github.com/kvm-x86/linux/commit/5b188cc4866a

[*] https://lore.kernel.org/all/ZyT61FF0-g8gKZfc at google.com

